package com.fangdong.business.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.service.UserService;
import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.FdPicture;
import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.model.SearchParam;
import com.fangdong.business.service.HouseService;
import com.fangdong.business.service.PictureService;
import com.fangdong.business.service.RegionService;
import com.fangdong.common.exception.SQLConnectionFailException;

@Controller
public class HouseController {

	@Resource
	private HouseService houseService;
	@Resource
	private RegionService regionService;
	@Resource
	private PictureService pictureService;
	@Resource
	private UserService userService;

	/**
	 * 房屋业务的主页，展示已经挂上来的房屋 模糊查询整合\通过三种方式查询整合
	 * 
	 * @return
	 */
	@RequestMapping("/house.do")
	public ModelAndView house(HttpServletRequest request, HttpSession session) {
		ModelAndView mov = new ModelAndView("/house/house.jsp");
		// 获取该城市下的所有行政区
		String regionCode = (String) session.getAttribute("regionCode");
		if (regionCode == null) {
			regionCode = "1";
		}
		int cityId = Integer.parseInt(regionCode);
		List<FdRegion> fdRegionResult = regionService.getChildren(regionCode);

		int regionId=Integer.parseInt(regionCode);
		mov.addObject("fdRegionResult", fdRegionResult);// 传子地区信息到jsp前台

		// 检查是否是模糊查询，如果是模糊查询则不进行后面的条件查询
		String type = request.getParameter("type");
		if ((type != null) && (type.equals("fuzzySearch"))) {
			String key = request.getParameter("index-search");
			List<HouseVo> houseList = houseService.fuzzySearch(regionId,key);
			mov.addObject("houseList",houseList);

			return mov;
		}

		// 不是模糊查询，则执行条件查询
		// 获取前台的数据
		String district = request.getParameter("district");
		String rentprice = request.getParameter("rentprice");
		String housetype = request.getParameter("housetype");

		// 组装搜索参数对象
		SearchParam param = new SearchParam();
		if ((district != null) && (!district.equals(""))) {
			param.setDistrictId(Integer.parseInt(district));
		}
		if (rentprice != null) {
			switch (rentprice) {
			case "700L":
				param.setUpperPrice(700);
				break;
			case "700to1000":
				param.setUpperPrice(1000);
				param.setLowerPrice(700);
				break;
			case "1000to1500":
				param.setUpperPrice(1500);
				param.setLowerPrice(1000);
				break;
			case "1500to2000":
				param.setUpperPrice(2000);
				param.setLowerPrice(1500);
				break;
			case "2000M":
				param.setLowerPrice(2000);
				break;
			}
		}
		if (housetype != null) {
			switch (housetype) {
			case "1n1":
				param.setRoomNum(1);
				param.setHallNum(1);
				break;
			case "2n1":
				param.setRoomNum(2);
				param.setHallNum(1);
				break;
			case "2n2":
				param.setRoomNum(2);
				param.setHallNum(2);
				break;
			case "3":
				param.setRoomNum(3);
				break;
			}
		}


		//按参数搜索，并添加结果到视图
		List<HouseVo> houseList = houseService.getHouseList(regionId,param);
		mov.addObject("houseList", houseList);

		// 将上一次的搜索参数返回到响应页面
		mov.addObject("district", district);
		mov.addObject("rentprice", rentprice);
		mov.addObject("housetype", housetype);
		
		return mov;
	}

	/*
	 * //模糊查询
	 * 
	 * @RequestMapping("/fuzzySearch.action") public ModelAndView
	 * fuzzySearch(HttpServletRequest request) throws IOException{ String key =
	 * request.getParameter("index-search"); if(key.indexOf("%")== -1) {
	 * ModelAndView mov = new ModelAndView("/house/house.jsp"); List<HouseVo>
	 * houseVoList = houseService.fuzzySearch(key);
	 * mov.addObject("houseList",houseVoList); return mov; } else { ModelAndView
	 * mov = new ModelAndView("/house/house.jsp"); return mov; } }
	 */

	/**
	 * 创建房屋，出售和出租都在这个页面进行
	 * 
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/house/createHouse.do")
	public String createHouse() {
		return "/house/createHouse.jsp";
	}

	/**
	 * 已在进入createHouse页面时检查登陆情况
	 */
	
	@RequiresAuthentication
	@RequestMapping("/createHouseSubmit.action")
	public ModelAndView createHouseSubmit(HttpServletRequest request, HttpSession session) {
		// 存储house数据
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/house.do");

		String title = request.getParameter("title");
		int rentprice = Integer.parseInt(request.getParameter("rentprice"));
		int room = Integer.parseInt(request.getParameter("room"));
		int hall=Integer.parseInt(request.getParameter("hall"));
		int size = Integer.parseInt(request.getParameter("size"));
		String address = request.getParameter("address");
		String houseDetail = request.getParameter("houseDetail");
		int regionId = Integer.parseInt(request.getParameter("areaId"));
		String facility[] = request.getParameterValues("facility");

		FdHouse house = new FdHouse();
		house.setTitle(title);
		house.setRentPrice(rentprice);
		house.setRoom(room);
		house.setHall(hall);
		house.setSize(size);
		house.setAddress(address);
		house.setHouseDetail(houseDetail);
		house.setRegionId(regionId);
		StringBuilder sb = new StringBuilder();
		for (String f : facility) {
			sb.append(f + ",");
		}
		house.setFacilities(sb.substring(0, sb.length() - 1));
		house.setCreateDate(new Date());

		Subject currentUser = SecurityUtils.getSubject();
		int ownerId=((FdUser)currentUser.getPrincipal()).getId();
		house.setOwnerId(ownerId);
		try {
			houseService.insertHouse(house);
		} catch (Exception e) {
			e.printStackTrace();
			mov.addObject("resultMes", "fail");
			mov.setViewName("messagePage.jsp");
			return mov;
		}

		//存储上传的文件到本地
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> fileList = multiRequest.getFiles("file");
			try {
				pictureService.savePicByHouseId(request.getServletContext().getRealPath("/"),fileList, house.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mov;
	}
	
	@RequestMapping("/house/updateHouse.action")
	public ModelAndView updateHouse(@RequestParam(value="id",required=true)int id){
		ModelAndView mov=  new ModelAndView("/house/createHouse.jsp");
		HouseVo houseVo = houseService.getHouseVoById(id);
		//根据houseid去查询图片
		List<FdPicture> picList = pictureService.getPicsByHouseId(id);
		
		mov.addObject("type","update");
		mov.addObject("houseId",id);
		mov.addObject("house",houseVo);
		mov.addObject("picList",picList);
		return mov;
	}
	
	@RequestMapping("/house/updateHouseSubmit.action")
	public ModelAndView updateHouseSubmit(HttpServletRequest request){
		// 存储house数据
				ModelAndView mov = new ModelAndView();
				mov.setViewName("redirect:/userinfo.do");

				int houseId = Integer.parseInt(request.getParameter("houseId"));
				String title = request.getParameter("title");
				int rentprice = Integer.parseInt(request.getParameter("rentprice"));
				int room = Integer.parseInt(request.getParameter("room"));
				int hall=Integer.parseInt(request.getParameter("hall"));
				int size = Integer.parseInt(request.getParameter("size"));
				String address = request.getParameter("address");
				String houseDetail = request.getParameter("houseDetail");
				int regionId = Integer.parseInt(request.getParameter("areaId"));
				String facility[] = request.getParameterValues("facility");

				FdHouse house = new FdHouse();
				house.setId(houseId);
				house.setTitle(title);
				house.setRentPrice(rentprice);
				house.setRoom(room);
				house.setHall(hall);
				house.setSize(size);
				house.setAddress(address);
				house.setHouseDetail(houseDetail);
				house.setRegionId(regionId);
				StringBuilder sb = new StringBuilder();
				for (String f : facility) {
					sb.append(f + ",");
				}
				house.setFacilities(sb.substring(0, sb.length() - 1));
				house.setCreateDate(new Date());

				Subject currentUser = SecurityUtils.getSubject();
				int ownerId=((FdUser)currentUser.getPrincipal()).getId();
				house.setOwnerId(ownerId);
				
				try {
					houseService.updateHouseById(house);
				} catch (SQLConnectionFailException e) {
					e.printStackTrace();
				}
				
				//存储上传的文件到本地
				CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
						request.getSession().getServletContext());
				
				// 判断 request 是否有文件上传,即多部分请求
				if (multipartResolver.isMultipart(request)) {
					// 转换成多部分request
					MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
					List<MultipartFile> fileList = multiRequest.getFiles("file");
					//先删除原先的图片,如果没有新文件上传则不删除
					if((fileList.size()>0)&&(fileList.get(0).getSize()>0)){
						pictureService.deletePicByHouseId(houseId);
					//在上传新的图片
					try {
						pictureService.savePicByHouseId(request.getServletContext().getRealPath("/"),fileList, house.getId());
					} catch (Exception e) {
						e.printStackTrace();
					}
					}
				}
				return mov;
	}
/*
	/**
	 * 普通用户只能删除自己建的房屋
	 * 
	 * @param request
	 * @return
	 
	@RequiresAuthentication
	@RequestMapping("/deleteHouseSubmit")
	public ModelAndView deleteHouseSubmit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(request.getRequestURI());
		ModelAndView mov = new ModelAndView("/house");

		try {
			houseService.deleteHouseById(id);
		} catch (Exception e) {
			e.printStackTrace();
			mov.addObject("resultMes", "fail");
			mov.setViewName("messagePage.jsp");
			return mov;
		}
		return mov;

	}*/
	//用户info删除房屋
	@RequestMapping("/deleteHome.action")
	public ModelAndView deleteHome(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/userinfo.do");
		try {
			houseService.deleteHouseById(id);
		} catch (Exception e) {
			mov.addObject("error","delete fail");
			e.printStackTrace();
		}
		
		return mov;
	}

	@RequestMapping("/admin/deleteHouse.action")
	public ModelAndView deleteHouse(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/admin/house_manage.do");
		boolean deleteflag = false;
		try {
			// 删房子先删图片
			deleteflag = pictureService.deletePicByHouseId(id);
			houseService.deleteHouseById(id);
		} catch (Exception e) {
			mov.addObject("error", "delete fail,result " + deleteflag);
			e.printStackTrace();
		}

		return mov;
	}

	@RequestMapping("/admin/editHouse.do")
	public ModelAndView editHouse(HttpServletRequest request) {
		String type = request.getParameter("type");
		ModelAndView mov = new ModelAndView("/admin/house_manage_edit.jsp");
		if (type != null && type.equals("create")) {
			mov.addObject("type", "create");
			return mov;
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				HouseVo hv = houseService.getHouseVoById(id);
				// mov.addObject("type","update");
				mov.addObject("house", hv);
			} catch (Exception e) {
				mov.addObject("error", "edit fail");
				e.printStackTrace();
			}
			return mov;
		}
	}

	// 管理员创建房屋
	@RequestMapping("/admin/editHouseSubmit.action")
	public String editHouseSubmit(HttpServletRequest request) {
		String type = request.getParameter("type");

		String title = request.getParameter("title");
		int size = Integer.parseInt(request.getParameter("size"));
		String houseDetail = request.getParameter("houseDetail");
		String address = request.getParameter("address");
		int propertyRights = Integer.parseInt(request.getParameter("propertyRights"));
		int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
		String facility[] = request.getParameterValues("facility");
		int regionId = Integer.parseInt(request.getParameter("regionId"));
		String houseType = request.getParameter("housetype");
		String ownername = request.getParameter("owner");
		int hall = Integer.parseInt(request.getParameter("hall"));
		int room = Integer.parseInt(request.getParameter("room"));

		FdUser owner = userService.selectUserByUserName(ownername);

		FdHouse house = new FdHouse();
		house.setTitle(title);
		house.setSize(size);
		house.setHouseDetail(houseDetail);
		house.setAddress(address);
		house.setPropertyRights(propertyRights);
		house.setRentPrice(rentPrice);
		house.setRegionId(regionId);
		house.setHouseType(houseType);
		house.setHall(hall);
		house.setRoom(room);
		house.setOwnerId(owner.getId());
		StringBuilder sb = new StringBuilder();
		for (String f : facility) {
			sb.append(f + ",");
		}
		house.setFacilities(sb.substring(0, sb.length() - 1));

		// 判断新建房屋
		if ((type != null) && (!type.equals(""))) {
			// 新建房屋
			house.setCreateDate(new Date());
			houseService.createHouse(house);
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			house.setId(id);
			try {
				houseService.updateHouseById(house);
			} catch (SQLConnectionFailException e) {
				e.printStackTrace();
			}
		}

		return "redirect:/admin/house_manage.do";
	}

	// 跳转detail
	@RequestMapping("/house/houseDetail.do")
	public ModelAndView houseDetail(HttpServletRequest request) {
		Integer houseId = Integer.parseInt(request.getParameter("houseid"));
		ModelAndView mov = new ModelAndView("/house/houseDetail.jsp");

		HouseVo houseVo = houseService.getHouseVoById(houseId);
		mov.addObject("house", houseVo);
		List<HouseVo> guessYouLikeList = houseService.guessYouLike(houseVo.getDistrict());
		mov.addObject("guessYouLikeList", guessYouLikeList);
		return mov;
	}

}

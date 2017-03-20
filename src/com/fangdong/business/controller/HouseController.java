package com.fangdong.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.model.FdUser;
import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.service.impl.HouseServiceImpl;

@Controller
public class HouseController {

	@Resource
	private HouseServiceImpl houseService;

	/**
	 * 房屋业务的主页，展示已经挂上来的房屋
	 * 
	 * @return 
	 */
	@RequestMapping("/house.do")
	public ModelAndView house() {
		List<HouseVo> houseList = new ArrayList<HouseVo>();
		houseList = houseService.getHouseList();
		ModelAndView mov = new ModelAndView("/house/house.jsp");
		mov.addObject("houseList", houseList);
		return mov;
	}

	/**
	 * 创建房屋，出售和出租都在这个页面进行
	 * 
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/house/createHouse")
	public String createHouse() {
		return "/house/createHouse.jsp";
	}

	/**
	 * 已在进入createHouse页面时检查登陆情况
	 */
	@RequiresAuthentication
	@RequestMapping("/createHouseSubmit")
	public ModelAndView createHouseSubmit(HttpServletRequest request, HttpSession session) {
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/house");

		String houseType = request.getParameter("house_type");// 民用1商用2
		String address = request.getParameter("address");
		int size = Integer.parseInt(request.getParameter("size"));
		int layout_room = Integer.parseInt(request.getParameter("layout_room"));
		int layout_hall = Integer.parseInt(request.getParameter("layout_hall"));
		int right = Integer.parseInt(request.getParameter("right"));
		String description = request.getParameter("description");

		FdHouse house = new FdHouse();
		house.setAddress(address);
		house.setRoom(layout_room);
		house.setHall(layout_hall);
		house.setCreateDate(new Date());
		house.setHouseType(houseType);
		house.setSize(size);
		house.setPropertyRights(right);
		house.setHouseDetail(description);
		// 插入拥有者id
		FdUser verifiedUser = (FdUser) session.getAttribute("verifiedUser");
		house.setOwnerId(verifiedUser.getId());
		
		try{
			houseService.insertHouse(house);
		}catch(Exception e){
			e.printStackTrace();
			mov.addObject("resultMes", "fail");
			mov.setViewName("messagePage.jsp");
			return mov;
		}

		return mov;
	}
	
	/**
	 * 普通用户只能删除自己建的房屋
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/deleteHouseSubmit")
	public ModelAndView deleteHouseSubmit(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
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
		
	}
	
	@RequestMapping("/house/houseDetail.do")
	public ModelAndView houseDetail(HttpServletRequest request){
		Integer houseId = Integer.parseInt(request.getParameter("houseid"));
		ModelAndView mov = new ModelAndView("/house/houseDetail.jsp");
		
		HouseVo houseVo = houseService.getHouseVoById(houseId);
	    mov.addObject("house",houseVo);
	    
	    return mov;
	}
	
	@RequestMapping("/fuzzySearch.action")
	public ModelAndView fuzzySearch(HttpServletRequest request) throws IOException{
		String key = request.getParameter("index-search");
		if(key.indexOf("%")== -1)
		{
			ModelAndView mov = new ModelAndView("/house/house.jsp");
			List<HouseVo> houseVoList = houseService.fuzzySearch(key);
		    mov.addObject("houseList",houseVoList); 
		    return mov;
		}
		else
		{
			ModelAndView mov = new ModelAndView("/house/house.jsp");
			return mov;
		}
	}
	
	
}

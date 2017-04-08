package com.fangdong.business.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.business.model.FdHotRegion;
import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.HotRegionVo;
import com.fangdong.business.model.RegionVo;
import com.fangdong.business.service.HotRegionService;

@Controller
public class HotRegionController {
	@Resource
	private HotRegionService hotRegionService;
	
	@RequestMapping("/admin/hotRegion.do")
	public ModelAndView hotRegion() {
		ModelAndView mov = new ModelAndView("/admin/hot_region_manage.jsp");
		List<HotRegionVo> hotRegionList=hotRegionService.getAllHotRegion();
		mov.addObject("hotRegionList",hotRegionList);
		return mov;
	}

	@RequestMapping("/admin/delHotRegion.action")
	public String delHotRegion(@RequestParam(value="id",required=true)int id){
		hotRegionService.deleteHotRegionById(id);
		return "redirect:/admin/hotRegion.do";
	}
	
	@RequestMapping("/admin/editHotRegion.do")
	public ModelAndView editRegion(HttpServletRequest request){
		ModelAndView mov = new ModelAndView("/admin/hot_region_manage_edit.jsp");
		String type=request.getParameter("type");
		
		if((type!=null)&&(!type.equals(""))){
			//如果是create，返回一个create标识符
			mov.addObject("type","create");
			return mov;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			HotRegionVo vo=hotRegionService.getHotRegionById(id);
			mov.addObject("hotRegion",vo);
		} catch (Exception e) {
			mov.addObject("error","edit fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	
	@RequestMapping("/admin/editHotRegionSubmit.action")
	public String editRegionSubmit(HttpServletRequest request){
		//判断是否为新建
		String type=request.getParameter("type");
		if((type!=null)&&(type.equals("create"))){
			/*int parentRegionId = Integer.parseInt(request.getParameter("parentRegionId"));
			String regionName = request.getParameter("regionName");*/
			int regionId=Integer.parseInt(request.getParameter("regionId"));
			String hotRegionType=request.getParameter("hotRegionType");
			String hotRegionName=request.getParameter("hotRegionName");
			FdHotRegion hotRegion = new FdHotRegion();
			hotRegion.setHotRegionName(hotRegionName);
			hotRegion.setHotRegionType(hotRegionType);
			hotRegion.setRegionId(regionId);
			try {
				hotRegionService.createHotRegion(hotRegion);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/admin/hotRegion.do";
		}
		
		//如果不是新建，则为更新
		int hotRegionId = Integer.parseInt(request.getParameter("hotRegionId"));
		int regionId=Integer.parseInt(request.getParameter("regionId"));
		String hotRegionType=request.getParameter("hotRegionType");
		String hotRegionName=request.getParameter("hotRegionName");
		FdHotRegion hotRegion = new FdHotRegion();
		hotRegion.setId(hotRegionId);
		hotRegion.setHotRegionName(hotRegionName);
		hotRegion.setHotRegionType(hotRegionType);
		hotRegion.setRegionId(regionId);
		
		try {
			//regionService.updateRegionById(region);
			hotRegionService.updateHotRegion(hotRegion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/hotRegion.do";
	}

}

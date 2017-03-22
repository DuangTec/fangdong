package com.fangdong.business.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.service.UserService;
import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.model.RegionVo;
import com.fangdong.business.service.HouseService;
import com.fangdong.business.service.RegionService;

@Controller
public class RegionController {
	
	@Resource
	private RegionService regionService;
	
	

	@RequestMapping("/admin/deleteRegion.action")
	public ModelAndView deleteRegion(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/admin/area_manage.do");
		try {
			regionService.deleteRegionById(id);
		} catch (Exception e) {
			mov.addObject("error","delete fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	
	@RequestMapping("/admin/editRegion.do")
	public ModelAndView editRegion(HttpServletRequest request){
		ModelAndView mov = new ModelAndView("/admin/area_manage_edit.jsp");
		String type=request.getParameter("type");
		
		if((type!=null)&&(!type.equals(""))){
			//如果是create，返回一个create标识符
			mov.addObject("type","create");
			return mov;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			RegionVo vo=regionService.getRegionById(id);
			mov.addObject("region",vo);
		} catch (Exception e) {
			mov.addObject("error","edit fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	
	@RequestMapping("/admin/editRegionSubmit.action")
	public String editRegionSubmit(HttpServletRequest request){
		//判断是否为新建
		String type=request.getParameter("type");
		if((type!=null)&&(type.equals("create"))){
			int parentRegionId = Integer.parseInt(request.getParameter("parentRegionId"));
			String regionName = request.getParameter("regionName");
			FdRegion region = new FdRegion();
			region.setParentRegId(parentRegionId);
			region.setRegionName(regionName);
			
			try {
				regionService.createRegion(region);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/admin/area_manage.do";
		}
		
		//如果不是新建，则为更新
		int regionId = Integer.parseInt(request.getParameter("regionId"));
		String regionName = request.getParameter("regionName");
		int parentRegionId = Integer.parseInt(request.getParameter("parentRegionId"));
		
		FdRegion region = new FdRegion();
		region.setId(regionId);
		region.setRegionName(regionName);
		region.setParentRegId(parentRegionId);
		
		try {
			regionService.updateRegionById(region);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/area_manage.do";
	}
	
	@ResponseBody
	@RequestMapping("/admin/getParentsRegion.action")
	public List<FdRegion> getParentsRegion(HttpServletRequest request){
		try {
			return regionService.getParentsRegion();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
}

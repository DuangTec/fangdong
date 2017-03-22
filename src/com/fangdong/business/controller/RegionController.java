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
	@Resource
	private HouseService houseService;
	@Resource
	private UserService userService;
	

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
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView("/admin/area_manage_edit.jsp");
		
		try {
			RegionVo vo=regionService.getRegionById(id);
			mov.addObject("region",vo);
		} catch (Exception e) {
			mov.addObject("error","edit fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	
	@ResponseBody
	@RequestMapping("/getParentsRegion.action")
	public List<FdRegion> getParentsRegion(HttpServletRequest request){
		try {
			return regionService.getParentsRegion();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/admin/deleteHouse.action")
	public ModelAndView deleteHouse(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/admin/house_manage.do");
		try {
			houseService.deleteHouseById(id);
		} catch (Exception e) {
			mov.addObject("error","delete fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	
	@RequestMapping("/admin/editHouse.do")
	public ModelAndView editHouse(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView("/admin/area_manage_edit.jsp");
		
		try {
			HouseVo hv=houseService.getHouseVoById(id);
			mov.addObject("houseVo",hv);
		} catch (Exception e) {
			mov.addObject("error","edit fail");
			e.printStackTrace();
		}
		
		return mov;
	}

	@RequestMapping("/admin/deleteUser.action")
	public ModelAndView deleteUser(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/admin/user_manage.do");
		try {
			userService.deleteUserById(id);
		} catch (Exception e) {
			mov.addObject("error","delete fail");
			e.printStackTrace();
		}
		
		return mov;
	}
}

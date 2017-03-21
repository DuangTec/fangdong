package com.fangdong.auth.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.service.UserService;
import com.fangdong.business.model.RegionVo;
import com.fangdong.business.service.RegionService;

@Controller
public class UserPageController {
	@Resource
	private UserService userService;
	@Resource
	private RegionService regionService;
	
	@RequiresRoles("admin")
	@RequestMapping("/admin")
	public String admin(){
		return "/admin/admin.jsp";
	}
	
	@RequiresRoles("admin")
	@RequestMapping("/admin/userManage")
	public ModelAndView userManage(){
		ModelAndView mov = new ModelAndView("/admin/userManage.jsp");
		
		List<FdUser> userList = userService.getAllUser();
		mov.addObject("userList",userList);
		return mov;
	}
	
	@RequiresRoles("admin")
	@RequestMapping("/admin/area_manage.do")
	public ModelAndView regionManage(){
		ModelAndView mov = new ModelAndView("/admin/area_manage.jsp");
		
		try{
		List<RegionVo> regionList= regionService.getAllRegion();
		mov.addObject("regionList",regionList);
		} catch(Exception e){
			e.printStackTrace();
			mov.addObject("error","load region fail");
		}
		return mov;
	}
	
}

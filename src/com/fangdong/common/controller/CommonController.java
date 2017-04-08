package com.fangdong.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.service.UserService;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.service.HouseService;

@Controller
public class CommonController {

	@Resource
	private HouseService houseService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/index.do")
	public ModelAndView index(HttpSession session){
		int regionId=1;
		ModelAndView mov = new ModelAndView("/index.jsp");
		//根据地区获取热门房屋
		String region = (String)session.getAttribute("regionCode");
		if(region!=null){
		regionId=Integer.parseInt(region);
		}
		List<HouseVo> houseList = houseService.getTopHouse(9,regionId);
		mov.addObject("hotHouse",houseList);
		return mov;
	}
	
	@RequestMapping("/changeregion.action")
	public String changeRegion(HttpServletRequest request){
		String regionCode = request.getParameter("region");
		request.getSession().setAttribute("regionCode", regionCode);
		return "redirect:/index.do";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(){
		return new ModelAndView("/login.jsp");
	}
	
	@RequestMapping("/userinfo.do")
	public ModelAndView userInfo(){
		FdUser user1=(FdUser)(SecurityUtils.getSubject().getPrincipal());
		FdUser user=userService.getUserById(user1.getId());
		ModelAndView mov=new ModelAndView("/userinfo.jsp");
		List<HouseVo> house=houseService.getHouseByUserId(user.getId());
		mov.addObject("user",user);
		mov.addObject("house",house);
		return  mov;
	}
	
}

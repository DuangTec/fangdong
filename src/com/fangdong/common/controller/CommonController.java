package com.fangdong.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.business.model.HouseVo;
import com.fangdong.business.service.HouseService;

@Controller
public class CommonController {

	@Resource
	private HouseService houseService;
	
	@RequestMapping("/index.do")
	public ModelAndView index(HttpSession session){
		ModelAndView mov = new ModelAndView("/index.jsp");
		//根据地区获取热门房屋
		String region = (String)session.getAttribute("regionCode");
		int regionId=1;
		if(region!=null){
		regionId=Integer.parseInt(region);
		}
		List<HouseVo> houseList = houseService.getTopHouse(10,regionId);
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
		return new ModelAndView("/userinfo.jsp");
	}
	
}

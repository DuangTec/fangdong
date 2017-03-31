package com.fangdong.business.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.HotRegionVo;
import com.fangdong.business.model.SubwayRegionVo;
import com.fangdong.business.service.SubwayService;

@Controller
public class SubwayController {

	@Resource
	private SubwayService subwayService;
	
	@RequestMapping("/admin/subway.do")
	public ModelAndView subway() {		
		ModelAndView mov = new ModelAndView("/admin/subway.jsp");
		List<FdSubway> subwayList=subwayService.getAllSubway();
		mov.addObject("subwayList",subwayList);
		return mov;
	}
	
	@RequestMapping("/admin/getSubwayRegion.do")
	public ModelAndView getAllSubwayRegion(HttpServletRequest request) {	
		int subwayId=Integer.parseInt(request.getParameter("subwayId"));
		ModelAndView mov = new ModelAndView("/admin/subwayRegion.jsp");
		List<SubwayRegionVo> subwayRegionList=subwayService.getSubwayRegionBySubwayId(subwayId);
		mov.addObject("subwayRegionList",subwayRegionList);
		return mov;
	}
	
	
}

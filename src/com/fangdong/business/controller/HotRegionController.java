package com.fangdong.business.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.business.model.HotRegionVo;
import com.fangdong.business.service.HotRegionService;

@Controller
public class HotRegionController {
	@Resource
	private HotRegionService hotRegionService;
	
	@RequestMapping("/admin/hotRegion.do")
	public ModelAndView hotRegion() {
		ModelAndView mov = new ModelAndView("/admin/hotRegion.jsp");
		List<HotRegionVo> hotRegionList=hotRegionService.getAllHotRegion();
		mov.addObject("hotRegionList",hotRegionList);
		return mov;
	}


}

package com.fangdong.business.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.FdSubwayRegion;
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
	
	@RequestMapping("/admin/subwayDetail.do")
	public ModelAndView subwayDetail(@RequestParam(value="id")int id){
		ModelAndView mov = new ModelAndView("/admin/subwayDetail.jsp");
		List<SubwayRegionVo> subwayRegionList=subwayService.getSubwayRegionBySubwayId(id);
		mov.addObject("subwayRegionList",subwayRegionList);
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
	
	@RequestMapping("/admin/delSubway.action")
	public String delSubway(@RequestParam(value="id",required=true)int id){
		subwayService.deleteSubwayById(id);
		return "redirect:/admin/subway.do";
	}
	
	//修改及创建创建地铁线路
	@RequestMapping("/admin/editSubway.do")
	public ModelAndView editSubway(@RequestParam(value="id",defaultValue="-1")int id,@RequestParam(value="type",required=false)String type){
		ModelAndView mov = new ModelAndView("/admin/editSubway.jsp");
		//如果type为create，则为创建页面，否则为修改
		if((type!=null)&&type.equals("create")){
			mov.addObject("type","create");
			return mov;
		}
		//不是create则根据id查找地铁信息，并添加到响应中去
		FdSubway subway=subwayService.getSubwayById(id);
		mov.addObject("subway",subway);
		
		return mov;
		
	}
	
	@RequestMapping("/admin/editSubwaySubmit.action")
	public String editSubwaySubmit(HttpServletRequest request,@RequestParam(value="id",defaultValue="-1")int id,@RequestParam(value="type",required=false)String type){
		String subwayName=request.getParameter("subwayName");
		//如果是创建，type=create
		if((type!=null)&&(type.equals("create"))){
			FdSubway subway=new FdSubway();
			subway.setSubwayName(subwayName);
			subwayService.createSubway(subway);
		}
		//更新地铁
		if(id!=-1){
			FdSubway subway = new FdSubway();
			subway.setId(id);
			subway.setSubwayName(subwayName);
			subwayService.updateSubwayById(subway);
		}
		return "redirect:/admin/subway.do";
	}
	
	@RequestMapping("/admin/createSubwayRegion.action")
	public String createSubwayRegion(@RequestParam(value="subwayId",required=true)int subwayId,@RequestParam(value="regionId",required=true)int regionId){
		FdSubwayRegion subwayRegion = new FdSubwayRegion();
		subwayRegion.setSubwayId(subwayId);
		subwayRegion.setRegionId(regionId);
		subwayService.createSubwayRegionBySubwayId(subwayRegion);
		
		return "redirect:/admin/subwayDetail.do?id="+subwayId;//返回地铁详情页面。
	}

	
}

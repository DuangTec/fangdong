package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.FdSubwayRegion;
import com.fangdong.business.model.SubwayRegionVo;
import com.fangdong.business.model.SubwayVo;

public interface SubwayService {

	public List<FdSubway> getAllSubway();
	
	public List<SubwayRegionVo> getSubwayRegionBySubwayId(int subwayId);
	
	public FdSubway getSubwayById(int id);
	
	public void createSubway(FdSubway subway);
	
	public void updateSubwayById(FdSubway subway);
	
	public void deleteSubwayById(int id);
	
	public void createSubwayRegionBySubwayId(FdSubwayRegion subwayRegion);
	
}

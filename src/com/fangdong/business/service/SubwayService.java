package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.FdSubwayRegion;
import com.fangdong.business.model.SubwayRegionVo;

public interface SubwayService {

	public List<FdSubway> getAllSubway();
	
	public List<SubwayRegionVo> getSubwayRegionBySubwayId(int subwayId);
}

package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.RegionVo;

public interface RegionService {
	public List<RegionVo> getAllRegion() throws Exception;
	
	public void deleteRegionById(int id) throws Exception;

} 

package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.RegionVo;

public interface RegionService {
	public List<RegionVo> getAllRegion() throws Exception;
	
	public void deleteRegionById(int id) throws Exception;
	
	public void updateRegionById(FdRegion region) throws Exception;
	
	public RegionVo getRegionById(int id) throws Exception;
	
	public List<FdRegion> getParentsRegion() throws Exception;
	
	//传入地区父ID寻找子ID
	public List<FdRegion> getChildren(String fatherId);
} 

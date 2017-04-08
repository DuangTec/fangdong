package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdHotRegion;
import com.fangdong.business.model.HotRegionVo;

public interface HotRegionService {

	public List<HotRegionVo> getAllHotRegion();
	
	public void deleteHotRegionById(int id);
	
	public HotRegionVo getHotRegionById(int id);
	
	public void createHotRegion(FdHotRegion hotRegion);
	
	public boolean updateHotRegion(FdHotRegion hotRegion);

	public List<HotRegionVo> getHotRegionByDistrictId(Integer districtId);
}


package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.HotRegionVo;

public interface HotRegionService {

	public List<HotRegionVo> getAllHotRegion();
	
	public void deleteHotRegionById(int id);
}


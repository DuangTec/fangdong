package com.fangdong.business.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.business.mapper.FdHotRegionMapper;
import com.fangdong.business.model.FdHotRegion;
import com.fangdong.business.model.HotRegionVo;
import com.fangdong.business.service.HotRegionService;
@Service
public class HotRegionServiceImpl implements HotRegionService {

	@Resource
	private FdHotRegionMapper HotRegionMapper;
	
	public List<HotRegionVo> getAllHotRegion() {
		// TODO Auto-generated method stub
		return HotRegionMapper.selectAllHotRegion();
	}

}

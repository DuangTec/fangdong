package com.fangdong.business.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.business.mapper.FdRegionMapper;
import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.RegionVo;
import com.fangdong.business.service.RegionService;

@Service
public class RegionServiceImpl implements RegionService{

	@Resource
	private FdRegionMapper regionMapper;
	
	@Override
	public List<RegionVo> getAllRegion() throws Exception {
		List<RegionVo> resultList = regionMapper.selectAllRegion();
		return resultList;
	}

	@Override
	public void deleteRegionById(int id) throws Exception {
		regionMapper.deleteByPrimaryKey(id);
		
	}

}

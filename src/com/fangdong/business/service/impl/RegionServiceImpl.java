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

	//传入父ID找子ID
	public List<FdRegion> getChildren(String fatherId) {
		List<FdRegion> fdRegionResult=regionMapper.selectChildren(fatherId);
		return fdRegionResult;
	}

	@Override
	public RegionVo getRegionById(int id) throws Exception {
		return regionMapper.selectRegionVoByPrimaryKey(id);
	}

	//获取所有可以作为父地区的地区
	@Override
	public List<FdRegion> getParentsRegion() throws Exception {
		return regionMapper.selectAllParentsRegion();
	}

	@Override
	public void updateRegionById(FdRegion region) throws Exception {
		regionMapper.updateByPrimaryKey(region);
	}

	@Override
	public void createRegion(FdRegion region) throws Exception {
		regionMapper.insert(region);
	}

	@Override
	public List<FdRegion> getSonRegion() throws Exception {
		return regionMapper.selectAllErea();
	}

}

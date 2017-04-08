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
	private FdHotRegionMapper hotRegionMapper;
	
	@Override
	public List<HotRegionVo> getAllHotRegion() {
		return hotRegionMapper.selectAllHotRegion();
	}

	@Override
	public void deleteHotRegionById(int id) {
		hotRegionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public HotRegionVo getHotRegionById(int id) {
		return hotRegionMapper.selectHotRegionById(id);	
	}

	@Override
	public void createHotRegion(FdHotRegion hotRegion) {
		hotRegionMapper.insertSelective(hotRegion);
	}

	@Override
	public boolean updateHotRegion(FdHotRegion hotRegion) {
		int i=hotRegionMapper.updateByPrimaryKey(hotRegion);
		if(i==0)
		{return false;}
		return true;
	}

	@Override
	public List<HotRegionVo> getHotRegionByDistrictId(Integer districtId) {
		return hotRegionMapper.selectHotRegionByDistrictId(districtId);
	}

}

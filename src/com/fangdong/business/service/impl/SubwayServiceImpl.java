package com.fangdong.business.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.business.mapper.FdSubwayMapper;
import com.fangdong.business.mapper.FdSubwayRegionMapper;
import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.SubwayRegionVo;
import com.fangdong.business.service.SubwayService;
@Service
public class SubwayServiceImpl implements SubwayService {

	@Resource
	private FdSubwayMapper subwayMapper;
	@Resource
	private FdSubwayRegionMapper subwayRegionMapper;
	//这里获取的是所有的地铁
	@Override
	public List<FdSubway> getAllSubway() {
		return subwayMapper.selectAllSubway();
	}
	@Override
	public List<SubwayRegionVo> getSubwayRegionBySubwayId(int subwayId) {
		return subwayRegionMapper.selectSubwayRegionBySubwayId(subwayId);
	}
	@Override
	public void deleteSubwayById(int id) {
		//删除subwayRegion表中的数据
		subwayRegionMapper.deleteBySubwayId(id);
		//删除subway表中的数据
		subwayMapper.deleteByPrimaryKey(id);
	}

}

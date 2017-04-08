package com.fangdong.business.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.fangdong.business.mapper.FdSubwayMapper;
import com.fangdong.business.mapper.FdSubwayRegionMapper;
import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.FdSubwayRegion;
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
	@Override
	public FdSubway getSubwayById(int id) {
		return subwayMapper.selectByPrimaryKey(id);
	}
	@Override
	public void createSubway(FdSubway subway) {
		subwayMapper.insertSelective(subway);
	}
	@Override
	public void updateSubwayById(FdSubway subway) {
		subwayMapper.updateByPrimaryKeySelective(subway);
	}
	@Override
	public void createSubwayRegionBySubwayId(FdSubwayRegion subwayRegion) {
		subwayRegionMapper.insertSelective(subwayRegion);
	}
	@Override

	public List<FdSubway> getSubwayByRegionCode(Integer regionCode) {
		return subwayMapper.selectSubwayByRegionCode(regionCode);
	}

	public void delSubwayRegionById(int id) {
		// TODO Auto-generated method stub
		subwayRegionMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int getSubwayIdBySubwayRegionId(int id) {
		// TODO Auto-generated method stub
		FdSubwayRegion a=subwayRegionMapper.selectByPrimaryKey(id);
		return a.getSubwayId();

	}
	
}
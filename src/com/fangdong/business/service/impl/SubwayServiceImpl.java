package com.fangdong.business.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.business.mapper.FdSubwayMapper;
import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.SubwayVo;
import com.fangdong.business.service.SubwayService;
@Service
public class SubwayServiceImpl implements SubwayService {

	@Resource
	private FdSubwayMapper subwayMapper;
	public List<SubwayVo> getAllSubwayService() {
		// TODO Auto-generated method stub
		return subwayMapper.selectAllSubway();
	}

}

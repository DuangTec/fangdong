package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.HouseVo;
import com.fangdong.common.exception.SQLConnectionFailException;

public interface HouseService {
	public List<HouseVo> getHouseList();
	public void insertHouse(FdHouse house) throws SQLConnectionFailException;
	public void deleteHouseById(int id) throws SQLConnectionFailException;
	public HouseVo getHouseVoById(int id);
	public List<HouseVo> getTopHouse(int top,int regionId);
}

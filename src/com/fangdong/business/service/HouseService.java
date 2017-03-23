package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.model.SearchParam;
import com.fangdong.common.exception.SQLConnectionFailException;

public interface HouseService {
	//获取房屋(type=all\district..)
	public List<HouseVo> getHouseList(int regionId,SearchParam param);
	public void insertHouse(FdHouse house) throws SQLConnectionFailException;
	public void deleteHouseById(int id) throws SQLConnectionFailException;
	public HouseVo getHouseVoById(int id);
	public List<HouseVo> getTopHouse(int top,int regionId);
	//创建房屋
	public void createHouse(FdHouse house);
	//更新house
	public void updateHouseById(FdHouse house)throws SQLConnectionFailException;
	//模糊查询
	public List<HouseVo> fuzzySearch(int regionId,String key);
	//猜你喜欢
	public List<HouseVo> guessYouLike(String district);
	//根据用户id查找他自己的房屋
	public List<HouseVo> getHouseByUserId(int userId);
}

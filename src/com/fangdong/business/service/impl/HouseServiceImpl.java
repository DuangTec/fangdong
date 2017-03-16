package com.fangdong.business.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.auth.mapper.FdUserMapper;
import com.fangdong.business.mapper.FdHouseMapper;
import com.fangdong.business.mapper.FdRegionMapper;
import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.FdHouseExample;
import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.service.HouseService;
import com.fangdong.common.exception.SQLConnectionFailException;

@Service
public class HouseServiceImpl implements HouseService {

	@Resource
	private FdHouseMapper houseMapper;
	@Resource
	private FdUserMapper userMapper;
	@Resource
	private FdRegionMapper regionMapper;
	/**
	 * 获取所有房屋
	 * @return
	 */
	@Override
	public List<HouseVo> getHouseList(){
		List<HouseVo> houseVoList = houseMapper.selectAllHouseVo();
		
		return houseVoList; 
	}
	/**
	 * 插入房屋
	 * @param house 由controller传来
	 * @throws SQLConnectionFailException 
	 */
	@Override
	public void insertHouse(FdHouse house) throws SQLConnectionFailException{
		try {
			houseMapper.insert(house);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SQLConnectionFailException("插入失败");
		}
	}
	/**
	 * 删除房屋
	 * @param id
	 * @throws SQLConnectionFailException
	 */
	@Override
	public void deleteHouseById(int id) throws SQLConnectionFailException{
		try {
			houseMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SQLConnectionFailException("删除失败");
		}
	}
	@Override
	public HouseVo getHouseVoById(int id) {
		HouseVo house = (HouseVo)houseMapper.selectByPrimaryKey(id);
		
		return house;
	}
	@Override
	public List<HouseVo> getTopHouse(int top,int regionId) {
		
		List<HouseVo> houseVoList=houseMapper.selectTopHouseVo(top,regionId);
		return houseVoList;
	}
}

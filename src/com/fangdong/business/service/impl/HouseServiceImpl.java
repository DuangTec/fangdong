package com.fangdong.business.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.auth.mapper.FdUserMapper;
import com.fangdong.business.mapper.FdHouseMapper;
import com.fangdong.business.mapper.FdPictureMapper;
import com.fangdong.business.mapper.FdRegionMapper;
import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.FdPicture;
import com.fangdong.business.model.HouseVo;
import com.fangdong.business.model.SearchParam;
import com.fangdong.business.service.HouseService;
import com.fangdong.common.exception.SQLConnectionFailException;
import com.fangdong.common.utils.CommonUtils;

@Service
public class HouseServiceImpl implements HouseService {

	@Resource
	private FdHouseMapper houseMapper;
	@Resource
	private FdUserMapper userMapper;
	@Resource
	private FdRegionMapper regionMapper;
	@Resource
	private FdPictureMapper pictureMapper;

	/**
	 * 获取所有房屋
	 * 获取或者获取特定的房屋
	 * @return
	 */
	@Override
	public List<HouseVo> getHouseList(int regionId, SearchParam param) {	
			List<HouseVo> houseList= houseMapper.selectHouseVoByParam(regionId,param);
			return addPic(houseList);
	}
	
	//增加图片
	public List<HouseVo>  addPic(List<HouseVo> houseVoList)
	{
		for (HouseVo vo : houseVoList) 
		{
			// 房屋对图片是一对多关系，需要按照房屋id再查图片，填充进vo
			List<FdPicture> pictureList = pictureMapper.selectByHouseId(vo.getId());
			String[] pics = new String[pictureList.size()];
			for (int i = 0; i < pictureList.size(); i++) 
			{
				pics[i] = pictureList.get(i).getPictureUrl();
			}
			vo.setPics(pics);
		}
		return houseVoList;	
	}

	/**
	 * 插入房屋
	 * 
	 * @param house
	 *            由controller传来
	 * @throws SQLConnectionFailException
	 */
	@Override
	public void insertHouse(FdHouse house) throws SQLConnectionFailException {
		try {
			houseMapper.insertSelective(house);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SQLConnectionFailException("插入失败");
		}
	}

	/**
	 * 删除房屋
	 * 
	 * @param id
	 * @throws SQLConnectionFailException
	 */
	@Override
	public void deleteHouseById(int id) throws SQLConnectionFailException {
		try {
			houseMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SQLConnectionFailException("删除失败");
		}
	}

	@Override
	public HouseVo getHouseVoById(int id) {
		HouseVo house = (HouseVo) houseMapper.selectHouseVoByPrimaryKey(id);
		// 根据id获取图片
		List<FdPicture> pictureList = pictureMapper.selectByHouseId(house.getId());
		String[] pics = new String[pictureList.size()];
		for (int i = 0; i < pictureList.size(); i++) {
			pics[i] = pictureList.get(i).getPictureUrl();
		}
		house.setPics(pics);
		//根据facilities字段设置家具
		String facility=house.getFacilities();
		if(facility!=null)
			house.setFacility(facility.split(","));
		//根据features字段房屋特点
				String features=house.getFeatures();
				if(features!=null)
					house.setFeature(features.split(","));

		return house;
	}

	@Override
	public List<HouseVo> getTopHouse(int top, int regionId) {
		int tha=houseMapper.selectTopHouseAmount();
		int rCount=top;
		if(tha<=top){
			top=tha;
			rCount=tha;
		} 
		int[] randomNum=CommonUtils.randomNums(tha, rCount);
		List<HouseVo> houseVoList = houseMapper.selectTopHouseVo(top, regionId,randomNum);
		for (HouseVo vo : houseVoList) {
			// 房屋对图片是一对多关系，需要按照房屋id再查图片，填充进vo
			List<FdPicture> pictureList = pictureMapper.selectByHouseId(vo.getId());
			String[] pics = new String[pictureList.size()];
			for (int i = 0; i < pictureList.size(); i++) {
				pics[i] = pictureList.get(i).getPictureUrl();
			}
			vo.setPics(pics);
		}
		return houseVoList;
	}

	// 模糊查询,入口key(用户输入的)，搜索了地址、详细介绍、标题
	@Override
	public List<HouseVo> fuzzySearch(int regionId,String key) {
		List<HouseVo> fsResult = houseMapper.selectByKey(regionId,key);
		for (HouseVo vo : fsResult) {
			// 房屋对图片是一对多关系，需要按照房屋id再查图片，填充进vo
			List<FdPicture> pictureList = pictureMapper.selectByHouseId(vo.getId());
			String[] pics = new String[pictureList.size()];
			for (int i = 0; i < pictureList.size(); i++) {
				pics[i] = pictureList.get(i).getPictureUrl();
			}
			vo.setPics(pics);
		}
		return fsResult;
	}
	
	//猜你喜欢实现方法
	@Override
	public List<HouseVo> guessYouLike(String district) {
		List<HouseVo> gylResult=houseMapper.selectGuessYouLike(district);
		
		for (HouseVo vo : gylResult) {
			// 房屋对图片是一对多关系，需要按照房屋id再查图片，填充进vo
			List<FdPicture> pictureList = pictureMapper.selectByHouseId(vo.getId());
			String[] pics = new String[pictureList.size()];
			for (int i = 0; i < pictureList.size(); i++) {
				pics[i] = pictureList.get(i).getPictureUrl();
			}
			vo.setPics(pics);
		}
		return gylResult;
	}

	@Override
	public void updateHouseById(FdHouse house) throws SQLConnectionFailException {
		try{
			houseMapper.updateByPrimaryKeySelective(house);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SQLConnectionFailException("更新失败");
		}
	}

	@Override
	public List<HouseVo> getHouseByUserId(int userId) {
		return houseMapper.selectHouseByUserId(userId);
	}

	@Override
	public void createHouse(FdHouse house) {
		houseMapper.insertSelective(house);
	}

	@Override
	public void refreshHouse(int id) {
		houseMapper.updateUpdateTimeById(id);
	}

	@Override
	public void changeHouseStatus(int id, String status) {
		FdHouse house = new FdHouse();
		house.setHouseStatus(status);
		house.setPriorApproval(0);
		house.setId(id);
		houseMapper.updateByPrimaryKeySelective(house);		
	}

	@Override
	public List<HouseVo> getAllPendingHouse() {
		return houseMapper.selectAllPendingHouseVo();
	}

	@Override
	public void takeOffHouse(int id) {
		FdHouse house = new FdHouse();
		house.setId(id);
		house.setHouseStatus("closed");
		houseMapper.updateByPrimaryKeySelective(house);
	}
	
	@Override
	public void putOnHouse(int id){
		FdHouse house = new FdHouse();
		house.setId(id);
		house.setHouseStatus("pending");
		houseMapper.updateByPrimaryKeySelective(house);
	}

	@Override
	public String getHouseService(int houseid) {
		FdHouse house=houseMapper.selectByPrimaryKey(houseid);
		String houseTop="0";
		String PriorApproval="0";
		if(house.getStartTopTime()!=null)
		{houseTop="1";}
		if(house.getHouseStatus()=="published"||house.getPriorApproval()==1)
		{PriorApproval="1";}
		return houseTop+PriorApproval;
	}

	
}

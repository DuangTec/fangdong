package com.fangdong.business.service.impl;



import javax.annotation.Resource;

import com.fangdong.business.mapper.FdPictureMapper;
import com.fangdong.business.service.PictureService;

public class PictureServiceImpl implements PictureService {

	@Resource
	private FdPictureMapper picMapper;
	
	@Override
	public boolean deletePicByHouseId(int houseId) {
		// TODO Auto-generated method stub
		boolean flag=true;
		int r=picMapper.deleteByHouseId(houseId);
		if(r==0){flag=false;}
		return flag;
	}

}

package com.fangdong.business.service;

import java.util.List;

import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.RegionVo;

public interface RegionService {
	public List<RegionVo> getAllRegion() throws Exception;
	
	public void deleteRegionById(int id) throws Exception;
	
	public void updateRegionById(FdRegion region) throws Exception;
	
	public void createRegion(FdRegion region)throws Exception;
	
	public RegionVo getRegionById(int id) throws Exception;
	
	public List<FdRegion> getParentsRegion() throws Exception;
	
	//根据城市id获取二级地区
	public List<FdRegion> getDistrict(int cityId) throws Exception;
	
	//根据行政区id获取三级地区
	public List<FdRegion> getAreaByDistrictId(int districtId) throws Exception;
	
	//获取所有二级和三级地区
	public List<FdRegion> getSonRegion() throws Exception;
	//传入地区父ID寻找子ID
	public List<FdRegion> getChildren(String fatherId);
	//获取所有三级地区
	public List<FdRegion> getAllArea();
} 

package com.fangdong.business.model;


public class SubwayVo extends FdSubway{

	private String regionName[];
	
	public String[] getRegionName() {
		return regionName;
	}

	public void setRegionName(String[] regionName) {
		this.regionName = regionName;
	}

	private String regionId;
	 
	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}


}

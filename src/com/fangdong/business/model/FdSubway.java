package com.fangdong.business.model;

public class FdSubway {
    private int id;

    private String subwayName;
    
    private int regionId;

    public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubwayName() {
        return subwayName;
    }

    public void setSubwayName(String subwayName) {
        this.subwayName = subwayName == null ? null : subwayName.trim();
    }
}
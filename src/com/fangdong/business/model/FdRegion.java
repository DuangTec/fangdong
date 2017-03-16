package com.fangdong.business.model;

public class FdRegion {
    private Integer id;

    private String regionName;

    private Integer parentRegId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName == null ? null : regionName.trim();
    }

    public Integer getParentRegId() {
        return parentRegId;
    }

    public void setParentRegId(Integer parentRegId) {
        this.parentRegId = parentRegId;
    }
}
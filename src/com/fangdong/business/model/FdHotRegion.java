package com.fangdong.business.model;

public class FdHotRegion {
    private Integer id;

    private Integer regionId;

    private String hotRegionName;

    private String hotRegionType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRegionId() {
        return regionId;
    }

    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    public String getHotRegionName() {
        return hotRegionName;
    }

    public void setHotRegionName(String hotRegionName) {
        this.hotRegionName = hotRegionName == null ? null : hotRegionName.trim();
    }

    public String getHotRegionType() {
        return hotRegionType;
    }

    public void setHotRegionType(String hotRegionType) {
        this.hotRegionType = hotRegionType == null ? null : hotRegionType.trim();
    }
}
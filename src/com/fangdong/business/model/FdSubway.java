package com.fangdong.business.model;

public class FdSubway {
    private Integer id;

    private String subwayName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubwayName() {
        return subwayName;
    }

    public void setSubwayName(String subwayName) {
        this.subwayName = subwayName == null ? null : subwayName.trim();
    }
}
package com.fangdong.business.model;

import java.util.Date;

public class FdHouse {
    private Integer id;

    private Integer ownerId;

    private Date createDate;

    private Integer size;

    private String title;

    private String houseDetail;

    private String address;

    private Integer propertyRights;

    private String houseType;

    private Integer rentPrice;

    private Integer regionId;

    private Integer hall;

    private Integer room;

    private String facilities;

    private Date updateTime;

    private String houseStatus;

    private String rentType;

    private String features;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getHouseDetail() {
        return houseDetail;
    }

    public void setHouseDetail(String houseDetail) {
        this.houseDetail = houseDetail == null ? null : houseDetail.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getPropertyRights() {
        return propertyRights;
    }

    public void setPropertyRights(Integer propertyRights) {
        this.propertyRights = propertyRights;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType == null ? null : houseType.trim();
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public Integer getRegionId() {
        return regionId;
    }

    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    public Integer getHall() {
        return hall;
    }

    public void setHall(Integer hall) {
        this.hall = hall;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities == null ? null : facilities.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(String houseStatus) {
        this.houseStatus = houseStatus == null ? null : houseStatus.trim();
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType == null ? null : rentType.trim();
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features == null ? null : features.trim();
    }
}
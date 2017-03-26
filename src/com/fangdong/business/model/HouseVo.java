package com.fangdong.business.model;

public class HouseVo extends FdHouse{
	private String owner;
	//图片
	private String[] pics;
	//家具
	private String[] facility;
	//房屋特点
	private String[] feature;
	//城市(第一层)city
	private String city;
	//行政区(第二层)district
	private String district;
	//地区(第三层)area
	private String area;
	
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String[] getPics() {
		return pics;
	}
	public void setPics(String[] pics) {
		this.pics = pics;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String[] getFacility() {
		return facility;
	}
	public void setFacility(String[] facility) {
		this.facility = facility;
	}
	public String[] getFeature() {
		return feature;
	}
	public void setFeature(String[] feature) {
		this.feature = feature;
	}
	
}

package com.fangdong.business.model;

public class HouseVo extends FdHouse{
	private String owner;
	private String[] pics;
	private String province;
	private String city;
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
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}

	
}

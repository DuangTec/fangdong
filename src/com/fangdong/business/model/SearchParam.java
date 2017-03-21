package com.fangdong.business.model;

/**
 * 接受页面搜索时的参数
 * @author herui
 *
 */
public class SearchParam {
	private Integer districtId;
	private Integer lowerPrice;
	private Integer upperPrice;
	private Integer roomNum;
	private Integer hallNum;
	public Integer getDistrictId() {
		return districtId;
	}
	public void setDistrictId(Integer districtId) {
		this.districtId = districtId;
	}
	public Integer getLowerPrice() {
		return lowerPrice;
	}
	public void setLowerPrice(Integer lowerPrice) {
		this.lowerPrice = lowerPrice;
	}
	public Integer getUpperPrice() {
		return upperPrice;
	}
	public void setUpperPrice(Integer upperPrice) {
		this.upperPrice = upperPrice;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	public Integer getHallNum() {
		return hallNum;
	}
	public void setHallNum(Integer hallNum) {
		this.hallNum = hallNum;
	}
	
	
}

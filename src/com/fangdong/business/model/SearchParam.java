package com.fangdong.business.model;

/**
 * 接受页面搜索时的参数
 * @author herui
 *
 */
public class SearchParam {
	private String searchRegionType;
	private String l2RegionId;
	private String l3RegionId;
	private Integer lowerPrice;
	private Integer upperPrice;
	private Integer roomNum;
	private Integer hallNum;
	private String rentType;
	private String[] features;
	
	public String getRentType() {
		return rentType;
	}
	public void setRentType(String rentType) {
		this.rentType = rentType;
	}
	public String[] getFeatures() {
		return features;
	}
	public void setFeatures(String[] features) {
		this.features = features;
	}
	public String getSearchRegionType() {
		return searchRegionType;
	}
	public void setSearchRegionType(String searchRegionType) {
		this.searchRegionType = searchRegionType;
	}
	public String getL2RegionId() {
		return l2RegionId;
	}
	public void setL2RegionId(String l2RegionId) {
		this.l2RegionId = l2RegionId;
	}
	public String getL3RegionId() {
		return l3RegionId;
	}
	public void setL3RegionId(String l3RegionId) {
		this.l3RegionId = l3RegionId;
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

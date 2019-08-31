package cn.zx.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class Order {
	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", storeId="
				+ storeId + ", orderState=" + orderState + ", isComment="
				+ isComment + ", orderNumber=" + orderNumber
				+ ", orderAddress=" + orderAddress + ", totalMoney="
				+ totalMoney + ", orderTime=" + orderTime + ", orderRemarks="
				+ orderRemarks + ", deliveryManId=" + deliveryManId
				+ ", disMoney=" + disMoney + ", userName=" + userName
				+ ", storeName=" + storeName + ", storeImg=" + storeImg
				+ ", dmName=" + dmName + ", storePhone=" + storePhone
				+ ", coordinate=" + coordinate + ", storeAddress="
				+ storeAddress + "]";
	}
	private Integer id;
	private Integer userId;
	private Integer storeId;
	private Integer orderState;
	private Integer isComment;
	private String orderNumber;
	private String orderAddress;
	private double totalMoney;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderTime;
	private String orderRemarks;
	private Integer deliveryManId;
	private double disMoney;//配送费
	
	private String userName;
	private String storeName;
	private String storeImg;
	private String dmName;
	
	private String storePhone;
	private String coordinate;
	private String storeAddress;
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getCoordinate() {
		return coordinate;
	}
	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}
	public Integer getDeliveryManId() {
		return deliveryManId;
	}
	public void setDeliveryManId(Integer deliveryManId) {
		this.deliveryManId = deliveryManId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreImg() {
		return storeImg;
	}
	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}
	public String getDmName() {
		return dmName;
	}
	public void setDmName(String dmName) {
		this.dmName = dmName;
	}
	
	public double getDisMoney() {
		return disMoney;
	}
	public void setDisMoney(double disMoney) {
		this.disMoney = disMoney;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public String getOrderRemarks() {
		return orderRemarks;
	}
	public void setOrderRemarks(String orderRemarks) {
		this.orderRemarks = orderRemarks;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Integer getIsComment() {
		return isComment;
	}
	public void setIsComment(Integer isComment) {
		this.isComment = isComment;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
}

package cn.zx.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



public class Order {
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
	
	private String userName;
	private String storeName;
	private String storeImg;
	private String dmName;
	private double distributionMoney;
	private String storePhone;
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
	public double getDistributionMoney() {
		return distributionMoney;
	}
	public void setDistributionMoney(double distributionMoney) {
		this.distributionMoney = distributionMoney;
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

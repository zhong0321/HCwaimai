package cn.zx.entity;

import java.io.Serializable;

public class Food implements Serializable{
	private Integer id;
	private Integer storeId;
	private Integer foodTypeId;
	private String foodName;
	private String foodImage;
	private double price;
	private int fsid;
	private int salesvolume;
	public int getFsid() {
		return fsid;
	}
	public void setFsid(int fsid) {
		this.fsid = fsid;
	}
	public int getSalesvolume() {
		return salesvolume;
	}
	public void setSalesvolume(int salesvolume) {
		this.salesvolume = salesvolume;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getFoodTypeId() {
		return foodTypeId;
	}
	public void setFoodTypeId(Integer foodTypeId) {
		this.foodTypeId = foodTypeId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodImage() {
		return foodImage;
	}
	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Food [id=" + id + ", storeId=" + storeId + ", foodTypeId="
				+ foodTypeId + ", foodName=" + foodName + ", foodImage="
				+ foodImage + ", price=" + price + "]";
	}
	
	
}

package cn.zx.entity;

public class Car {
	private Integer foodId;
	private String foodName;
	private Integer storeId;
	private double price;
	private Integer count;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getFoodId() {
		return foodId;
	}
	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Car [foodId=" + foodId + ", foodName=" + foodName
				+ ", storeId=" + storeId + ", price=" + price + ", count="
				+ count + "]";
	} 

}

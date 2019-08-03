package cn.zx.entity;

public class StoreFoodTypes {
	private Integer id;
	private Integer storeId;
	private Integer foodTypeId;
	private String foodType;
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
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
	
}

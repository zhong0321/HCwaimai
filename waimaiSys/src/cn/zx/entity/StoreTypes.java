package cn.zx.entity;

public class StoreTypes {
	private Integer id;
	private String storeType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}
	@Override
	public String toString() {
		return "StoreType [id=" + id + ", storeType=" + storeType + "]";
	}
	
}

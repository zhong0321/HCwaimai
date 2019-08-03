package cn.zx.entity;

public class Store {
    private Integer id; 
	private double distributionMoney;
	private Integer startMoney;
	private String storeAddress;
	private String storeName;
	private String storePassword;
	private String storeImg;
	private String storePhone;
	private Integer registState;
	public Integer getRegistState() {
		return registState;
	}
	public void setRegistState(Integer registState) {
		this.registState = registState;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	private String province;
	private String city;
	private String area;
	private String coordinate;
	private Integer storeTypeId;
	
	public Integer getStoreTypeId() {
		return storeTypeId;
	}
	public void setStoreTypeId(Integer storeTypeId) {
		this.storeTypeId = storeTypeId;
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
	public String getCoordinate() {
		return coordinate;
	}
	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public double getDistributionMoney() {
		return distributionMoney;
	}
	public void setDistributionMoney(double distributionMoney) {
		this.distributionMoney = distributionMoney;
	}
	public Integer getStartMoney() {
		return startMoney;
	}
	public void setStartMoney(Integer startMoney) {
		this.startMoney = startMoney;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStorePassword() {
		return storePassword;
	}
	public void setStorePassword(String storePassword) {
		this.storePassword = storePassword;
	}
	public String getStoreImg() {
		return storeImg;
	}
	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}
	@Override
	public String toString() {
		return "Store [id=" + id + ", distributionMoney=" + distributionMoney
				+ ", startMoney=" + startMoney + ", storeAddress="
				+ storeAddress + ", storeName=" + storeName
				+ ", storePassword=" + storePassword + ", storeImg=" + storeImg
				+ ", storePhone=" + storePhone + ", province=" + province
				+ ", city=" + city + ", area=" + area + ", coordinate="
				+ coordinate + ", storeTypeId=" + storeTypeId + "]";
	}
	
	
}

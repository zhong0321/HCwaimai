package cn.zx.entity;

public class Store implements Comparable<Store>{
	/**
	 * 商家标识
	 */
    private Integer id; 
	private double distributionMoney;
	private Integer startMoney;
	private String storeAddress;
	private String storeName;
	private String storePassword;
	private String storeImg;
	private String storePhone;
	private double juli;
	private String province;
	private String city;
	private String area;
	private String coordinate;
	private Integer storeTypeId;
	private String foundtime;
	private int ordrenum;
	private int registState;
	private Audit audit;
	public int getRegistState() {
		return registState;
	}
	public void setRegistState(int registState) {
		this.registState = registState;
	}
	public int getOrdrenum() {
		return ordrenum;
	}
	public void setOrdrenum(int ordrenum) {
		this.ordrenum = ordrenum;
	}
	public Audit getAudit() {
		return audit;
	}
	public void setAudit(Audit audit) {
		this.audit = audit;
	}
	public String getFoundtime() {
		return foundtime;
	}
	public void setFoundtime(String foundtime) {
		this.foundtime = foundtime;
	}
	public double getJuli() {
		return juli;
	}
	public void setJuli(double juli) {
		this.juli = juli;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	
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
	@Override
	public int compareTo(Store o) {
		 //自定义比较方法，如果认为此实体本身大则返回1，否则返回-1
		if(this.juli >= o.getJuli()){
			return 1;
		}
		return -1;
	}
}

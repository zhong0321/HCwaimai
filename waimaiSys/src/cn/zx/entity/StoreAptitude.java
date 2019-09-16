package cn.zx.entity;

public class StoreAptitude {
	private Integer id;
	private Integer storeId;
	private String linkmanName;
	private String linkmanPhone;
	private String legalRepresentative;
	private String IDCard;
	private String IDCardImg;
	private String bankCard;
	private String shopCard;
	private String shopCardImg;
	private String foodLicenceImg;
	private Store store;
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
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
	public String getLinkmanName() {
		return linkmanName;
	}
	public void setLinkmanName(String linkmanName) {
		this.linkmanName = linkmanName;
	}
	public String getLinkmanPhone() {
		return linkmanPhone;
	}
	public void setLinkmanPhone(String linkmanPhone) {
		this.linkmanPhone = linkmanPhone;
	}
	public String getLegalRepresentative() {
		return legalRepresentative;
	}
	public void setLegalRepresentative(String legalRepresentative) {
		this.legalRepresentative = legalRepresentative;
	}
	public String getIDCard() {
		return IDCard;
	}
	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}
	public String getIDCardImg() {
		return IDCardImg;
	}
	public void setIDCardImg(String iDCardImg) {
		IDCardImg = iDCardImg;
	}
	public String getBankCard() {
		return bankCard;
	}
	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}
	public String getShopCard() {
		return shopCard;
	}
	public void setShopCard(String shopCard) {
		this.shopCard = shopCard;
	}
	public String getShopCardImg() {
		return shopCardImg;
	}
	public void setShopCardImg(String shopCardImg) {
		this.shopCardImg = shopCardImg;
	}
	public String getFoodLicenceImg() {
		return foodLicenceImg;
	}
	public void setFoodLicenceImg(String foodLicenceImg) {
		this.foodLicenceImg = foodLicenceImg;
	}
}

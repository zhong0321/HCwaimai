package cn.zx.entity;

public class DeliveryMan {
	private Integer id;
	private String dmName;
	private String dmPhone;
	private String dmPassword;
	private String commonlyAddress;
	private double income;
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDmName() {
		return dmName;
	}
	public void setDmName(String dmName) {
		this.dmName = dmName;
	}
	public String getDmPhone() {
		return dmPhone;
	}
	public void setDmPhone(String dmPhone) {
		this.dmPhone = dmPhone;
	}
	public String getDmPassword() {
		return dmPassword;
	}
	public void setDmPassword(String dmPassword) {
		this.dmPassword = dmPassword;
	}
	public String getCommonlyAddress() {
		return commonlyAddress;
	}
	public void setCommonlyAddress(String commonlyAddress) {
		this.commonlyAddress = commonlyAddress;
	}
}

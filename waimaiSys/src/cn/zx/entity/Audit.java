package cn.zx.entity;

import java.util.Date;

public class Audit {
	private Integer id;
	private Integer storeId;
	private Integer auditState;
	private Date auditTime;
	private String auditComment;
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
	public Integer getAuditState() {
		return auditState;
	}
	public void setAuditState(Integer auditState) {
		this.auditState = auditState;
	}
	public Date getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	public String getAuditComment() {
		return auditComment;
	}
	public void setAuditComment(String auditComment) {
		this.auditComment = auditComment;
	}

}

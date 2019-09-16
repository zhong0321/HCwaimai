package cn.zx.entity;

import java.util.Date;

public class Audit {
	
	public static void main(String[] args) {
		
	}
	private Integer audit_id;
	private Integer storeId;
	private Integer auditState;
	private Date auditTime;
	private String auditComment;
	private Store store;
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}

	public Integer getAudit_id() {
		return audit_id;
	}
	public void setAudit_id(Integer audit_id) {
		this.audit_id = audit_id;
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

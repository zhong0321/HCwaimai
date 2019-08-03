package cn.zx.entity;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;

public class Comment {
	private Integer id;
	private Integer userId;
	private Integer storeId;
	private Integer orderId;
	private String description;
	private DateTime commentTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public DateTime getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(DateTime commentTime) {
		this.commentTime = commentTime;
	}
	
}

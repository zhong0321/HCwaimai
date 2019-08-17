package cn.zx.entity;

public class Comment_User {
	private int id;
	private String description;
	private String commentTime;
	private int commentlv;
	private String userName;
	private String image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	public int getCommentlv() {
		return commentlv;
	}
	public void setCommentlv(int commentlv) {
		this.commentlv = commentlv;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}

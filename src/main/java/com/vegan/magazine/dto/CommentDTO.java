package com.vegan.magazine.dto;

import java.sql.Date;

public class CommentDTO {

	private int comment_id;
	private String user_id;
	private String cat_id;
	private Date comment_date;
	private String content;
	private int identify_id;
	
	
	
	public int getIdentify_id() {
		return identify_id;
	}
	public void setIdentify_id(int identify_id) {
		this.identify_id = identify_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	

}

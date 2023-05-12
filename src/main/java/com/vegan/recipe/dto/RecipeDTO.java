package com.vegan.recipe.dto;

import java.sql.Date;
import java.util.List;

public class RecipeDTO {
	private Date rec_creatdate;
	private int rec_view;
	private int rec_id;
	private String rec_title;
	private String user_id; 
	private int step_id;
	private String rec_video;
	private String rec_modify;
	private int rec_del_chk;
	private int rec_blind_chk;
	private String cat_id;

	public Date getRec_creatdate() {
		return rec_creatdate;
	}
	public void setRec_creatdate(Date rec_creatdate) {
		this.rec_creatdate = rec_creatdate;
	}
	public int getRec_view() {
		return rec_view;
	}
	public void setRec_view(int rec_view) {
		this.rec_view = rec_view;
	}
	public int getRec_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public String getRec_title() {
		return rec_title;
	}
	public void setRec_title(String rec_title) {
		this.rec_title = rec_title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getStep_id() {
		return step_id;
	}
	public void setStep_id(int step_id) {
		this.step_id = step_id;
	}
	public String getRec_video() {
		return rec_video;
	}
	public void setRec_video(String rec_video) {
		this.rec_video = rec_video;
	}
	public String getRec_modify() {
		return rec_modify;
	}
	public void setRec_modify(String rec_modify) {
		this.rec_modify = rec_modify;
	}
	public int getRec_del_chk() {
		return rec_del_chk;
	}
	public void setRec_del_chk(int rec_del_chk) {
		this.rec_del_chk = rec_del_chk;
	}
	public int getRec_blind_chk() {
		return rec_blind_chk;
	}
	public void setRec_blind_chk(int rec_blind_chk) {
		this.rec_blind_chk = rec_blind_chk;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}


	
	
}

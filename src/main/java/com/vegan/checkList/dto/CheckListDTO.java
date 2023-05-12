package com.vegan.checkList.dto;

import java.sql.Date;

public class CheckListDTO {
	
	private int question_number;
	private String question_detail;
	private boolean delete_chk;
	private Date create_date;
	
	private int question_score;
	private int exam_number;
	private String user_id;
	private int total_score;
	
	private boolean list_check;
	private String step;
	private boolean user_admin_chk;
	
	
	public String getQuestion_detail() {
		return question_detail;
	}
	public void setQuestion_detail(String question_detail) {
		this.question_detail = question_detail;
	}
	public boolean isDelete_chk() {
		return delete_chk;
	}
	public void setDelete_chk(boolean delete_chk) {
		this.delete_chk = delete_chk;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getQuestion_number() {
		return question_number;
	}
	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}
	public int getQuestion_score() {
		return question_score;
	}
	public void setQuestion_score(int question_score) {
		this.question_score = question_score;
	}
	public int getExam_number() {
		return exam_number;
	}
	public void setExam_number(int exam_number) {
		this.exam_number = exam_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public boolean isList_check() {
        return list_check;
    }
    public void setList_check(boolean list_check) {
        this.list_check = list_check;
    }
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public boolean isUser_admin_chk() {
		return user_admin_chk;
	}
	public void setUser_admin_chk(boolean user_admin_chk) {
		this.user_admin_chk = user_admin_chk;
	}

	
	
	
	
	
}

package com.vegan.letter.dto;

import java.util.Date;

public class LetterDTO {

	private int letter_id;
	private String send_user_id;
	private String recive_user_id;
	private String letter_tItle;
	private String letter_content;
	private Date letter_date;
	private boolean letter_del_chk;
	private boolean letter_chk;
	
	public String getLetter_tItle() {
		return letter_tItle;
	}
	public void setLetter_tItle(String letter_tItle) {
		this.letter_tItle = letter_tItle;
	}
	public int getLetter_id() {
		return letter_id;
	}
	public void setLetter_id(int letter_id) {
		this.letter_id = letter_id;
	}
	public String getSend_user_id() {
		return send_user_id;
	}
	public void setSend_user_id(String send_user_id) {
		this.send_user_id = send_user_id;
	}
	public String getRecive_user_id() {
		return recive_user_id;
	}
	public void setRecive_user_id(String recive_user_id) {
		this.recive_user_id = recive_user_id;
	}
	public String getLetter_content() {
		return letter_content;
	}
	public void setLetter_content(String letter_content) {
		this.letter_content = letter_content;
	}
	public Date getLetter_date() {
		return letter_date;
	}
	public void setLetter_date(Date letter_date) {
		this.letter_date = letter_date;
	}
	public boolean isLetter_del_chk() {
		return letter_del_chk;
	}
	public void setLetter_del_chk(boolean letter_del_chk) {
		this.letter_del_chk = letter_del_chk;
	}
	public boolean isLetter_chk() {
		return letter_chk;
	}
	public void setLetter_chk(boolean letter_chk) {
		this.letter_chk = letter_chk;
	}
	
	
	
	


}

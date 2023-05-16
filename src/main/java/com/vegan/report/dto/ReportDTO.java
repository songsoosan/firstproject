package com.vegan.report.dto;

import java.sql.Date;

public class ReportDTO {


	private String date;
	private String report_id;
	private String cat_id;
	private String identify_number;
	private String reporter;
	private String reason;
	private String content;
	private String user_id;
	private String subject;
	private String status;
	private String admin;
	private String report_admin;
	private String report_result;
	private String report_reason;
	private String result_date;
	
	
	
	public String getReport_admin() {
		return report_admin;
	}
	public void setReport_admin(String report_admin) {
		this.report_admin = report_admin;
	}
	public String getReport_result() {
		return report_result;
	}
	public void setReport_result(String report_result) {
		this.report_result = report_result;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public String getResult_date() {
		return result_date;
	}
	public void setResult_date(String result_date) {
		this.result_date = result_date;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getIdentify_number() {
		return identify_number;
	}
	public void setIdentify_number(String identify_number) {
		this.identify_number = identify_number;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}

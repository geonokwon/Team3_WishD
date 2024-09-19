package com.teamproject.domain;

import java.sql.Timestamp;

public class CommunityQnaDTO {

	private long qcommunity_num;
	private long user_no;
	private String user_name;
	private String user_email;
	private String qcommunity_title;
	private String qcommunity_content;
	private String qcommunity_answer;
	private Timestamp qcommunity_date;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public long getQcommunity_num() {
		return qcommunity_num;
	}
	public void setQcommunity_num(long qcommunity_num) {
		this.qcommunity_num = qcommunity_num;
	}
	public long getUser_no() {
		return user_no;
	}
	public void setUser_no(long user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getQcommunity_title() {
		return qcommunity_title;
	}
	public void setQcommunity_title(String qcommunity_title) {
		this.qcommunity_title = qcommunity_title;
	}
	public String getQcommunity_content() {
		return qcommunity_content;
	}
	public void setQcommunity_content(String qcommunity_content) {
		this.qcommunity_content = qcommunity_content;
	}
	public String getQcommunity_answer() {
		return qcommunity_answer;
	}
	public void setQcommunity_answer(String qcommunity_answer) {
		this.qcommunity_answer = qcommunity_answer;
	}
	public Timestamp getQcommunity_date() {
		return qcommunity_date;
	}
	public void setQcommunity_date(Timestamp qcommunity_date) {
		this.qcommunity_date = qcommunity_date;
	}
	
}

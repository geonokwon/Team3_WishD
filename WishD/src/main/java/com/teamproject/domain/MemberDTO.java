package com.teamproject.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private int user_no;
	private String user_name;
	private String email;
	private Timestamp join_date;
	private String role;
	private boolean user_yn;
	private String user_type;
	
	private String access_Token;
	
	private String user_id;
	private String user_pass;
	private String user_phone;
	
	// 마이페이지에서 필요한 변수
	private String search;
	private String projectStatus;
	
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isUser_yn() {
		return user_yn;
	}
	public void setUser_yn(boolean user_yn) {
		this.user_yn = user_yn;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getAccess_Token() {
		return access_Token;
	}
	public void setAccess_Token(String access_Token) {
		this.access_Token = access_Token;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [user_no=" + user_no + ", user_name=" + user_name + ", email=" + email + ", join_date="
				+ join_date + ", role=" + role + ", user_yn=" + user_yn + ", user_type=" + user_type + ", access_Token="
				+ access_Token + ", user_id=" + user_id + ", user_pass=" + user_pass + ", user_phone=" + user_phone
				+ "]";
	}
}

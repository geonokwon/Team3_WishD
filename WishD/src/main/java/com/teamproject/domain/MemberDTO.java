package com.teamproject.domain;

import java.sql.Timestamp;

public class MemberDTO {
	// 통합(일반+간편) user_info
	private Long user_no; // 회원 번호 
	private String user_name; // 회원 이름
	private String email; // 회원 이메일
	private Timestamp join_date; // 가입날짜
	private String user_role; // 관리자, 회원 구분
	private boolean user_yn; // 회원 차단 여부 
	private String user_type; // 일반, 간편회원 구분 
	
	// 간편회원정보 simple_user
	private String access_Token; // 엑세스 토큰 
	
	
	// 일반회원정보 user
	private String user_id; // 회원아이디
	private String user_pass; //회원 비밀번호
	private String user_phone; // 회원 전화번호
	
	

	// 마이페이지 연결정보
	// 프로젝트 검색
	private String freelancerSearch;
	private String search;
	// 프로젝트 상태 확인
	private String projectStatus;
	private String freelancerStatus; 
	

	
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

	public Long getUser_no() {
		return user_no;
	}

	public void setUser_no(Long user_no) {
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

	public String getUser_Role() {
		return user_role;
	}

	public void setUser_Role(String user_role) {
		this.user_role = user_role;
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

	public String getFreelancerSearch() {
		return freelancerSearch;
	}

	public void setFreelancerSearch(String freelancerSearch) {
		this.freelancerSearch = freelancerSearch;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getFreelancerStatus() {
		return freelancerStatus;
	}

	public void setFreelancerStatus(String freelancerStatus) {
		this.freelancerStatus = freelancerStatus;
	}

	
	@Override
	public String toString() {
		return "MemberDTO [user_no=" + user_no + ", user_name=" + user_name + ", email=" + email + ", join_date="
				+ join_date + ", user_role=" + user_role + ", user_yn=" + user_yn + ", user_type=" + user_type + ", access_Token="
				+ access_Token +  "]";
	}
}

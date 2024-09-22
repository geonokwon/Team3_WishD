package com.teamproject.domain;

public class SimpleUserDTO {
	
	private String code;
	private String state;
	private String access_token;  
	private Long user_no;
	private String email;
	private String user_name;
	private String user_type; // 일반, 간편회원 구분 
	private String user_yn;
	 
	 public String getUserYn() {
	        return user_yn;
	}

	 public void setUserYn(String user_yn) {
	        this.user_yn = user_yn;
	}
	
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public Long getUser_no() {
		return user_no;
	}
	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
	
	
	

}

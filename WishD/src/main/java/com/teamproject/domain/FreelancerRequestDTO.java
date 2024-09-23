package com.teamproject.domain;


public class FreelancerRequestDTO {
	
	private Long request_num;
	private Long freelancer_id;
	private Long user_no;
	private String cl_subject;
	private int cl_rangeMonth;  //프로젝트 예상 기간
	private String cl_startDate; //프로젝트 시작 날짜
	private String cl_content;
	private String cl_name;
	private String cl_email;
	private String cl_request_date; //클라이언트가 프리랜서에게 요청한 날짜
	private Boolean cl_request_isAgree;
	private int cl_money;
	
	
	
	public Long getRequest_num() {
		return request_num;
	}
	public void setRequest_num(Long request_num) {
		this.request_num = request_num;
	}
	public Long getFreelancer_id() {
		return freelancer_id;
	}
	public void setFreelancer_id(Long freelancer_id) {
		this.freelancer_id = freelancer_id;
	}
	public Long getUser_no() {
		return user_no;
	}
	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}
	public String getCl_subject() {
		return cl_subject;
	}
	public void setCl_subject(String cl_subject) {
		this.cl_subject = cl_subject;
	}
	public int getCl_rangeMonth() {
		return cl_rangeMonth;
	}
	public void setCl_rangeMonth(int cl_rangeMonth) {
		this.cl_rangeMonth = cl_rangeMonth;
	}
	public String getCl_startDate() {
		return cl_startDate;
	}
	public void setCl_startDate(String cl_startDate) {
		this.cl_startDate = cl_startDate;
	}
	public String getCl_content() {
		return cl_content;
	}
	public void setCl_content(String cl_content) {
		this.cl_content = cl_content;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_email() {
		return cl_email;
	}
	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}
	public String getCl_request_date() {
		return cl_request_date;
	}
	public void setCl_request_date(String cl_request_date) {
		this.cl_request_date = cl_request_date;
	}
	public Boolean getCl_request_isAgree() {
		return cl_request_isAgree;
	}
	public void setCl_request_isAgree(Boolean cl_request_isAgree) {
		this.cl_request_isAgree = cl_request_isAgree;
	}
	public int getCl_money() {
		return cl_money;
	}
	public void setCl_money(int cl_money) {
		this.cl_money = cl_money;
	}
	
	@Override
	public String toString() {
		return "FreelancerRequestDTO [request_num=" + request_num + ", freelancer_id=" + freelancer_id + ", user_no="
				+ user_no + ", cl_subject=" + cl_subject + ", cl_rangeMonth=" + cl_rangeMonth + ", cl_startDate="
				+ cl_startDate + ", cl_content=" + cl_content + ", cl_name=" + cl_name + ", cl_email=" + cl_email
				+ ", cl_request_date=" + cl_request_date + ", cl_request_isAgree=" + cl_request_isAgree + ", cl_money="
				+ cl_money + "]";
	}

	
	
	




}
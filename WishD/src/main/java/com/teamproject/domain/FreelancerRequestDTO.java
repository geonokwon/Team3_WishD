package com.teamproject.domain;

import java.sql.Timestamp;
import java.util.List;

public class FreelancerRequestDTO {
	
	private Long request_num;
	private Long freelancer_id;
	private Long user_no;
	private String cl_subject;
	private Timestamp cl_date;
	private Timestamp cl_startdate;
	private String cl_content;
	private String cl_name;
	private String cl_email;
	private Timestamp cl_request_date;
	private Boolean cl_request_isAgree;
	
    private String skillList;
    private List<FreelancerSkillDTO> skills;
	
	
	
    //toString 오버라이드
	@Override
	public String toString() {
		return "FreelancerRequestDTO [request_num=" + request_num + ", freelancer_id=" + freelancer_id + ", user_no="
				+ user_no + ", cl_subject=" + cl_subject + ", cl_date=" + cl_date + ", cl_startdate=" + cl_startdate
				+ ", cl_content=" + cl_content + ", cl_name=" + cl_name + ", cl_email=" + cl_email
				+ ", cl_request_date=" + cl_request_date + ", cl_request_isAgree=" + cl_request_isAgree + ", skillList="
				+ skillList + ", skills=" + skills + "]";
	}

	public Long getRequest_num() {
		return request_num;
	}

	public void setRequest_num(long request_num) {
		this.request_num = request_num;
	}

	public Long getFreelancer_id() {
		return freelancer_id;
	}

	public void setFreelancer_id(long freelancer_id) {
		this.freelancer_id = freelancer_id;
	}

	public Long getUser_no() {
		return user_no;
	}

	public void setUser_no(long user_no) {
		this.user_no = user_no;
	}

	public String getCl_subject() {
		return cl_subject;
	}

	public void setCl_subject(String cl_subject) {
		this.cl_subject = cl_subject;
	}

	public Timestamp getCl_date() {
		return cl_date;
	}

	public void setCl_date(Timestamp cl_date) {
		this.cl_date = cl_date;
	}

	public Timestamp getCl_startdate() {
		return cl_startdate;
	}

	public void setCl_startdate(Timestamp cl_startdate) {
		this.cl_startdate = cl_startdate;
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

	public Timestamp getCl_request_date() {
		return cl_request_date;
	}

	public void setCl_request_date(Timestamp cl_request_date) {
		this.cl_request_date = cl_request_date;
	}

	public Boolean getCl_request_isAgree() {
		return cl_request_isAgree;
	}

	public void setCl_request_isAgree(Boolean cl_request_isAgree) {
		this.cl_request_isAgree = cl_request_isAgree;
	}

	public String getSkillList() {
		return skillList;
	}

	public void setSkillList(String skillList) {
		this.skillList = skillList;
	}

	public List<FreelancerSkillDTO> getSkills() {
		return skills;
	}

	public void setSkills(List<FreelancerSkillDTO> skills) {
		this.skills = skills;
	}

}
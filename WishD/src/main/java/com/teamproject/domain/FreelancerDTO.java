package com.teamproject.domain;

import java.sql.Timestamp;
import java.util.List;

public class FreelancerDTO {
	
	
	private int freelancer_id;
	private int user_id;
	
	private int freelancer_salary;
	private String freelancer_startdate; //프로젝트 시작 가능일, DB에 넣을때 Timestamp 자료형으로 넣어야함
	private boolean freelancer_exp; //프리랜서 경험 유무
	private int dev_exp; 			//개발자 경력
	private String freelancer_job;
	private String freelancer_introdution;
	private String freelancer_link;
	private String freelancer_state;
	private Timestamp freelancer_date;
	private Timestamp freelancer_update;
	
    //freelancer_skill 테이블에 넣을 스킬
    private List<String> skills;
	
    //toString 오버라이드
	@Override
	public String toString() {
		return "FreelancerDTO [freelancer_id=" + freelancer_id + ", user_id=" + user_id + ", freelancer_salary="
				+ freelancer_salary + ", freelancer_startdate=" + freelancer_startdate + ", freelancer_exp="
				+ freelancer_exp + ", dev_exp=" + dev_exp + ", freelancer_job=" + freelancer_job
				+ ", freelancer_introdution=" + freelancer_introdution + ", freelancer_link=" + freelancer_link
				+ ", freelancer_state=" + freelancer_state + ", freelancer_date=" + freelancer_date
				+ ", freelancer_update=" + freelancer_update + ", skills=" + skills + "]";
	}

	public int getFreelancer_id() {
		return freelancer_id;
	}

	public void setFreelancer_id(int freelancer_id) {
		this.freelancer_id = freelancer_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getFreelancer_salary() {
		return freelancer_salary;
	}

	public void setFreelancer_salary(int freelancer_salary) {
		this.freelancer_salary = freelancer_salary;
	}

	public String getFreelancer_startdate() {
		return freelancer_startdate;
	}

	public void setFreelancer_startdate(String freelancer_startdate) {
		this.freelancer_startdate = freelancer_startdate;
	}

	public boolean isFreelancer_exp() {
		return freelancer_exp;
	}

	public void setFreelancer_exp(boolean freelancer_exp) {
		this.freelancer_exp = freelancer_exp;
	}

	public int getDev_exp() {
		return dev_exp;
	}

	public void setDev_exp(int dev_exp) {
		this.dev_exp = dev_exp;
	}

	public String getFreelancer_job() {
		return freelancer_job;
	}

	public void setFreelancer_job(String freelancer_job) {
		this.freelancer_job = freelancer_job;
	}

	public String getFreelancer_introdution() {
		return freelancer_introdution;
	}

	public void setFreelancer_introdution(String freelancer_introdution) {
		this.freelancer_introdution = freelancer_introdution;
	}

	public String getFreelancer_link() {
		return freelancer_link;
	}

	public void setFreelancer_link(String freelancer_link) {
		this.freelancer_link = freelancer_link;
	}

	public String getFreelancer_state() {
		return freelancer_state;
	}

	public void setFreelancer_state(String freelancer_state) {
		this.freelancer_state = freelancer_state;
	}

	public Timestamp getFreelancer_date() {
		return freelancer_date;
	}

	public void setFreelancer_date(Timestamp freelancer_date) {
		this.freelancer_date = freelancer_date;
	}

	public Timestamp getFreelancer_update() {
		return freelancer_update;
	}

	public void setFreelancer_update(Timestamp freelancer_update) {
		this.freelancer_update = freelancer_update;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}
	
	
	
	

	
	
	
}

package com.teamproject.domain;

import java.sql.Timestamp;
import java.util.List;

public class MyProjectDTO {
	
	private Long pboard_id;
    private Long user_no;
    private String pboard_title;
    private String pboard_content;
    private int pboard_money;
    private String pboard_startDate;
    private int pboard_rangeMonth;
    private int job_id;
    private String job_name;
    private String pboard_state;
    private Timestamp pboard_date;
    private Timestamp pboard_update;
    private Boolean pboard_isMatching;
    private String pboard_manager_phone;
    private String pboard_company_name;
    
	private int pboard_history;
	
	private String skillList;

	
	
	

	public String getJob_name() {
		return job_name;
	}



	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}



	public Boolean getPboard_isMatching() {
		return pboard_isMatching;
	}



	public void setPboard_isMatching(Boolean pboard_isMatching) {
		this.pboard_isMatching = pboard_isMatching;
	}



	public String getSkillList() {
		return skillList;
	}



	public void setSkillList(String skillList) {
		this.skillList = skillList;
	}






	public int getJob_id() {
		return job_id;
	}



	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}






	// 프로젝트의 스킬리스트
	private List<ProjectSkillDTO> skills;



	public Long getPboard_id() {
		return pboard_id;
	}



	public void setPboard_id(Long pboard_id) {
		this.pboard_id = pboard_id;
	}



	public Long getUser_no() {
		return user_no;
	}



	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}



	public String getPboard_title() {
		return pboard_title;
	}



	public void setPboard_title(String pboard_title) {
		this.pboard_title = pboard_title;
	}



	public String getPboard_content() {
		return pboard_content;
	}



	public void setPboard_content(String pboard_content) {
		this.pboard_content = pboard_content;
	}



	public int getPboard_money() {
		return pboard_money;
	}



	public void setPboard_money(int pboard_money) {
		this.pboard_money = pboard_money;
	}


	public int getPboard_history() {
		return pboard_history;
	}



	public void setPboard_history(int pboard_history) {
		this.pboard_history = pboard_history;
	}



	public int getPboard_rangeMonth() {
		return pboard_rangeMonth;
	}



	public void setPboard_rangeMonth(int pboard_rangeMonth) {
		this.pboard_rangeMonth = pboard_rangeMonth;
	}



	public String getPboard_state() {
		return pboard_state;
	}



	public void setPboard_state(String pboard_state) {
		this.pboard_state = pboard_state;
	}



	public String getPboard_startDate() {
		return pboard_startDate;
	}



	public void setPboard_startDate(String pboard_startDate) {
		this.pboard_startDate = pboard_startDate;
	}



	public Timestamp getPboard_date() {
		return pboard_date;
	}



	public void setPboard_date(Timestamp pboard_date) {
		this.pboard_date = pboard_date;
	}



	public Timestamp getPboard_update() {
		return pboard_update;
	}



	public void setPboard_update(Timestamp pboard_update) {
		this.pboard_update = pboard_update;
	}



	public String getPboard_manager_phone() {
		return pboard_manager_phone;
	}



	public void setPboard_manager_phone(String pboard_manager_phone) {
		this.pboard_manager_phone = pboard_manager_phone;
	}


	public List<ProjectSkillDTO> getSkills() {
		return skills;
	}



	public void setSkills(List<ProjectSkillDTO> skills) {
		this.skills = skills;
	}



	public String getPboard_company_name() {
		return pboard_company_name;
	}



	public void setPboard_company_name(String pboard_company_name) {
		this.pboard_company_name = pboard_company_name;
	}



	@Override
	public String toString() {
		return "MyProjectDTO [pboard_id=" + pboard_id + ", user_no=" + user_no + ", pboard_title=" + pboard_title
				+ ", pboard_content=" + pboard_content + ", pboard_money=" + pboard_money + ", pboard_startDate="
				+ pboard_startDate + ", pboard_history=" + pboard_history + ", pboard_rangeMonth=" + pboard_rangeMonth
				+ ", pboard_state=" + pboard_state + ", pboard_date=" + pboard_date + ", pboard_update=" + pboard_update
				+ ", pboard_manager_phone=" + pboard_manager_phone + ", pboard_company_name=" + pboard_company_name
				+ ", job_id=" + job_id + ", pboard_isMatching=" + pboard_isMatching + ", skillList=" + skillList
				+ ", skills=" + skills + "]";
	}

	


	
}

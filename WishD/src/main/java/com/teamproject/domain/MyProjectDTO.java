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
	private int pboard_history;
	private int pboard_rangeMonth;
	private String pboard_state;
	private String pboard_date;
	private String pboard_update;
	private String pboard_manager_phone;
	private String pboard_ee_name;
	
	
	
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



	public String getPboard_startDate() {
		return pboard_startDate;
	}



	public void setPboard_startDate(String pboard_startDate) {
		this.pboard_startDate = pboard_startDate;
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



	public String getPboard_date() {
		return pboard_date;
	}



	public void setPboard_date(String pboard_date) {
		this.pboard_date = pboard_date;
	}



	public String getPboard_update() {
		return pboard_update;
	}



	public void setPboard_update(String pboard_update) {
		this.pboard_update = pboard_update;
	}



	public String getPboard_manager_phone() {
		return pboard_manager_phone;
	}



	public void setPboard_manager_phone(String pboard_manager_phone) {
		this.pboard_manager_phone = pboard_manager_phone;
	}



	public String getPboard_ee_name() {
		return pboard_ee_name;
	}



	public void setPboard_ee_name(String pboard_ee_name) {
		this.pboard_ee_name = pboard_ee_name;
	}



	public List<ProjectSkillDTO> getSkills() {
		return skills;
	}



	public void setSkills(List<ProjectSkillDTO> skills) {
		this.skills = skills;
	}



	@Override
	public String toString() {
		return "MyProjectDTO [pboard_id=" + pboard_id + ", user_no=" + user_no + ", pboard_title=" + pboard_title
				+ ", pboard_content=" + pboard_content + ", pboard_money=" + pboard_money + ", pboard_startDate="
				+ pboard_startDate + ", pboard_history=" + pboard_history + ", pboard_rangeMonth=" + pboard_rangeMonth
				+ ", pboard_state=" + pboard_state + ", pboard_date=" + pboard_date + ", pboard_update=" + pboard_update
				+ ", pboard_manager_phone=" + pboard_manager_phone + ", pboard_ee_name=" + pboard_ee_name + ", skills="
				+ skills + "]";
	}
	
	
	
}

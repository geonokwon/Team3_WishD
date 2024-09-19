package com.teamproject.domain;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

public class FreelancerDTO {
	
	
	private Long freelancer_id;
	private Long user_no;
	
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
	
    //skill String 으로 가져와서 배열로 나누는 값
    private Integer[] skillIdList;
	private String skillList;
	
    
    private List<FreelancerSkillDTO> skills;

    //프리랜서의 이름, FreelancerMapper.xml의 selectFreelancer_all에서 가져올수있음
    private String user_name;

    
    //전체job 조회시 사용
    private String jobList;
    private int job_id;
    private String job_name;
    
	//toString 오버라이드
	@Override
	public String toString() {
		return "FreelancerDTO [freelancer_id=" + freelancer_id + ", user_no=" + user_no + ", freelancer_salary="
				+ freelancer_salary + ", freelancer_startdate=" + freelancer_startdate + ", freelancer_exp="
				+ freelancer_exp + ", dev_exp=" + dev_exp + ", freelancer_job=" + freelancer_job
				+ ", freelancer_introdution=" + freelancer_introdution + ", freelancer_link=" + freelancer_link
				+ ", freelancer_state=" + freelancer_state + ", freelancer_date=" + freelancer_date
				+ ", freelancer_update=" + freelancer_update + ", skillIdList=" + Arrays.toString(skillIdList) + ", skills="
				+ skills + ", user_name=" + user_name + ", jobList=" + jobList + ", job_id=" + job_id + ", job_name="
				+ job_name + "]";
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




	public Integer[] getSkillIdList() {
		return skillIdList;
	}

	public void setSkillIdList(Integer[] skillIdList) {
		this.skillIdList = skillIdList;
	}

	public List<FreelancerSkillDTO> getSkills() {
		return skills;
	}

	public void setSkills(List<FreelancerSkillDTO> skills) {
		this.skills = skills;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getJobList() {
		return jobList;
	}

	public void setJobList(String jobList) {
		this.jobList = jobList;
	}




	public int getJob_id() {
		return job_id;
	}




	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}




	public String getJob_name() {
		return job_name;
	}




	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}


	public String getSkillList() {
		return skillList;
	}

	public void setSkillList(String skillList) {
		this.skillList = skillList;
	}
}

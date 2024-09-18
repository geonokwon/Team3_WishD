package com.teamproject.domain;


import java.sql.Timestamp;
import java.util.List;

public class ProjectDTO {

    private Long pboard_id;
    private Long user_no;
    private String pboard_title;
    private String pboard_content;
    private int pboard_money;
    private String pboard_startDate;
    private int pboard_rangeMonth;
    private String pboard_job;
    private String pboard_state;
    private Timestamp pboard_date;
    private Timestamp pboard_update;
    private Boolean pboard_isMatching;
    private String pboard_manager_phone;
    private String pboard_company_name;


    //skill String 으로 가져와서 배열로 나누는 값
    private String skillList;

    //pboard_id 값에 따른 skill 등록한것 가져오기
    private List<ProjectSkillDTO> skills;


    public String getSkillList() {
        return skillList;
    }

    public void setSkillList(String skillList) {
        this.skillList = skillList;
    }

    public Long getPboard_id() {
        return pboard_id;
    }

    public void setPboard_id(Long pboard_id) {
        this.pboard_id = pboard_id;
    }

    public Long getUser_no() {
        return user_no;
    }

    public void setUser_no(Long user_id) {
        this.user_no = user_id;
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

    public void setPboard_startDate(String pboard_startdate) {
        this.pboard_startDate = pboard_startdate;
    }

    public int getPboard_rangeMonth() {
        return pboard_rangeMonth;
    }

    public void setPboard_rangeMonth(int pboard_rangemonth) {
        this.pboard_rangeMonth = pboard_rangemonth;
    }

    public String getPboard_job() {
        return pboard_job;
    }

    public void setPboard_job(String pboard_job) {
        this.pboard_job = pboard_job;
    }

    public String getPboard_state() {
        return pboard_state;
    }

    public void setPboard_state(String pboard_state) {
        this.pboard_state = pboard_state;
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

    public List<ProjectSkillDTO> getSkills() {
        return skills;
    }
    public void setSkills(List<ProjectSkillDTO> skills) {
        this.skills = skills;
    }

    public Boolean getPboard_isMatching() {
        return pboard_isMatching;
    }

    public void setPboard_isMatching(Boolean pboard_isMatching) {
        this.pboard_isMatching = pboard_isMatching;
    }

    public String getPboard_manager_phone() {
        return pboard_manager_phone;
    }

    public void setPboard_manager_phone(String pboard_manager_phone) {
        this.pboard_manager_phone = pboard_manager_phone;
    }

    public String getPboard_company_name() {
        return pboard_company_name;
    }

    public void setPboard_company_name(String pboard_company_name) {
        this.pboard_company_name = pboard_company_name;
    }


    @Override
    public String toString() {
        return "ProjectDTO{" +
                "pboard_id=" + pboard_id +
                ", user_no=" + user_no +
                ", pboard_title='" + pboard_title + '\'' +
                ", pboard_content='" + pboard_content + '\'' +
                ", pboard_money=" + pboard_money +
                ", pboard_startDate='" + pboard_startDate + '\'' +
                ", pboard_rangeMonth=" + pboard_rangeMonth +
                ", pboard_job='" + pboard_job + '\'' +
                ", pboard_state='" + pboard_state + '\'' +
                ", pboard_date=" + pboard_date +
                ", pboard_update=" + pboard_update +
                ", pboard_isMatching=" + pboard_isMatching +
                ", pboard_manager_phone='" + pboard_manager_phone + '\'' +
                ", pboard_company_name='" + pboard_company_name + '\'' +
                ", skillList='" + skillList + '\'' +
                ", skills=" + skills +
                '}';
    }
}

package com.teamproject.domain;

import java.util.List;

public class ProjectRequestDTO {
    private Long f_request_id;
    private Long user_no;
    private Long pboard_id;
    private String f_request_title;
    private int job_id;
    private int f_request_history;
    private boolean f_request_exp;
    private Long f_request_money;
    private String f_request_startDate;
    private String f_request_date;
    private boolean f_request_isAgree;




    private String skillList;
    private List<ProjectSkillDTO> skills;




    public List<ProjectSkillDTO> getSkills() {
        return skills;
    }

    public void setSkills(List<ProjectSkillDTO> skills) {
        this.skills = skills;
    }

    public Long getF_request_id() {
        return f_request_id;
    }

    public void setF_request_id(Long f_request_id) {
        this.f_request_id = f_request_id;
    }

    public String getSkillList() {
        return skillList;
    }

    public void setSkillList(String skillList) {
        this.skillList = skillList;
    }

    public Long getUser_no() {
        return user_no;
    }

    public void setUser_no(Long user_no) {
        this.user_no = user_no;
    }

    public Long getPboard_id() {
        return pboard_id;
    }

    public void setPboard_id(Long pboard_id) {
        this.pboard_id = pboard_id;
    }

    public String getF_request_title() {
        return f_request_title;
    }

    public void setF_request_title(String f_request_title) {
        this.f_request_title = f_request_title;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public int getF_request_history() {
        return f_request_history;
    }

    public void setF_request_history(int f_request_history) {
        this.f_request_history = f_request_history;
    }

    public boolean getF_request_exp() {
        return f_request_exp;
    }

    public void setF_request_exp(boolean f_request_exp) {
        this.f_request_exp = f_request_exp;
    }

    public Long getF_request_money() {
        return f_request_money;
    }

    public void setF_request_money(Long f_request_money) {
        this.f_request_money = f_request_money;
    }

    public String getF_request_startDate() {
        return f_request_startDate;
    }

    public void setF_request_startDate(String f_request_startDate) {
        this.f_request_startDate = f_request_startDate;
    }

    public String getF_request_date() {
        return f_request_date;
    }

    public void setF_request_date(String f_request_date) {
        this.f_request_date = f_request_date;
    }

    public boolean getF_request_isAgree() {
        return f_request_isAgree;
    }

    public void setF_request_isAgree(boolean f_request_isAgree) {
        this.f_request_isAgree = f_request_isAgree;
    }


    @Override
    public String toString() {
        return "ProjectRequestDTO{" +
                "f_request_id=" + f_request_id +
                ", user_no=" + user_no +
                ", pboard_id=" + pboard_id +
                ", f_request_title='" + f_request_title + '\'' +
                ", job_id=" + job_id +
                ", f_request_history=" + f_request_history +
                ", f_request_exp=" + f_request_exp +
                ", f_request_money=" + f_request_money +
                ", f_request_startDate='" + f_request_startDate + '\'' +
                ", f_request_date='" + f_request_date + '\'' +
                ", f_request_isAgree=" + f_request_isAgree +
                ", skillList='" + skillList + '\'' +
                ", skills=" + skills +
                '}';
    }
}

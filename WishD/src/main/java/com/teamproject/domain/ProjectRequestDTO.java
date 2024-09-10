package com.teamproject.domain;

public class ProjectRequestDTO {
    private Long user_no;
    private Long pboard_id;
    private String f_request_title;
    private int f_request_job;
    private int f_request_history;
    private boolean f_request_exp;
    private Long f_request_money;
    private String f_request_startDate;
    private String f_request_date;

    //skill String 으로 가져와서 배열로 나누는 값
    private String skillList;

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

    public int getF_request_job() {
        return f_request_job;
    }

    public void setF_request_job(int f_request_job) {
        this.f_request_job = f_request_job;
    }

    public int getF_request_history() {
        return f_request_history;
    }

    public void setF_request_history(int f_request_history) {
        this.f_request_history = f_request_history;
    }

    public boolean isF_request_exp() {
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


    @Override
    public String toString() {
        return "ProjectRequestDTO{" +
                "user_no=" + user_no +
                ", pboard_id=" + pboard_id +
                ", f_request_title='" + f_request_title + '\'' +
                ", f_request_job=" + f_request_job +
                ", f_request_history=" + f_request_history +
                ", f_request_exp=" + f_request_exp +
                ", f_request_money=" + f_request_money +
                ", f_request_startDate='" + f_request_startDate + '\'' +
                ", f_request_date='" + f_request_date + '\'' +
                ", skillList='" + skillList + '\'' +
                '}';
    }
}

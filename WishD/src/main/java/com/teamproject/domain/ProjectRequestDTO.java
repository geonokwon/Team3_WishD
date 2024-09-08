package com.teamproject.domain;

public class ProjectRequestDTO {
    private Long user_no;
    private Long pboard_id;
    private String f_request_content;
    private int f_request_history;
    private boolean f_request_exp;
    private Long f_request_money;
    private String f_request_startDate;
    private String f_request_date;
    private int job_id;


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

    public String getF_request_content() {
        return f_request_content;
    }

    public void setF_request_content(String f_request_content) {
        this.f_request_content = f_request_content;
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

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }
}

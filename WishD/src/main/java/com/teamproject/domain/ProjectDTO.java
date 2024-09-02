package com.teamproject.domain;


import java.sql.Timestamp;

public class ProjectDTO {
    private Long pboard_id;
    private Long user_id;
    private String pboard_title;
    private String pboard_name;
    private String pboard_content;
    private int pboard_money;
    private Timestamp pboard_startDate;
    private int pboard_rangeMonth;
    private String pboard_job;
    private Long pboard_skill;
    private String pboard_state;
    private Timestamp pboard_date;
    private Timestamp pboard_update;


    public Long getPboard_id() {
        return pboard_id;
    }

    public void setPboard_id(Long pboard_id) {
        this.pboard_id = pboard_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getPboard_title() {
        return pboard_title;
    }

    public void setPboard_title(String pboard_title) {
        this.pboard_title = pboard_title;
    }

    public String getPboard_name() {
        return pboard_name;
    }

    public void setPboard_name(String pboard_name) {
        this.pboard_name = pboard_name;
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

    public Timestamp getPboard_startDate() {
        return pboard_startDate;
    }

    public void setPboard_startDate(Timestamp pboard_startDate) {
        this.pboard_startDate = pboard_startDate;
    }

    public int getPboard_rangeMonth() {
        return pboard_rangeMonth;
    }

    public void setPboard_rangeMonth(int pboard_rangeMonth) {
        this.pboard_rangeMonth = pboard_rangeMonth;
    }

    public String getPboard_job() {
        return pboard_job;
    }

    public void setPboard_job(String pboard_job) {
        this.pboard_job = pboard_job;
    }

    public Long getPboard_skill() {
        return pboard_skill;
    }

    public void setPboard_skill(Long pboard_skill) {
        this.pboard_skill = pboard_skill;
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
}

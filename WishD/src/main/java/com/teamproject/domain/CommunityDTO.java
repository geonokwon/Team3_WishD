package com.teamproject.domain;

import java.sql.Timestamp;

public class CommunityDTO {

	private long ncommunity_num;
	private long admin_id;
	private String ncommunity_title;
	private String ncommunity_content;
	private Timestamp ncommunity_date;
	private Timestamp ncommunity_update;
	private Long user_no;
	
	public Long getUser_no() {
		return user_no;
	}
	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}
	public long getNcommunity_num() {
		return ncommunity_num;
	}
	public void setNcommunity_num(long ncommunity_num) {
		this.ncommunity_num = ncommunity_num;
	}
	public long getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(long admin_id) {
		this.admin_id = admin_id;
	}
	public String getNcommunity_title() {
		return ncommunity_title;
	}
	public void setNcommunity_title(String ncommunity_title) {
		this.ncommunity_title = ncommunity_title;
	}
	public String getNcommunity_content() {
		return ncommunity_content;
	}
	public void setNcommunity_content(String ncommunity_content) {
		this.ncommunity_content = ncommunity_content;
	}
	public Timestamp getNcommunity_date() {
		return ncommunity_date;
	}
	public void setNcommunity_date(Timestamp ncommunity_date) {
		this.ncommunity_date = ncommunity_date;
	}
	public Timestamp getNcommunity_update() {
		return ncommunity_update;
	}
	public void setNcommunity_update(Timestamp ncommunity_update) {
		this.ncommunity_update = ncommunity_update;
	}
	@Override
	public String toString() {
		return "CommunityDTO [ncommunity_num=" + ncommunity_num + ", admin_id=" + admin_id + ", ncommunity_title="
				+ ncommunity_title + ", ncommunity_content=" + ncommunity_content + ", ncommunity_date="
				+ ncommunity_date + ", ncommunity_update=" + ncommunity_update + "]";
	}
	
	
}	
	
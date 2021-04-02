package com.spring.w3m.notice.admin.vo;

import java.util.Date;

public class TosVO {
	private String tos_writer;
	private String tos_content;
	private Date tos_date;
	
	
	public Date getTos_date() {
		return tos_date;
	}
	public void setTos_date(Date tos_date) {
		this.tos_date = tos_date;
	}
	public String getTos_writer() {
		return tos_writer;
	}
	public void setTos_writer(String tos_writer) {
		this.tos_writer = tos_writer;
	}
	public String getTos_content() {
		return tos_content;
	}
	public void setTos_content(String tos_content) {
		this.tos_content = tos_content;
	}
	
	
}

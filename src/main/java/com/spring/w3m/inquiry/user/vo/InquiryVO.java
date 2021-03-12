package com.spring.w3m.inquiry.user.vo;

import java.util.Date;

public class InquiryVO {
	private int inq_seq;
	private String inq_title;
	private String inq_writer;
	private String inq_content;
	private Date inq_date;
	private int inq_cnt;
	public int getInq_seq() {
		return inq_seq;
	}
	public void setInq_seq(int inq_seq) {
		this.inq_seq = inq_seq;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_writer() {
		return inq_writer;
	}
	public void setInq_writer(String inq_writer) {
		this.inq_writer = inq_writer;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
	public int getInq_cnt() {
		return inq_cnt;
	}
	public void setInq_cnt(int inq_cnt) {
		this.inq_cnt = inq_cnt;
	}
	@Override
	public String toString() {
		return "InquiryVO [inq_seq=" + inq_seq + ", inq_title=" + inq_title + ", inq_writer=" + inq_writer
				+ ", inq_content=" + inq_content + ", inq_date=" + inq_date + ", inq_cnt=" + inq_cnt + "]";
	}
	

}
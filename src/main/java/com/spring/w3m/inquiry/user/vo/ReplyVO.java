package com.spring.w3m.inquiry.user.vo;

import java.util.Date;

public class ReplyVO {
	private int inq_seq;
	private int re_seq;
	private String re_content;
	private String re_writer;
	private Date re_date;
	
	
	private int review_seq;
	private int review_re_seq;
	private String review_re_content;
	private String review_re_writer;
	private Date review_re_date;
	
	public String getReview_re_writer() {
		return review_re_writer;
	}
	public void setReview_re_writer(String review_re_writer) {
		this.review_re_writer = review_re_writer;
	}
	public Date getReview_re_date() {
		return review_re_date;
	}
	public void setReview_re_date(Date review_re_date) {
		this.review_re_date = review_re_date;
	}
	public String getReview_re_content() {
		return review_re_content;
	}
	public void setReview_re_content(String review_re_content) {
		this.review_re_content = review_re_content;
	}
	public int getReview_re_seq() {
		return review_re_seq;
	}
	public void setReview_re_seq(int review_re_seq) {
		this.review_re_seq = review_re_seq;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public int getInq_seq() {
		return inq_seq;
	}
	public void setInq_seq(int inq_seq) {
		this.inq_seq = inq_seq;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [inq_seq=" + inq_seq + ", re_seq=" + re_seq + ", re_content=" + re_content + ", re_writer="
				+ re_writer + ", re_date=" + re_date + "]";
	}
	
}

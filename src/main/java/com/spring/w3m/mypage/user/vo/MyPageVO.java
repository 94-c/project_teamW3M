package com.spring.w3m.mypage.user.vo;

import java.util.Date;

public class MyPageVO {
	private int inq_seq;
	private String inq_title;
	private String inq_writer;
	private String inq_content;
	private String inq_email;
	private Date inq_date;
	private int inq_pass;
	private int inq_cnt;
	private String inq_image;
	private String prod_code;
	private String searchType;
	private String keyword;
	private int review_seq;
	private String review_title;
	private String review_writer;
	private String review_content;
	private String review_email;
	private Date review_date;
	private int review_pass;
	private int review_cnt;
	private String user_email;
	private String table_name;
	
	
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
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
	public String getInq_email() {
		return inq_email;
	}
	public void setInq_email(String inq_email) {
		this.inq_email = inq_email;
	}
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
	public int getInq_pass() {
		return inq_pass;
	}
	public void setInq_pass(int inq_pass) {
		this.inq_pass = inq_pass;
	}
	public int getInq_cnt() {
		return inq_cnt;
	}
	public void setInq_cnt(int inq_cnt) {
		this.inq_cnt = inq_cnt;
	}
	public String getInq_image() {
		return inq_image;
	}
	public void setInq_image(String inq_image) {
		this.inq_image = inq_image;
	}
	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_email() {
		return review_email;
	}
	public void setReview_email(String review_email) {
		this.review_email = review_email;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_pass() {
		return review_pass;
	}
	public void setReview_pass(int review_pass) {
		this.review_pass = review_pass;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	
	@Override
	public String toString() {
		return "MyPageVO [inq_seq=" + inq_seq + ", inq_title=" + inq_title + ", inq_writer=" + inq_writer
				+ ", inq_content=" + inq_content + ", inq_email=" + inq_email + ", inq_date=" + inq_date + ", inq_pass="
				+ inq_pass + ", inq_cnt=" + inq_cnt + ", inq_image=" + inq_image + ", prod_code=" + prod_code
				+ ", searchType=" + searchType + ", keyword=" + keyword + ", review_seq=" + review_seq
				+ ", review_title=" + review_title + ", review_writer=" + review_writer + ", review_content="
				+ review_content + ", review_email=" + review_email + ", review_date=" + review_date + ", review_pass="
				+ review_pass + ", review_cnt=" + review_cnt + ", user_email=" + user_email + ", table_name="
				+ table_name + "]";
	}

}

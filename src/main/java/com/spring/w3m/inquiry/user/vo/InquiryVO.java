package com.spring.w3m.inquiry.user.vo;

import java.util.Date;

import com.spring.w3m.paging.common.Pagination;

public class InquiryVO {
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

	Pagination p = new Pagination();

	public String getProd_code() {
		return prod_code;
	}

	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}

	public String getInq_image() {
		return inq_image;
	}

	public void setInq_image(String inq_image) {
		this.inq_image = inq_image;
	}

	public String getInq_email() {
		return inq_email;
	}

	public void setInq_email(String inq_email) {
		this.inq_email = inq_email;
	}

	public int getInq_pass() {
		return inq_pass;
	}

	public void setInq_pass(int inq_pass) {
		this.inq_pass = inq_pass;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = p.getSearchType();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = p.getKeyword();
	}

	@Override
	public String toString() {
		return "InquiryVO [inq_seq=" + inq_seq + ", inq_title=" + inq_title + ", inq_writer=" + inq_writer
				+ ", inq_content=" + inq_content + ", inq_email=" + inq_email + ", inq_date=" + inq_date + ", inq_pass="
				+ inq_pass + ", inq_cnt=" + inq_cnt + ", inq_image=" + inq_image + ", prod_code=" + prod_code
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}

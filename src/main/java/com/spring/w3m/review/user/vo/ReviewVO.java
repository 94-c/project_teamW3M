package com.spring.w3m.review.user.vo;

import java.util.Date;

public class ReviewVO {
	private int review_seq;
	private String review_title;
	private String review_writer;
	private String review_content;
	private String review_email;
	private Date review_date;
	private int review_pass;
	private int review_cnt;
	private String review_image;
	private String prod_code;
	private String prod_title;
	private String prod_title_image;
	private String searchType;
	private String keyword;
	private int reply_cnt;

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

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public String getProd_code() {
		return prod_code;
	}

	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}

	public String getProd_title() {
		return prod_title;
	}

	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
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

	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public String getProd_title_image() {
		return prod_title_image;
	}

	public void setProd_title_image(String prod_title_image) {
		this.prod_title_image = prod_title_image;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_seq=" + review_seq + ", review_title=" + review_title + ", review_writer="
				+ review_writer + ", review_content=" + review_content + ", review_email=" + review_email
				+ ", review_date=" + review_date + ", review_pass=" + review_pass + ", review_cnt=" + review_cnt
				+ ", review_image=" + review_image + ", prod_code=" + prod_code + ", prod_title=" + prod_title
				+ ", prod_title_image=" + prod_title_image + ", searchType=" + searchType + ", keyword=" + keyword
				+ ", reply_cnt=" + reply_cnt + "]";
	}

}

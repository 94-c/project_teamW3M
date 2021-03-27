package com.spring.w3m.review.user.vo;

import java.util.Date;

public class ReviewVO {
	private String prod_code; // 해당 제품의 코드
	private String prod_url; // 해당 상품 주소
	private String prod_title_image; //해당 제품의 타이틀이미지
	private String user_name; 
	private String review_pass;
	private int review_seq;
	private String review_title;
	private String review_content;
	private Date review_date; 
	private int review_cnt;
	
	
	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	public String getProd_url() {
		return prod_url;
	}
	public void setProd_url(String prod_url) {
		this.prod_url = prod_url;
	}
	public String getProd_title_image() {
		return prod_title_image;
	}
	public void setProd_title_image(String prod_title_image) {
		this.prod_title_image = prod_title_image;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReview_pass() {
		return review_pass;
	}
	public void setReview_pass(String review_pass) {
		this.review_pass = review_pass;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [prod_code=" + prod_code + ", prod_url=" + prod_url + ", prod_title_image=" + prod_title_image
				+ ", user_name=" + user_name + ", review_pass=" + review_pass + ", review_seq=" + review_seq
				+ ", review_title=" + review_title + ", review_content=" + review_content + ", review_date="
				+ review_date + ", review_cnt=" + review_cnt + "]";
	}
	
	
	
}

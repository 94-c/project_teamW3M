package com.spring.w3m.statistics.admin.vo;

import java.util.Date;

public class StatisticsVO {
	// 매출 수
	private String user_gender;// 성별
	private int user_count;//성별 회원수
	private int total_sum;//총 구매 금액
	private int total_use_point=0;//사용한 적립금
	private int prod_count =0;//제품 수
	private int prod_cencle =0;//취소 수
	private int join_count=0;//회원가입수
	//날짜별 매출 수
	private Date date_total;//날짜
	
	//날짜 범위
	private Date StartDate;//시작 날짜
	private Date EndDate;//끝 날짜
	@Override
	public String toString() {
		return "StatisticsVO [user_gender=" + user_gender + ", user_count=" + user_count + ", total_sum=" + total_sum
				+ ", total_use_point=" + total_use_point + ", prod_count=" + prod_count + ", prod_cencle=" + prod_cencle
				+ ", join_count=" + join_count + ", date_total=" + date_total + ", StartDate=" + StartDate
				+ ", EndDate=" + EndDate + "]";
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getUser_count() {
		return user_count;
	}
	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}
	public int getTotal_sum() {
		return total_sum;
	}
	public void setTotal_sum(int total_sum) {
		this.total_sum = total_sum;
	}
	public int getTotal_use_point() {
		return total_use_point;
	}
	public void setTotal_use_point(int total_use_point) {
		this.total_use_point = total_use_point;
	}
	public int getProd_count() {
		return prod_count;
	}
	public void setProd_count(int prod_count) {
		this.prod_count = prod_count;
	}
	public int getProd_cencle() {
		return prod_cencle;
	}
	public void setProd_cencle(int prod_cencle) {
		this.prod_cencle = prod_cencle;
	}
	public int getJoin_count() {
		return join_count;
	}
	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}
	public Date getDate_total() {
		return date_total;
	}
	public void setDate_total(Date date_total) {
		this.date_total = date_total;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
	
	
	
}

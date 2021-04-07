package com.spring.w3m.statistics.admin.vo;

import java.util.Date;

public class StatisticsVO {
	//성비별 매출 수
	private String user_gender;// 성별
	private int user_count;//성별 회원수
	private int total_sum;//총 구매 금액
	
	//날짜별 매출 수
	private Date date_total;//날짜
	
	//날짜 범위
	private Date StartDate;//시작 날짜
	private Date EndDate;//끝 날짜
	
	@Override
	public String toString() {
		return "StatisticsVO [user_gender=" + user_gender + ", user_count=" + user_count + ", total_sum=" + total_sum
				+ ", date_total=" + date_total + ", StartDate=" + StartDate + ", EndDate=" + EndDate + "]";
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
	public Date getDate_total() {
		return date_total;
	}
	public void setDate_total(Date date_total) {
		this.date_total = date_total;
	}
	
}

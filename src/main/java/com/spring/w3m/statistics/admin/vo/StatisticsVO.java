package com.spring.w3m.statistics.admin.vo;

public class StatisticsVO {
	//성비별 매출 수
	private String user_gender;// 성별
	private int user_count;//성별 회원수
	private int total_sum;//총 구매 금액
	
	
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
	
}

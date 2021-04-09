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
	private String user_level;//회원 레발
	
	private int fineDust_Mask;//미세먼지
	private int splash_Mask;//비말
	private int hand_Sanitizer;//손세정제
	private int coolPatch;//쿨패치
	private int hotPack;//핫팩
	private int thermometer;//체온계
	//날짜별 매출 수
	private Date date_total;//날짜
	
	//날짜 범위
	private Date StartDate;//시작 날짜
	private Date EndDate;//끝 날짜
	
	//엑셀
	private int order_seq;
	private String user_id;
	private String prod_code;
	private String prod_title;
	private int prod_amount;
	private int pay_use_point;
	private int pay_total_money;
	private String pay_tool;
	private String StartDate1;//시작 날짜
	private Date order_date;
	@Override
	public String toString() {
		return "StatisticsVO [user_gender=" + user_gender + ", user_count=" + user_count + ", total_sum=" + total_sum
				+ ", total_use_point=" + total_use_point + ", prod_count=" + prod_count + ", prod_cencle=" + prod_cencle
				+ ", join_count=" + join_count + ", user_level=" + user_level + ", fineDust_Mask=" + fineDust_Mask
				+ ", splash_Mask=" + splash_Mask + ", hand_Sanitizer=" + hand_Sanitizer + ", coolPatch=" + coolPatch
				+ ", hotPack=" + hotPack + ", thermometer=" + thermometer + ", date_total=" + date_total
				+ ", StartDate=" + StartDate + ", EndDate=" + EndDate + ", order_seq=" + order_seq + ", user_id="
				+ user_id + ", prod_code=" + prod_code + ", prod_title=" + prod_title + ", prod_amount=" + prod_amount
				+ ", pay_use_point=" + pay_use_point + ", pay_total_money=" + pay_total_money + ", pay_tool=" + pay_tool
				+ ", StartDate1=" + StartDate1 + ", order_date=" + order_date + "]";
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
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public int getFineDust_Mask() {
		return fineDust_Mask;
	}
	public void setFineDust_Mask(int fineDust_Mask) {
		this.fineDust_Mask = fineDust_Mask;
	}
	public int getSplash_Mask() {
		return splash_Mask;
	}
	public void setSplash_Mask(int splash_Mask) {
		this.splash_Mask = splash_Mask;
	}
	public int getHand_Sanitizer() {
		return hand_Sanitizer;
	}
	public void setHand_Sanitizer(int hand_Sanitizer) {
		this.hand_Sanitizer = hand_Sanitizer;
	}
	public int getCoolPatch() {
		return coolPatch;
	}
	public void setCoolPatch(int coolPatch) {
		this.coolPatch = coolPatch;
	}
	public int getHotPack() {
		return hotPack;
	}
	public void setHotPack(int hotPack) {
		this.hotPack = hotPack;
	}
	public int getThermometer() {
		return thermometer;
	}
	public void setThermometer(int thermometer) {
		this.thermometer = thermometer;
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
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}
	public int getPay_use_point() {
		return pay_use_point;
	}
	public void setPay_use_point(int pay_use_point) {
		this.pay_use_point = pay_use_point;
	}
	public int getPay_total_money() {
		return pay_total_money;
	}
	public void setPay_total_money(int pay_total_money) {
		this.pay_total_money = pay_total_money;
	}
	public String getPay_tool() {
		return pay_tool;
	}
	public void setPay_tool(String pay_tool) {
		this.pay_tool = pay_tool;
	}
	public String getStartDate1() {
		return StartDate1;
	}
	public void setStartDate1(String startDate1) {
		StartDate1 = startDate1;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
}

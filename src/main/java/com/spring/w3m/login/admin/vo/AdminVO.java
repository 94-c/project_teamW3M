package com.spring.w3m.login.admin.vo;

import java.util.Date;

import com.spring.w3m.paging.common.Pagination;

public class AdminVO {
	private String admin_id; //관리자 아이디
	private String admin_password; //관리자 비밀번호
	private String admin_name; //관리자 이름
	private String admin_role; //관리자 역할

	
	//관리차 페이지 주문보기 vo
	private String user_name;
	private String user_id;
	private int order_seq;
	private String prod_title;
	private Date order_date;
	private String delivery_state;
	private int pay_total_money;
	
	
	//페이징
	private String searchType;
	private String keyword;	
	Pagination p = new Pagination();
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getDelivery_state() {
		return delivery_state;
	}
	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}
	public int getPay_total_money() {
		return pay_total_money;
	}
	public void setPay_total_money(int pay_total_money) {
		this.pay_total_money = pay_total_money;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_role() {
		return admin_role;
	}
	public void setAdmin_role(String admin_role) {
		this.admin_role = admin_role;
	}
	
	
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_password=" + admin_password + ", admin_name=" + admin_name
				+ ", admin_role=" + admin_role + "]";
	}
	
	
}

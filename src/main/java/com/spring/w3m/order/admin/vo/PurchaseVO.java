package com.spring.w3m.order.admin.vo;

import java.util.Date;

public class PurchaseVO {
	// 관리차 페이지 주문보기 vo
	private String user_name;
	private String user_id;
	private int order_seq;
	private String prod_title;
	private Date order_date;
	private String delivery_state;
	private int pay_total_money;
	private String searchType;
	private String keyword;

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

	@Override
	public String toString() {
		return "orderVO [user_name=" + user_name + ", user_id=" + user_id + ", order_seq=" + order_seq + ", prod_title="
				+ prod_title + ", order_date=" + order_date + ", delivery_state=" + delivery_state
				+ ", pay_total_money=" + pay_total_money + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}

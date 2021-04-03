package com.spring.w3m.point.user.vo;

import java.util.Date;



public class PointVO {
	private String user_id;
	private int add_point;
	private Date use_date;
	private int order_seq;
	private String point_content;
	private String order_state;
	@Override
	public String toString() {
		return "PointVO [user_id=" + user_id + ", add_point=" + add_point + ", use_date=" + use_date + ", order_seq="
				+ order_seq + ", point_content=" + point_content + ", order_state=" + order_state + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAdd_point() {
		return add_point;
	}
	public void setAdd_point(int add_point) {
		this.add_point = add_point;
	}
	public Date getUse_date() {
		return use_date;
	}
	public void setUse_date(Date use_date) {
		this.use_date = use_date;
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	
	
}

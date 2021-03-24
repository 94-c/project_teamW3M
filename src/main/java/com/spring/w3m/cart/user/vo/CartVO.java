package com.spring.w3m.cart.user.vo;

public class CartVO {
	
	private int cart_id; //cart 번호 seq
	private String user_id; // user_member 테이블에 user_id -FK
	private String prod_code; //product 테이블에  prod_code -FK
	private String prod_title; // product 테이블에 prod_title
	private String prod_title_image; // product 테이블에 prod_title_image
	private int order_cnt; // 수문 수량
	private int prod_point; // product 테이블에 prod_point
	private int prod_price; // product 테이블에 prod_price
	private int total_price; // 가격 * 수량 
	
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", prod_code=" + prod_code + ", prod_title="
				+ prod_title + ", prod_title_image=" + prod_title_image + ", order_cnt=" + order_cnt + ", prod_point="
				+ prod_point + ", prod_price=" + prod_price + ", total_price=" + total_price + "]";
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public String getProd_title_image() {
		return prod_title_image;
	}
	public void setProd_title_image(String prod_title_image) {
		this.prod_title_image = prod_title_image;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public int getProd_point() {
		return prod_point;
	}
	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
}

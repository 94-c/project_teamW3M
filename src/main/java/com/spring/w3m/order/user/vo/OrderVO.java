package com.spring.w3m.order.user.vo;

import java.util.Date;

public class OrderVO {
	//주문
	private int order_seq;//주문 번호 PK
	private Date order_date;//주문날짜
	private String order_status;// 주문상태  -- 결제완료 > 배송 준비중 > 배송중 > 배송완료
	
	//유저 
	private String user_id;//유저 아이디 FK
	private String user_name;//유저 네임
	private String user_email;//유저 이메일
	private String user_phone;//유저 폰
	private String user_zipcode;//유저 우펀번호
	private String user_address1;//주소
	private String user_address2;//상세주소
	
	//배송지 
	private String receiver_name;// 받는 사람
	private String receiver_phone1;// 받는 사람 폰 1
	private String receiver_phone2;// 받는 사람 폰 1
	private String receiver_zipcode;//받는 사람 우펀번호
	private String receiver_address1;//주소
	private String receiver_address2;//상세주소
	private String receiver_memo;//메모
	
	//제품
	private String prod_code;//제품코드 FK
	private int prod_seq;//제품 시퀀스 
	private int prod_amount;//최종 제품 수량
	private String prod_title;//제품 타이틀
	private String prod_title_image;//제품 타이틀 이미지
	private int prod_price;//제품 가격
	private int prod_price_sale;//제품 가격 세일가
	private int prod_point;//제품 적립금
	private int prod_total_price;//제품 총 가격
	private int prod_total_point;//제품 총 포인트
	
	//결제
	private int pay_total_price;//총 결제 금액
	private String pay_tool;// 결제 수단
	private String pay_status;//결제상태 
	
	@Override
	public String toString() {
		return "OrderVO [order_seq=" + order_seq + ", order_date=" + order_date + ", order_status=" + order_status
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email + ", user_phone="
				+ user_phone + ", user_zipcode=" + user_zipcode + ", user_address1=" + user_address1
				+ ", user_address2=" + user_address2 + ", receiver_name=" + receiver_name + ", receiver_phone1="
				+ receiver_phone1 + ", receiver_phone2=" + receiver_phone2 + ", receiver_zipcode=" + receiver_zipcode
				+ ", receiver_address1=" + receiver_address1 + ", receiver_address2=" + receiver_address2
				+ ", receiver_memo=" + receiver_memo + ", prod_code=" + prod_code + ", prod_seq=" + prod_seq
				+ ", prod_amount=" + prod_amount + ", prod_title=" + prod_title + ", prod_title_image="
				+ prod_title_image + ", prod_price=" + prod_price + ", prod_price_sale=" + prod_price_sale
				+ ", prod_point=" + prod_point + ", prod_total_price=" + prod_total_price + ", prod_total_point="
				+ prod_total_point + ", pay_total_price=" + pay_total_price + ", pay_tool=" + pay_tool + ", pay_status="
				+ pay_status + "]";
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_phone1() {
		return receiver_phone1;
	}
	public void setReceiver_phone1(String receiver_phone1) {
		this.receiver_phone1 = receiver_phone1;
	}
	public String getReceiver_phone2() {
		return receiver_phone2;
	}
	public void setReceiver_phone2(String receiver_phone2) {
		this.receiver_phone2 = receiver_phone2;
	}
	public String getReceiver_zipcode() {
		return receiver_zipcode;
	}
	public void setReceiver_zipcode(String receiver_zipcode) {
		this.receiver_zipcode = receiver_zipcode;
	}
	public String getReceiver_address1() {
		return receiver_address1;
	}
	public void setReceiver_address1(String receiver_address1) {
		this.receiver_address1 = receiver_address1;
	}
	public String getReceiver_address2() {
		return receiver_address2;
	}
	public void setReceiver_address2(String receiver_address2) {
		this.receiver_address2 = receiver_address2;
	}
	public String getReceiver_memo() {
		return receiver_memo;
	}
	public void setReceiver_memo(String receiver_memo) {
		this.receiver_memo = receiver_memo;
	}
	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	public int getProd_seq() {
		return prod_seq;
	}
	public void setProd_seq(int prod_seq) {
		this.prod_seq = prod_seq;
	}
	public int getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
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
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_point() {
		return prod_point;
	}
	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}
	public int getProd_total_price() {
		return prod_total_price;
	}
	public void setProd_total_price(int prod_total_price) {
		this.prod_total_price = prod_total_price;
	}
	public int getProd_total_point() {
		return prod_total_point;
	}
	public void setProd_total_point(int prod_total_point) {
		this.prod_total_point = prod_total_point;
	}
	public int getPay_total_price() {
		return pay_total_price;
	}
	public void setPay_total_price(int pay_total_price) {
		this.pay_total_price = pay_total_price;
	}
	public String getPay_tool() {
		return pay_tool;
	}
	public void setPay_tool(String pay_tool) {
		this.pay_tool = pay_tool;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public int getProd_price_sale() {
		return prod_price_sale;
	}
	public void setProd_price_sale(int prod_price_sale) {
		this.prod_price_sale = prod_price_sale;
	}
	
	
	
	
}

package com.spring.w3m.delivery.common.vo;
/*
관련 테이블
CREATE TABLE delivery(
	delivery_seq INT, --송장번호(PK)
	order_seq INT, --주문번호(FK)
	order_product VARCHAR(200), --주문 상품명 & 품목수 (ex. W3M 프리미엄 미세먼지마스크 KF94 대형 25개입 외 3)
	user_id VARCHAR(20), -- 회원ID
	receiver_name VARCHAR(20) NOT NULL,-- 수령인
	receiver_address VARCHAR(200) NOT NULL, -- 배송주소
	receiver_phone VARCHAR(20) NOT NULL, -- 수령인 연락처
	order_date TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp, -- 주문날짜
	delivery_state VARCHAR(20) DEFAULT '배송전', -- 배송상태 // 배송전 > 배송중 > 배송완료 ||주문취소
	
	CONSTRAINT PK_delivery_seq PRIMARY KEY (delivery_seq)
);
CREATE SEQUENCE delivery_seq START 1; --송장번호 시퀀스 생성
*/
import java.util.Date;

public class DeliveryVO {
	private int delivery_seq;
	private int order_seq;
	private String order_product;
	private String user_id;
	private String receiver_name;
	private String receiver_address;
	private String receiver_phone;
	private Date order_date;
	private String delivery_state;

	public int getDelivery_seq() {
		return delivery_seq;
	}
	public void setDelivery_seq(int delivery_seq) {
		this.delivery_seq = delivery_seq;
	}
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getOrder_product() {
		return order_product;
	}
	public void setOrder_product(String order_product) {
		this.order_product = order_product;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_address() {
		return receiver_address;
	}
	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
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
	@Override
	public String toString() {
		return "DeliveryVO [delivery_seq=" + delivery_seq + ", order_seq=" + order_seq + ", order_product="
				+ order_product + ", user_id=" + user_id + ", receiver_name=" + receiver_name + ", receiver_address="
				+ receiver_address + ", receiver_phone=" + receiver_phone + ", order_date=" + order_date
				+ ", delivery_state=" + delivery_state + "]";
	}
	
}

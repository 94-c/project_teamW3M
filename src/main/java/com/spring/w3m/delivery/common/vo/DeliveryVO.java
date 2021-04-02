package com.spring.w3m.delivery.common.vo;
/*
--배송현황 테이블--
CREATE TABLE delivery(
   delivery_seq INT, --송장번호(PK)
   order_seq INT, --주문번호(FK)
   prod_title VARCHAR(200), --상품명 ex) 첫번쨰 타이틀 명 외 (총카운트에 -1)
   user_id VARCHAR(20), -- 회원ID
   receiver_name VARCHAR(20) NOT NULL,-- 수령인
   receiver_zipcode VARCHAR(50) NOT NULL, -- 배송우편번호
   receiver_address1 VARCHAR(100) NOT NULL, -- 배송주소1
   receiver_address2 VARCHAR(100) NOT NULL, -- 배송주소2
   receiver_phone1 VARCHAR(30) NOT NULL, -- 수령인 연락처1
   receiver_phone2 VARCHAR(30) NOT NULL, -- 수령인 연락처2
   receiver_memo VARCHAR(200) NOT NULL, -- 배송 메모
   order_date TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp, -- 주문날짜
   delivery_state VARCHAR(20) DEFAULT '배송전', -- 배송상태 // 배송전 > 배송중 > 배송완료 ||주문취소
   
   CONSTRAINT PK_delivery_seq PRIMARY KEY (delivery_seq),
   CONSTRAINT delivery_order_seq FOREIGN KEY (ORDER_SEQ) REFERENCES ORDER_LIST(ORDER_SEQ) on Delete set null
);
CREATE SEQUENCE delivery_seq START 1; --송장번호 시퀀스 생성
*/
import java.util.Date;

import com.spring.w3m.paging.common.Pagination;

public class DeliveryVO {
	private int delivery_seq;
	private int order_seq;
	private String prod_title;
	private String user_id;
	private String receiver_name;
	private String receiver_zipcode;	
	private String receiver_address1;
	private String receiver_address2;
	private String receiver_phone1;
	private String receiver_phone2;
	private String receiver_memo;
	private Date order_date;
	private String delivery_state;
	private String searchType;
	private String keyword;
	private Date state_date;
	
	Pagination p = new Pagination();
	
	
	public Date getState_date() {
		return state_date;
	}
	public void setState_date(Date state_date) {
		this.state_date = state_date;
	}
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
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
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
	public String getReceiver_memo() {
		return receiver_memo;
	}
	public void setReceiver_memo(String receiver_memo) {
		this.receiver_memo = receiver_memo;
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
		return "DeliveryVO [delivery_seq=" + delivery_seq + ", order_seq=" + order_seq + ", prod_title=" + prod_title
				+ ", user_id=" + user_id + ", receiver_name=" + receiver_name + ", receiver_zipcode=" + receiver_zipcode
				+ ", receiver_address1=" + receiver_address1 + ", receiver_address2=" + receiver_address2
				+ ", receiver_phone1=" + receiver_phone1 + ", receiver_phone2=" + receiver_phone2 + ", receiver_memo="
				+ receiver_memo + ", order_date=" + order_date + ", delivery_state=" + delivery_state + ", searchType="
				+ searchType + ", keyword=" + keyword + "]";
	}
	
}

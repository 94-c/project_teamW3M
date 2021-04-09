package com.spring.w3m.order.user.vo;

public class LastAddress {
	private String receiver_name;// 받는 사람
	private String receiver_phone1;// 받는 사람 폰 1
	private String receiver_phone2;// 받는 사람 폰 1
	private String receiver_zipcode;// 받는 사람 우펀번호
	private String receiver_address1;// 주소
	private String receiver_address2;// 상세주소
	private String user_id;// 회원 아이디
	private int last_address_seq;// 시퀀스

	@Override
	public String toString() {
		return "LastAddress [receiver_name=" + receiver_name + ", receiver_phone1=" + receiver_phone1
				+ ", receiver_phone2=" + receiver_phone2 + ", receiver_zipcode=" + receiver_zipcode
				+ ", receiver_address1=" + receiver_address1 + ", receiver_address2=" + receiver_address2 + ", user_id="
				+ user_id + ", last_address_seq=" + last_address_seq + "]";
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getLast_address_seq() {
		return last_address_seq;
	}

	public void setLast_address_seq(int last_address_seq) {
		this.last_address_seq = last_address_seq;
	}

}

package com.spring.w3m.join.user.vo;

import java.util.Date;

public class UserVO {
	private String user_id; // 아이디 PK
	private String user_password; //패스워드
	private String user_name; //이름
	private String user_birthday; //생년월일
	private String user_gender; //성별
	private String user_email; //이메일 주소
	private String user_zipcode; //우편번호
	private String user_address1; //주소
	private String user_address2; //상세주소
	private Date user_join_date; //가입 날짜
	private Date user_last_login; //마지막 접속 날짜
	private String user_phone; //폰번호
	private String user_point; //포인트
	private Boolean user_marketing_mail; //마케팅 메일 동의
	private Boolean user_marketing_sms; //마케팅 문자 동의
	private String user_level; //등급 DEFAULT 'Bronze', -- 회원등급 //Bronze , silver, gold, Platinum,dia
	private String user_state; //1 : 정상 2 : 휴먼 3: 삭제(3개월 보관) 0: 어드민
	private Long user_seq; // 회원 번호
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
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
	
	public Date getUser_join_date() {
		return user_join_date;
	}
	public void setUser_join_date(Date user_join_date) {
		this.user_join_date = user_join_date;
	}
	
	public Date getUser_last_login() {
		return user_last_login;
	}
	public void setUser_last_login(Date user_last_login) {
		this.user_last_login = user_last_login;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_point() {
		return user_point;
	}
	public void setUser_point(String user_point) {
		this.user_point = user_point;
	}
	public Boolean getUser_marketing_mail() {
		return user_marketing_mail;
	}
	public void setUser_marketing_mail(Boolean user_marketing_mail) {
		this.user_marketing_mail = user_marketing_mail;
	}
	public Boolean getUser_marketing_sms() {
		return user_marketing_sms;
	}
	public void setUser_marketing_sms(Boolean user_marketing_sms) {
		this.user_marketing_sms = user_marketing_sms;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public Long getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(Long user_seq) {
		this.user_seq = user_seq;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_birthday=" + user_birthday + ", user_gender=" + user_gender + ", user_email=" + user_email
				+ ", user_zipcode=" + user_zipcode + ", user_address1=" + user_address1 + ", user_address2="
				+ user_address2 + ", user_join_date=" + user_join_date + ", user_last_login=" + user_last_login
				+ ", user_phone=" + user_phone + ", user_point=" + user_point + ", user_marketing_mail="
				+ user_marketing_mail + ", user_marketing_sms=" + user_marketing_sms + ", user_level=" + user_level
				+ ", user_state=" + user_state + ", user_seq=" + user_seq + "]";
	}

	
}

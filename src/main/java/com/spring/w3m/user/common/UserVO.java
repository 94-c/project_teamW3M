package com.spring.w3m.user.common;

public class UserVO {
	private String user_id;
	private String user_password;
	private String user_password2;
	private String user_name;
	private String user_zipcode;
	private String user_address;
	private String user_birthday;
	private String user_sex;
	private String user_phone;
	private String receive_phone;
	private String user_email;
	private String user_level;
	private int user_state;
	private Long user_seq;
	
	
	
	@Override
	public String toString() {
		return "userVO [user_id=" + user_id + ", user_password=" + user_password + ", user_password2=" + user_password2
				+ ", user_name=" + user_name + ", user_zipcode=" + user_zipcode + ", user_address=" + user_address
				+ ", user_birthday=" + user_birthday + ", user_sex=" + user_sex + ", user_phone=" + user_phone
				+ ", receive_phone=" + receive_phone + ", user_email=" + user_email + ", user_level=" + user_level
				+ ", user_state=" + user_state + ", user_seq=" + user_seq + "]";
	}
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
	public String getUser_password2() {
		return user_password2;
	}
	public void setUser_password2(String user_password2) {
		this.user_password2 = user_password2;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getReceive_phone() {
		return receive_phone;
	}
	public void setReceive_phone(String receive_phone) {
		this.receive_phone = receive_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	public Long getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(Long user_seq) {
		this.user_seq = user_seq;
	}
	
	
}

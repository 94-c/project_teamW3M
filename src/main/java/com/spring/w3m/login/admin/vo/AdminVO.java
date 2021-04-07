package com.spring.w3m.login.admin.vo;

import com.spring.w3m.paging.common.Pagination;

public class AdminVO {
	private String admin_id; //관리자 아이디
	private String admin_password; //관리자 비밀번호
	private String admin_name; //관리자 이름
	private String admin_role; //관리자 역할
	private String searchType;
	private String keyword;	
	Pagination p = new Pagination();
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
		return "AdminVO [admin_id=" + admin_id + ", admin_password=" + admin_password + ", admin_name=" + admin_name
				+ ", admin_role=" + admin_role + ", searchType=" + searchType + ", keyword=" + keyword + ", p=" + p
				+ "]";
	}
	
}

package com.spring.w3m.notice.admin.vo;

import java.util.Date;

import com.spring.w3m.paging.common.Pagination;


public class NoticeVO {
	private int nt_seq;	// 글 번호
	private String nt_title;	// 제목
	private String nt_writer;	// 작성자
	private String nt_content;	// 글 내용
	private Date nt_date;	//작성날짜
	private int nt_count;	// 조회수
	private int nt_imp;
	private String searchType;
	private String keyword;
	
	Pagination p = new Pagination();
	
	
	public int getNt_seq() {
		return nt_seq;
	}
	public void setNt_seq(int nt_seq) {
		this.nt_seq = nt_seq;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_writer() {
		return nt_writer;
	}
	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public Date getNt_date() {
		return nt_date;
	}
	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
	public int getNt_count() {
		return nt_count;
	}
	public void setNt_count(int nt_count) {
		this.nt_count = nt_count;
	}
	public int getNt_imp() {
		return nt_imp;
	}
	public void setNt_imp(int nt_imp) {
		this.nt_imp = nt_imp;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = p.getSearchType();
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String Keyword) {
		this.keyword = p.getKeyword();
	}
	@Override
	public String toString() {
		return "NoticeVO [nt_seq=" + nt_seq + ", nt_title=" + nt_title + ", nt_writer=" + nt_writer + ", nt_content="
				+ nt_content + ", nt_date=" + nt_date + ", nt_count=" + nt_count + ", nt_imp=" + nt_imp
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
package com.spring.w3m.product.admin.vo;
/* 관련 테이블
CREATE TABLE PRODUCT(
   prod_seq int NOT NULL, -- 시퀀스넘버
   prod_code varchar(30) NOT NULL, --  PK 제품코드 (ex 미세먼지 마스크(KF94) L 사이즈 - MM-P-L-94-1 )
   prod_title varchar(200), -- 게시글 제목 (ex W3M 미세먼지 마스크 KF-94 대형 50개입) 
   prod_title_image varchar(200), --게시글 이미지 
   prod_category1 varchar(10) default 'MM', -- 대분류 카테고리 ex( 미세먼지 - MM / 비말 - BB)
   prod_category2 varchar(10) default 'P', -- 소분류 카테고리 ex( 프리미얼 - P / 노말 - N / 블랙 - B )
   prod_category3 varchar(10) default 'M', -- 사이즈 카테고리 ex( S/M/L )
   prod_category4 varchar(10) default '94', -- 등급 카테고리 ex( 94 / 80 )
   prod_price int default 0, -- 원가
   prod_price_sale int default 0, -- 할인가
   prod_amount int default 0, --수량 
   prod_comment varchar(1000) default null, --설명
   prod_image1 varchar(200), --이미지1
   prod_image2 varchar(200), --이미지2
   prod_image3 varchar(200), --이미지3
   prod_image4 varchar(200), --이미지4
   prod_image5 varchar(200), --이미지5
   prod_image6 varchar(200), --이미지6
   prod_state varchar(5) default 'y', -- 판매 : y, 판매중단 : n    
   prod_regdate TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp, --등록 날짜
   prod_count int default '0', -- 조회수 ~
   
   CONSTRAINT product_prod_code_pk PRIMARY KEY (prod_code)
); 
*/

import java.util.Date;

public class ProductVO {
	private int prod_seq;
	private String prod_code;
	private String prod_title;
	private String prod_title_image;
	private String prod_category1;
	private String prod_category2;
	private String prod_category3;
	private String prod_category4;
	private int prod_price;
	private int prod_price_sale;
	private int prod_amount;
	private String prod_comment;
	private String prod_image1;
	private String prod_image2;
	private String prod_image3;
	private String prod_image4;
	private String prod_image5;
	private String prod_image6;
	private String prod_state;
	private Date prod_regdate;
	private int prod_count;
	
	
	public int getProd_seq() {
		return prod_seq;
	}
	public void setProd_seq(int prod_seq) {
		this.prod_seq = prod_seq;
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
	public String getProd_category1() {
		return prod_category1;
	}
	public void setProd_category1(String prod_category1) {
		this.prod_category1 = prod_category1;
	}
	public String getProd_category2() {
		return prod_category2;
	}
	public void setProd_category2(String prod_category2) {
		this.prod_category2 = prod_category2;
	}
	public String getProd_category3() {
		return prod_category3;
	}
	public void setProd_category3(String prod_category3) {
		this.prod_category3 = prod_category3;
	}
	public String getProd_category4() {
		return prod_category4;
	}
	public void setProd_category4(String prod_category4) {
		this.prod_category4 = prod_category4;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_price_sale() {
		return prod_price_sale;
	}
	public void setProd_price_sale(int prod_price_sale) {
		this.prod_price_sale = prod_price_sale;
	}
	public int getProd_amount() {
		return prod_amount;
	}
	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}
	public String getProd_comment() {
		return prod_comment;
	}
	public void setProd_comment(String prod_comment) {
		this.prod_comment = prod_comment;
	}
	public String getProd_image1() {
		return prod_image1;
	}
	public void setProd_image1(String prod_image1) {
		this.prod_image1 = prod_image1;
	}
	public String getProd_image2() {
		return prod_image2;
	}
	public void setProd_image2(String prod_image2) {
		this.prod_image2 = prod_image2;
	}
	public String getProd_image3() {
		return prod_image3;
	}
	public void setProd_image3(String prod_image3) {
		this.prod_image3 = prod_image3;
	}
	public String getProd_image4() {
		return prod_image4;
	}
	public void setProd_image4(String prod_image4) {
		this.prod_image4 = prod_image4;
	}
	public String getProd_image5() {
		return prod_image5;
	}
	public void setProd_image5(String prod_image5) {
		this.prod_image5 = prod_image5;
	}
	public String getProd_image6() {
		return prod_image6;
	}
	public void setProd_image6(String prod_image6) {
		this.prod_image6 = prod_image6;
	}
	public String getProd_state() {
		return prod_state;
	}
	public void setProd_state(String prod_state) {
		this.prod_state = prod_state;
	}
	public Date getProd_regdate() {
		return prod_regdate;
	}
	public void setProd_regdate(Date prod_regdate) {
		this.prod_regdate = prod_regdate;
	}
	public int getProd_count() {
		return prod_count;
	}
	public void setProd_count(int prod_count) {
		this.prod_count = prod_count;
	}
	@Override
	public String toString() {
		return "ProductVO [prod_seq=" + prod_seq + ", prod_code=" + prod_code + ", prod_title=" + prod_title
				+ ", prod_title_image=" + prod_title_image + ", prod_category1=" + prod_category1 + ", prod_category2="
				+ prod_category2 + ", prod_category3=" + prod_category3 + ", prod_category4=" + prod_category4
				+ ", prod_price=" + prod_price + ", prod_price_sale=" + prod_price_sale + ", prod_amount=" + prod_amount
				+ ", prod_comment=" + prod_comment + ", prod_image1=" + prod_image1 + ", prod_image2=" + prod_image2
				+ ", prod_image3=" + prod_image3 + ", prod_image4=" + prod_image4 + ", prod_image5=" + prod_image5
				+ ", prod_image6=" + prod_image6 + ", prod_state=" + prod_state + ", prod_regdate=" + prod_regdate
				+ ", prod_count=" + prod_count + "]";
	}
	
}

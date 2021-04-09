package com.spring.w3m.product.admin.vo;

public class OrderProductInfoVO {
	private String prod_title_image;
	private String prod_title;
	private int prod_price_sale;
	private String prod_code;
	private int order_seq;
	private int order_prod_seq;
	private int prod_amount;
	private int prod_point;
	private String delivery_state;
	private int delivery_seq;

	public String getProd_title_image() {
		return prod_title_image;
	}

	public void setProd_title_image(String prod_title_image) {
		this.prod_title_image = prod_title_image;
	}

	public String getProd_title() {
		return prod_title;
	}

	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}

	public int getProd_price_sale() {
		return prod_price_sale;
	}

	public void setProd_price_sale(int prod_price_sale) {
		this.prod_price_sale = prod_price_sale;
	}

	public String getProd_code() {
		return prod_code;
	}

	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}

	public int getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}

	public int getOrder_prod_seq() {
		return order_prod_seq;
	}

	public void setOrder_prod_seq(int order_prod_seq) {
		this.order_prod_seq = order_prod_seq;
	}

	public int getProd_amount() {
		return prod_amount;
	}

	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}

	public int getProd_point() {
		return prod_point;
	}

	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}

	public String getDelivery_state() {
		return delivery_state;
	}

	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}

	public int getDelivery_seq() {
		return delivery_seq;
	}

	public void setDelivery_seq(int delivery_seq) {
		this.delivery_seq = delivery_seq;
	}

	@Override
	public String toString() {
		return "OrderProductInfoVO [prod_title_image=" + prod_title_image + ", prod_title=" + prod_title
				+ ", prod_price_sale=" + prod_price_sale + ", prod_code=" + prod_code + ", order_seq=" + order_seq
				+ ", order_prod_seq=" + order_prod_seq + ", prod_amount=" + prod_amount + ", prod_point=" + prod_point
				+ ", delivery_state=" + delivery_state + ", delivery_seq=" + delivery_seq + "]";
	}

}

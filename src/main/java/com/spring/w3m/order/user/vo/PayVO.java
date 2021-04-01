package com.spring.w3m.order.user.vo;

public class PayVO {
	
	private int pay_seq;
	private int pay_Shipping_cost;//배송비용
	private int pay_Membership; //맴버쉽 할인
	private int pay_total_price;//결제 금액
	private int pay_total_point;//총 적립금
	private int pay_total_money;//결제 예정 금액 (결제금액에서 +배송비 -적립금 )
	private String pay_tool;// 결제 수단
	private String pay_status;//결제상태 
	private int pay_use_point;//사용한 포인트s
	@Override
	public String toString() {
		return "PayVO [pay_seq=" + pay_seq + ", pay_Shipping_cost=" + pay_Shipping_cost + ", pay_Membership="
				+ pay_Membership + ", pay_total_price=" + pay_total_price + ", pay_total_point=" + pay_total_point
				+ ", pay_total_money=" + pay_total_money + ", pay_tool=" + pay_tool + ", pay_status=" + pay_status
				+ ", pay_use_point=" + pay_use_point + "]";
	}
	public int getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}
	public int getPay_Shipping_cost() {
		return pay_Shipping_cost;
	}
	public void setPay_Shipping_cost(int pay_Shipping_cost) {
		this.pay_Shipping_cost = pay_Shipping_cost;
	}
	public int getPay_Membership() {
		return pay_Membership;
	}
	public void setPay_Membership(int pay_Membership) {
		this.pay_Membership = pay_Membership;
	}
	public int getPay_total_price() {
		return pay_total_price;
	}
	public void setPay_total_price(int pay_total_price) {
		this.pay_total_price = pay_total_price;
	}
	public int getPay_total_point() {
		return pay_total_point;
	}
	public void setPay_total_point(int pay_total_point) {
		this.pay_total_point = pay_total_point;
	}
	public int getPay_total_money() {
		return pay_total_money;
	}
	public void setPay_total_money(int pay_total_money) {
		this.pay_total_money = pay_total_money;
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
	public int getPay_use_point() {
		return pay_use_point;
	}
	public void setPay_use_point(int pay_use_point) {
		this.pay_use_point = pay_use_point;
	}
	
	
	
}

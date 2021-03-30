package com.spring.w3m.order.user.service;

import com.spring.w3m.order.user.vo.OrderVO;

public interface OrderService {
	public void order_inser_prod(OrderVO vo);//제품 주문리스트에 삽입
	public OrderVO order_page_go(OrderVO vo);//주문 페이지 진입 
}

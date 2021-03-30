package com.spring.w3m.order.user.service;

import java.util.List;

import com.spring.w3m.order.user.vo.OrderVO;

public interface OrderService {
	public int order_inser_prod(OrderVO vo);//제품 주문리스트에 삽입
	public List<OrderVO> order_List(String user_id);//주문 페이지 진입 
	public void order_drop_List(String user_id);//내꺼 제거 
}

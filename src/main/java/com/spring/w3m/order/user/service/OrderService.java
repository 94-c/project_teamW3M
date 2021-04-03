package com.spring.w3m.order.user.service;

import java.util.List;

import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.point.user.vo.PointVO;

public interface OrderService {
	public int order_inser_prod(OrderVO vo);//제품 주문리스트에 삽입
	public List<OrderVO> order_List(String user_id);//주문 페이지 진입 
	public void order_drop_List(String user_id);//내꺼 제거 
	public int Check_Point(String user_id);
	public int insert_order_list(String user_id);
	public int orderNum(String user_id); 
	public int insert_pay(PayVO payvo);
	public int insert_delivery(OrderVO vo);
	public int update_order_prod(OrderVO ordervo);
	public int update_order_list_status(String user_id);
	public int delete_cart(String user_id);
	public int insert_Use_point(PointVO pointvo);
	public int update_user_point(String user_id);
}

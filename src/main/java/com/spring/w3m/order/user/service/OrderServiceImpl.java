package com.spring.w3m.order.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.dao.OrderDAO;
import com.spring.w3m.order.user.vo.LastAddress;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.point.user.vo.PointVO;
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO dao;
	
	@Override
	public int order_inser_prod(OrderVO vo) {
		
		return dao.order_inser_prod(vo);
		
	}

	@Override
	public List<OrderVO> order_List(String user_id) {
		
		return dao.order_List(user_id);
	}

	@Override
	public void order_drop_List(String user_id) {
		dao.order_drop_List(user_id);
		
	}

	@Override
	public int Check_Point(String user_id) {
	
		return dao.Check_Point(user_id);
	}

	@Override
	public int insert_order_list(String user_id) {
		
		return dao.insert_order_list(user_id);
	}

	@Override
	public int orderNum(String user_id) {
		
		return dao.orderNum(user_id);
	}

	@Override
	public int insert_pay(PayVO payvo) {
		
		return dao.insert_pay(payvo);
	}

	@Override
	public int insert_delivery(OrderVO vo) {
		
		return dao.insert_delivery(vo);
	}

	@Override
	public int update_order_prod(OrderVO ordervo) {
		
		return dao.update_order_prod(ordervo);
	}

	@Override
	public int update_order_list_status(String user_id) {
		
		return dao.update_order_list_status(user_id);
	}

	@Override
	public int delete_cart(String user_id) {
		
		return dao.delete_cart(user_id);
	}

	@Override
	public int insert_Use_point(PointVO pointvo) {
	
		return dao.insert_Use_point(pointvo);
	}

	@Override
	public int update_user_point(String user_id) {
		
		return dao.update_user_point(user_id);
	}

	@Override
	public int insert_Last_Address(LastAddress lastaddress) {
		
		return dao.insert_Last_Address(lastaddress);
	}

	@Override
	public int prod_decrease(OrderVO ordervo) {
		
		return dao.prod_decrease(ordervo);
	}

	@Override
	public List<LastAddress> get_Last_Address(String user_id) {

		return dao.get_Last_Address(user_id);
	}

	@Override
	public void updatePoint(DeliveryVO vo) {
		dao.updatePoint(vo);
	}

	@Override
	public void deletePoint(DeliveryVO vo) {
		dao.deletePoint(vo);
	}

	@Override
	public void delete_last_address(LastAddress vo) {
		dao.delete_last_address(vo);
	}

}

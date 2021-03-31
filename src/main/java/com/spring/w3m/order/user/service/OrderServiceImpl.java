package com.spring.w3m.order.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.dao.OrderDAO;
import com.spring.w3m.order.user.vo.OrderVO;
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

}

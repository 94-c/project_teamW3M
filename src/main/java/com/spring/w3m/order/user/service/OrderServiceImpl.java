package com.spring.w3m.order.user.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.w3m.order.user.dao.OrderDAO;
import com.spring.w3m.order.user.vo.OrderVO;

public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO dao;
	
	@Override
	public void order_inser_prod(OrderVO vo) {
		dao.order_inser_prod(vo);
		
	}

}

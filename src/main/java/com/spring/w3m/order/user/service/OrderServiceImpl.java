package com.spring.w3m.order.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.dao.OrderDAO;
import com.spring.w3m.order.user.vo.OrderVO;
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO dao;
	
	@Override
	public void order_inser_prod(OrderVO vo) {
		dao.order_inser_prod(vo);
		
	}

	@Override
	public OrderVO order_page_go(OrderVO vo) {
		
		return dao.order_page_go(vo);
	}

}

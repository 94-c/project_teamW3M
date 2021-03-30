package com.spring.w3m.order.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.vo.OrderVO;
@Service
public class OrderDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public void order_inser_prod(OrderVO vo) {
		sqlSessionTemplate.insert("OrderDAO.order_inser_prod",vo);
		
	}
	public OrderVO order_page_go(OrderVO vo) {
		
		return sqlSessionTemplate.selectOne("OrderDAO.order_page_go",vo);
	}

}

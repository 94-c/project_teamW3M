package com.spring.w3m.order.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.vo.OrderVO;
@Service
public class OrderDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public int order_inser_prod(OrderVO vo) {
		return sqlSessionTemplate.insert("OrderDAO.order_inser_prod",vo);
		
	}
	public List<OrderVO> order_List(String user_id) {
		
		return sqlSessionTemplate.selectList("OrderDAO.order_List",user_id);
	}
	public void order_drop_List(String user_id) {
		sqlSessionTemplate.delete("OrderDAO.order_drop_List",user_id);
		
	}

}

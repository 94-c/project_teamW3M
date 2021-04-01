package com.spring.w3m.order.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
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
	public int Check_Point(String user_id) {
		
		return sqlSessionTemplate.selectOne("OrderDAO.Check_Point",user_id);
	}
	public int insert_order_list(String user_id) {
		
		return sqlSessionTemplate.insert("OrderDAO.insert_order_list",user_id);
	}
	public int orderNum(String user_id) {
		
		return sqlSessionTemplate.selectOne("OrderDAO.orderNum",user_id);
	}
	public int insert_pay(PayVO payvo) {

		return sqlSessionTemplate.insert("OrderDAO.insert_pay",payvo);
	}
	public int insert_delivery(OrderVO vo) {
	
		return sqlSessionTemplate.insert("OrderDAO.insert_delivery",vo);
	}

}

package com.spring.w3m.order.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.LastAddress;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.point.user.vo.PointVO;
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
	public int update_order_prod(OrderVO ordervo) {
		
		return sqlSessionTemplate.update("OrderDAO.update_order_prod",ordervo);
	}
	public int update_order_list_status(String user_id) {
		return sqlSessionTemplate.update("OrderDAO.update_order_list_status",user_id);
	}
	public int delete_cart(String user_id) {
		return sqlSessionTemplate.delete("OrderDAO.delete_cart",user_id);
	}
	public int insert_Use_point(PointVO pointvo) {
		
		return sqlSessionTemplate.insert("OrderDAO.insert_Use_point",pointvo) ;
	}
	public int update_user_point(String user_id) {
	
		return sqlSessionTemplate.update("OrderDAO.update_user_point",user_id);
	}
	public int insert_Last_Address(LastAddress lastaddress) {
		
		return sqlSessionTemplate.insert("OrderDAO.insert_Last_Address",lastaddress);
	}
	public int prod_decrease(OrderVO ordervo) {
		
		return sqlSessionTemplate.update("OrderDAO.prod_decrease",ordervo);
	}
	public List<LastAddress> get_Last_Address(String user_id) {

		return sqlSessionTemplate.selectList("OrderDAO.get_Last_Address",user_id);
	}
	
	public void updatePoint(DeliveryVO vo) {
		sqlSessionTemplate.update("OrderDAO.updatePoint", vo);
	}
	
	public void deletePoint(DeliveryVO vo) {
		sqlSessionTemplate.delete("OrderDAO.deletePoint", vo);
	}

}

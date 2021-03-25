package com.spring.w3m.cart.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.cart.user.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CartVO> CartList(String user_id) {
		System.out.println("장바구니 리스트");
		return sqlSessionTemplate.selectList("CartDAO.CartList",user_id);
	}
}

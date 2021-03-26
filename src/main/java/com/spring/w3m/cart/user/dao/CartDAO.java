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

	public int Cart_Order_Cnt_Update(CartVO vo) {
		System.out.println("물품 수량 변경");
		return sqlSessionTemplate.update("CartDAO.Cart_Order_Cnt_Update",vo);
		
	}

	public int Cart_Cnt(CartVO vo) {
		System.out.println("장바구니 수량 체크");
		return sqlSessionTemplate.selectOne("CartDAO.Cart_Cnt",vo);
	}
}

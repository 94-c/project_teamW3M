package com.spring.w3m.cart.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.cart.user.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CartVO> CartList(String user_id) {
		return sqlSessionTemplate.selectList("CartDAO.CartList", user_id);
	}

	public int Cart_Order_Cnt_Update(CartVO vo) {
		return sqlSessionTemplate.update("CartDAO.Cart_Order_Cnt_Update", vo);
	}

	public int Cart_Cnt(CartVO vo) {
		return sqlSessionTemplate.selectOne("CartDAO.Cart_Cnt", vo);
	}

	public int Cart_delete(int cart_id) {
		return sqlSessionTemplate.delete("CartDAO.Cart_Delete", cart_id);
	}

	public int Cart_alldelete(String user_id) {
		return sqlSessionTemplate.delete("CartDAO.Cart_AllDelete", user_id);
	}

	public void Cart_insert(CartVO vo) {
		sqlSessionTemplate.insert("CartDAO.Cart_insert", vo);
	}

	public int Cart_distinct(CartVO vo) {
		return sqlSessionTemplate.selectOne("CartDAO.Cart_distinct", vo);

	}

	public int multi_Order_List(String user_id) {
		return sqlSessionTemplate.insert("CartDAO.multi_Order_List", user_id);
	}
}

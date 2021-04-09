package com.spring.w3m.cart.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.cart.user.dao.CartDAO;
import com.spring.w3m.cart.user.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;

	@Override
	public List<CartVO> CartList(String user_id) {
		return dao.CartList(user_id);
	}

	@Override
	public int Cart_Order_Cnt_Update(CartVO vo) {
		return dao.Cart_Order_Cnt_Update(vo);
	}

	@Override
	public int cart_Cnt(CartVO vo) {
		return dao.Cart_Cnt(vo);
	}

	@Override
	public int Send_cart_delete(int cart_id) {
		return dao.Cart_delete(cart_id);
	}

	@Override
	public int Send_cart_alldelete(String user_id) {
		return dao.Cart_alldelete(user_id);
	}

	@Override
	public void Cart_insert(CartVO vo) {
		dao.Cart_insert(vo);
	}

	@Override
	public int Cart_distinct(CartVO vo) {
		return dao.Cart_distinct(vo);
	}

	@Override
	public int multi_Order_List(String user_id) {
		return dao.multi_Order_List(user_id);
	}

}

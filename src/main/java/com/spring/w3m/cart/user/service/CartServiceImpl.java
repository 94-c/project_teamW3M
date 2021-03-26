package com.spring.w3m.cart.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.cart.user.dao.CartDAO;
import com.spring.w3m.cart.user.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO dao ;
	
	@Override
	public List<CartVO> CartList(String user_id) {
		
		return dao.CartList(user_id) ;
	}

	@Override
	public int Cart_Order_Cnt_Update(CartVO vo) {
		
		return dao.Cart_Order_Cnt_Update(vo);
		
	}

}

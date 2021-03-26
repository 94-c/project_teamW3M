package com.spring.w3m.cart.user.service;

import java.util.List;

import com.spring.w3m.cart.user.vo.CartVO;

public interface CartService {

	public List<CartVO> CartList(String user_id); // 카트 리스트
	public int Cart_Order_Cnt_Update(CartVO vo); // 주문수량 변경
	public int cart_Cnt(CartVO vo);
}

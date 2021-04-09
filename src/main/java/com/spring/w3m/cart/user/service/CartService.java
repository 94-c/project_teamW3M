package com.spring.w3m.cart.user.service;

import java.util.List;

import com.spring.w3m.cart.user.vo.CartVO;

public interface CartService {

	public List<CartVO> CartList(String user_id); // 카트 리스트

	public int Cart_Order_Cnt_Update(CartVO vo); // 주문수량 변경

	public int cart_Cnt(CartVO vo);

	public int Send_cart_delete(int cart_id);

	public int Send_cart_alldelete(String user_id);

	public void Cart_insert(CartVO vo);

	public int Cart_distinct(CartVO vo);

	public int multi_Order_List(String user_id);
}

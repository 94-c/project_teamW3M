package com.spring.w3m.cart.user.service;

import java.util.List;

import com.spring.w3m.cart.user.vo.CartVO;

public interface CartService {

	List<CartVO> CartList(String user_id); // 카트 리스트
}

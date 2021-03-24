package com.spring.w3m.user.cart.service;

import java.util.List;

import com.spring.w3m.user.cart.vo.CartVO;

public interface CartService {

	List<CartVO> CartList(String user_id); // 카트 리스트
}

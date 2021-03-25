package com.spring.w3m.cart.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.cart.user.service.CartService;
import com.spring.w3m.cart.user.vo.CartVO;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("/GoCart.do")
	public String GoCart(@SessionAttribute("userVO") UserVO vo,HttpSession session) {
		//vo = (UserVO) session.getAttribute("userVO");
		List<CartVO> cartList = cartService.CartList(vo.getUser_id());
		System.out.println(vo.getUser_id());
		System.out.println(cartList.toString());
		for(CartVO list : cartList) {
			System.out.println(list.toString());
		}
		session.setAttribute("cartList", cartList);
		
		
		return "cart/cart";
		
	}
}

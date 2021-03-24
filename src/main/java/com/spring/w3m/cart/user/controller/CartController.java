package com.spring.w3m.cart.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	
	@RequestMapping("/GoCart.do")
	public String GoCart() {
		return "cart/cart";
		
	}
}

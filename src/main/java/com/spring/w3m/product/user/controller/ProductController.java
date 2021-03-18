package com.spring.w3m.product.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/productMask.do")
	public String productMaskcategory() {
		
		
		return "product/productMask";
		
	}
}

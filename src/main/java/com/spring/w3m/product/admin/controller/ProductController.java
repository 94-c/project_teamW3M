package com.spring.w3m.product.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class ProductController {
	
	@RequestMapping("/getProductList.mdo")
	public String getProductList(ProductVO vo) {
		
		return "admin/page/product/getProductList";
	}
	
}

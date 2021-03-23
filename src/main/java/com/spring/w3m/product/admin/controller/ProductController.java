package com.spring.w3m.product.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.product.admin.service.ProductService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping("/getProductList.mdo")
	public String getProductList(ProductVO vo) {
		
		return "page/product/getProductList";
	}
	
	@RequestMapping("/insertProductForm.mdo")
	public String insertProductForm(ProductVO vo) {
		
		return "page/product/insertProduct";
	}
	
	@RequestMapping("/insertProduct.mdo")
	public String insertProduct(ProductVO vo, Model model) {
		service.insertProduct(vo);
		System.out.println("상품 등록후 상품목록 페이지로 이동...");
		return "redirect:/getProductList.mdo";
	}
}

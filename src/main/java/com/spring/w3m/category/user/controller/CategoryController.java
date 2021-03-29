package com.spring.w3m.category.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.category.user.service.CategoryService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/category.do")
	public ModelAndView category(ProductVO vo) {
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = service.classify(vo);
		mav.addObject("productList", productList);
		mav.setViewName("product/shop_category");
		return mav;
	}
	
	
}

package com.spring.w3m.category.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.category.user.service.CategoryService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;

	@RequestMapping("/category.do")
	public String category(Model model, ProductVO vo) {
		List<ProductVO> productList =  service.category(vo);
		model.addAttribute("productList", productList);
		model.addAttribute("productName", service.getName(vo));
		model.addAttribute("productCount", service.productCount(vo));
		model.addAttribute("branchCount", service.branchCount(vo));
		model.addAttribute("MMP_cnt", service.MMP_cnt(vo));
		model.addAttribute("MMN_cnt", service.MMN_cnt(vo));
		model.addAttribute("MMB_cnt", service.MMB_cnt(vo));
		model.addAttribute("BBN_cnt", service.BBN_cnt(vo));
		model.addAttribute("SSN_cnt", service.SSN_cnt(vo));
		return "product/shop_category";
	}

}

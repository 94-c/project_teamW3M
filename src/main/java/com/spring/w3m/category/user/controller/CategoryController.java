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
		List<ProductVO> productList;

		mav.setViewName("product/shop_category");
		if (vo.getProd_category1().equals("MM")) {

			if (vo.getProd_category2() != null && vo.getProd_category2().equals("P")) {
				productList = service.classify2(vo);
				mav.addObject("msg", "프리미엄 마스크");
			} else if (vo.getProd_category2().equals("N")) {
				productList = service.classify2(vo);
				mav.addObject("msg", "일반 마스크");
			} else if (vo.getProd_category2().equals("B")) {
				productList = service.classify2(vo);
				mav.addObject("msg", "블랙 마스크");
			} else {
				productList = service.classify1(vo);
				mav.addObject("msg", "W3M 미세먼지마스크");
			}
			mav.addObject("productList", productList);
			return mav;
		} else {
			mav.addObject("msg", "카테고리 없음");
			return mav;
		}

	}// end category

}

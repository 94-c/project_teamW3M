package com.spring.w3m.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.w3m.main.service.HomeService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model, ProductVO vo) {
		System.out.println("메인홈으로 이동...");
		
		List<ProductVO> product = homeService.selectProduct(vo);
		model.addAttribute("product", product);

		return "index";
	}

	@RequestMapping("/getProduct")
	public String getProduct(ProductVO vo, Model model) {
		System.out.println("shop");
		
		model.addAttribute("product", homeService.getProduct(vo));
		return "shop_detail";
	}

}

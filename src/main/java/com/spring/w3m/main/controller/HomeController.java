package com.spring.w3m.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.main.service.HomeService;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
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
	@RequestMapping(value = "/orderList", method = { RequestMethod.GET, RequestMethod.POST })
	public String order_list(Model model, ProductVO vo) {
		System.out.println("메인홈으로 이동...");
		
		List<ProductVO> product = homeService.selectProduct(vo);
		model.addAttribute("product", product);

		return "order/OrderList";
	}
	

	@RequestMapping("/getProduct")
	public String getProduct(ProductVO vo, Model model, InquiryVO vo2,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) {
		System.out.println("shop");
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int cnt = homeService.getInquiryListCnt(search);
		search.pageInfo(page, range, cnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<InquiryVO> pageList = homeService.productInq(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("product", homeService.getProduct(vo));
		model.addAttribute("inquiry", pageList);
		model.addAttribute("cnt", cnt);
		
		return "product/shop_detail";
	}

}

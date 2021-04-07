package com.spring.w3m.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.main.service.HomeService;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(Model model, ProductVO vo) {
		System.out.println("홈페이지로 이동...");

		List<ProductVO> product = homeService.selectProduct(vo);
		model.addAttribute("product", product);

		return "index";
	}

	@RequestMapping(value = "/orderList", method = { RequestMethod.GET, RequestMethod.POST })
	public String order_list(Model model, ProductVO vo) {
		System.out.println("홈페이지로 이동...");

		List<ProductVO> product = homeService.selectProduct(vo);
		model.addAttribute("product", product);

		return "order/orderList";
	}

	@RequestMapping("/getProduct")
	public String getProduct(ProductVO vo, Model model, InquiryVO vo2, ReviewVO vo3,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) {
		System.out.println("상품상세보기");

		ProductVO vvs = homeService.getProduct(vo);

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setProd_code(vo.getProd_code());

		int cnt = homeService.getInquiryListCnt(search);
		search.pageInfo(page, range, cnt);

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<InquiryVO> pageList = homeService.productInq(search);

		Search search1 = new Search();
		search1.setSearchType(searchType);
		search1.setKeyword(keyword);
		search1.setProd_title(vvs.getProd_title());

		int cnt1 = homeService.getReviewListCnt(search1);
		search1.pageInfo(page, range, cnt1);

		Pagination pagination1 = new Pagination();
		pagination1.pageInfo(page, range, cnt1);

		List<ReviewVO> pageList1 = homeService.productRe(search1);

		model.addAttribute("pagination", search);
		model.addAttribute("pagination1", search1);
		model.addAttribute("product", vvs);
		model.addAttribute("inquiry", pageList);
		model.addAttribute("review", pageList1);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt", cnt1);

		return "product/shop_detail";
	}

	@RequestMapping("/info")
	public String info() {
		System.out.println("이용 안내");
		return "include/info";
	}

	@RequestMapping("/shopterms")
	public String shopterms(TosVO vo, Model model) {
		model.addAttribute("tos", homeService.getTos(vo));
		System.out.println("쇼핑몰 약관");
		return "list/terms/shopterms";
	}
}

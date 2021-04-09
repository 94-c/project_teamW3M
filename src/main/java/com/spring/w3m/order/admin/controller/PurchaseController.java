package com.spring.w3m.order.admin.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.order.admin.service.PurchaseService;
import com.spring.w3m.order.admin.vo.PurchaseVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

	@RequestMapping("/purchase.mdo")
	public String adminPurchase(PurchaseVO vo, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = purchaseService.getPurchaseListCnt(search);

		search.pageInfo(page, range, cnt);

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<PurchaseVO> purchaseList = purchaseService.getPageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("cnt", cnt);

		return "page/order/admin_order";
	}

}

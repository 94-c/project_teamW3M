package com.spring.w3m.delivery.common.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.delivery.common.service.DeliveryService;
import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.service.PointService;
import com.spring.w3m.point.user.vo.PointVO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService service;
	

	@RequestMapping("/getDeliveryList.mdo")
	public String delivery(DeliveryVO vo, Model model, @RequestParam(required = false, defaultValue = "1")int page,
													   @RequestParam(required = false, defaultValue = "1")int range,
													   @RequestParam(required = false, defaultValue = "title") String searchType,
													   @RequestParam(required = false)String keyword) throws PSQLException, IOException {
		System.out.println("배송정보 목록으로 이동...");		
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = service.getDeliveryListCnt(search);

		search.pageInfo(page, range, cnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<DeliveryVO> deliveryList = service.getPageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("cnt", cnt);
		
		return "page/delivery/deliveryList";
	}
	
	
	@RequestMapping("/changeDeliveryState.mdo")
	public String delivery(DeliveryVO vo, PointVO vo1) {
		System.out.println("배송정보 수정하기 클릭!");
		service.updateDeliveryState(vo);
		
		
		return "redirect:/getDeliveryList.mdo";
	}
	
}

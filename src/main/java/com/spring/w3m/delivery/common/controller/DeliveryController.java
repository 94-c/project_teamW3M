package com.spring.w3m.delivery.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.delivery.common.service.DeliveryService;
import com.spring.w3m.delivery.common.vo.DeliveryVO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService service;

	@RequestMapping("/getDeliveryList.mdo")
	public String delivery(DeliveryVO vo, Model model) {
		System.out.println("배송정보 목록으로 이동...");
		List<DeliveryVO> deliveryList = service.getDeliveryList(vo);
		service.updateDeliveryState(vo);
		model.addAttribute("deliveryList", deliveryList);
	
		return "page/delivery/deliveryList";
	}	
	
}

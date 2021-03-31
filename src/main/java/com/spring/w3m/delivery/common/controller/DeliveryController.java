package com.spring.w3m.delivery.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.delivery.common.service.DeliveryService;
import com.spring.w3m.delivery.common.vo.DeliveryVO;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryService service;

	@RequestMapping("/getDeliveryList.mdo")
	public String delivery(DeliveryVO vo) {
		System.out.println("배송정보 목록으로 이동...");
		
		return "page/deliveryList";
	}
	
}

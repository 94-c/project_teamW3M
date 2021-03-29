package com.spring.w3m.order.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("order_list.do")
	public String OrderList() {
		System.out.println("주문 리스트");
		return "order/OrderList";
		
	}
	@RequestMapping("/send_order.do")
	public int order_Pord_List() { //제품들 주문 리스트에 등록
		System.out.println("주문 리스트 제품 등록");
		
		
		
		return 1;
		
	}
}

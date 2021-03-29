package com.spring.w3m.order.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.order.user.service.OrderService;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("order_list.do")
	public String OrderList() {
		System.out.println("주문 리스트");
		return "order/OrderList";
		
	}
	@RequestMapping("/send_order.do")
	public int order_Pord_List(@RequestBody ProductVO productvo, @SessionAttribute("userVO") UserVO vo,HttpSession session) { //제품들 주문 리스트에 등록
		System.out.println("주문 리스트 제품 등록");
		productvo.getProd_code();
		productvo.getProd_amount();
		
		OrderVO orderVO = new OrderVO();
		orderService.order_inser_prod(orderVO);
		
		return 1;
		
	}
}

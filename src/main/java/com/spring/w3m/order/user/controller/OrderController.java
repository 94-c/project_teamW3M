package com.spring.w3m.order.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.order.user.service.OrderService;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/send_order.do")
	@ResponseBody
	public OrderVO send_order(@RequestBody ProductVO productvo, @SessionAttribute("userVO") UserVO vo,HttpSession session) { //단일 주문
		System.out.println("주문 리스트");
		System.out.println("코드 : "+productvo.getProd_code()+"/수량: "+productvo.getProd_amount() +"/이름 :"+vo.getUser_id() );
		
		OrderVO oVO = new OrderVO();
		oVO.setUser_id(vo.getUser_id());
		oVO.setProd_code(productvo.getProd_code());
		oVO.setProd_amount(productvo.getProd_amount());
		int totalPoint = (oVO.getProd_point()*oVO.getProd_amount());
		int totalPrice = (oVO.getProd_point()*oVO.getProd_amount());
		OrderVO orderVO = orderService.order_page_go(oVO);
		
		orderVO.setProd_total_price(totalPrice);
		orderVO.setProd_total_point(totalPoint);
		
		
		session.setAttribute("OrderVO", orderVO);
		System.out.println(orderVO.toString());
		return orderVO;
//		return "order/OrderList";
		
	}
	@RequestMapping("/send_order_go.do")
	public String OrderList() { //단일 주문
		System.out.println("주문 리스트");
	
		
		return "order/OrderList";
		
	}
	
	public int order_Pord_List(@RequestBody ProductVO productvo, @SessionAttribute("userVO") UserVO vo,HttpSession session) { //제품들 주문 리스트에 등록
		System.out.println("주문 리스트 제품 등록");
	
		
		System.out.println("코드 : "+productvo.getProd_code()+"/수량: "+productvo.getProd_amount() +"/이름 :"+vo.getUser_id() );
		
		OrderVO orderVO = new OrderVO();
		orderVO.setUser_id(vo.getUser_id());
		orderVO.setProd_code(productvo.getProd_code());
		orderVO.setProd_amount(productvo.getProd_amount());
		//orderService.order_inser_prod(orderVO);
		
		return 1;
		
	}
}

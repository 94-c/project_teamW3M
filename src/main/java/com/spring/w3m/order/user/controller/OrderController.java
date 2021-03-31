package com.spring.w3m.order.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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


	@RequestMapping("/send_order_go.do")
	public String OrderList(@SessionAttribute("userVO") UserVO vo, HttpSession session) { //주문
		System.out.println("주문 리스트 -" + vo.getUser_id());

		int pay_total_price =0;
		int pay_total_point =0;
		int pay_Shipping_cost =0;
		List<OrderVO> OrderVO = orderService.order_List(vo.getUser_id());
		for (OrderVO orderList : OrderVO) {
			int point = orderList.getProd_point();
			int price = orderList.getProd_price_sale();
			int amount = orderList.getProd_amount();
			orderList.setProd_total_point(point * amount);
			orderList.setProd_total_price(price * amount);
			pay_total_price = orderList.getProd_total_price();
			pay_total_point = orderList.getProd_total_point();
		}
		if(pay_total_price >= 20000) {
			pay_Shipping_cost = 0;

		}else {
			pay_Shipping_cost = 2500;
		}
		
		System.out.println(OrderVO.toString());
		session.setAttribute("OrderVO", OrderVO);
		session.setAttribute("pay_total_price", pay_total_price);
		session.setAttribute("pay_total_point", pay_total_point);
		session.setAttribute("pay_Shipping_cost", pay_Shipping_cost);
		return "order/OrderList";

	}

	@RequestMapping("/send_order.do")
	@ResponseBody
	public int order_Pord_List(@RequestBody ProductVO productvo, @SessionAttribute("userVO") UserVO vo,
			HttpSession session) { // 제품들 주문 리스트에 등록
		System.out.println("주문 리스트 제품 등록");

		orderService.order_drop_List(vo.getUser_id());
		System.out.println(
				"코드 : " + productvo.getProd_code() + "/수량: " + productvo.getProd_amount() + "/이름 :" + vo.getUser_id());

		OrderVO orderVO = new OrderVO();
		orderVO.setUser_id(vo.getUser_id());
		orderVO.setProd_code(productvo.getProd_code());
		orderVO.setProd_amount(productvo.getProd_amount());

		int aa = orderService.order_inser_prod(orderVO);
		System.out.println(aa);

		return aa;

	}
}

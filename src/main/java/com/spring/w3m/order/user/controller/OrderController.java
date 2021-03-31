package com.spring.w3m.order.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.order.user.service.OrderService;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;


	@RequestMapping("/send_order_go.do")
	public String OrderList(@SessionAttribute("userVO") UserVO vo, HttpSession session) { //주문
		System.out.println("주문 리스트 -" + vo.getUser_id());
		PayVO payVO = new PayVO();
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
			pay_total_price = pay_total_price + orderList.getProd_total_price();
			pay_total_point = pay_total_point + orderList.getProd_total_point();
			
		}
		System.out.println("총 가격 : " + pay_total_price );
		System.out.println("총 적립금 : " + pay_total_point );
		
		
		
		if(pay_total_price >= 20000) {
			pay_Shipping_cost = 0;

		}else {
			pay_Shipping_cost = 2500;
		}
		int pay_total_money= pay_Shipping_cost +pay_total_price; 
		payVO.setPay_Shipping_cost(pay_Shipping_cost);
		payVO.setPay_total_price(pay_total_price);
		payVO.setPay_total_point(pay_total_point);
		payVO.setPay_total_money(pay_total_money);
		System.out.println(OrderVO.toString());
		session.setAttribute("OrderVO", OrderVO);
		session.setAttribute("payVO", payVO);

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
	
		//@RequestMapping(value = "/request_pay.do",method = {RequestMethod.POST,RequestMethod.GET})
		@RequestMapping("/request_pay.do")
		@ResponseBody
		public void order_request_pay(@RequestBody PayVO payVO) { // 제품들 주문 리스트에 등록
			System.out.println("결제 요청");
			System.out.println("금액: "+ payVO.getPay_total_money());


			

		}
}

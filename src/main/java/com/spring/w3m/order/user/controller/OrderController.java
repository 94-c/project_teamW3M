package com.spring.w3m.order.user.controller;

import java.util.List;

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
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;


	@RequestMapping("/send_order_go.do")
	public String OrderList(@SessionAttribute("userVO") UserVO vo, HttpSession session) { //주문
		System.out.println("주문 리스트 -" + vo.getUser_id() +"등급 :"+ vo.getUser_level());
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
		
		double level =0;
		// Bronze 1%, silver 3%, gold 5%, Platinum 7%, dia 9%
		switch(vo.getUser_level()) {
		case "Bronze": level = pay_total_price * 0.01; break;
		case "Silver": level = pay_total_price * 0.03; break;
		case "Gold": level = pay_total_price * 0.05; break;
		case "Platinum": level = pay_total_price * 0.07; break;
		case "dia": level = pay_total_price * 0.09; break;
		
		}
		int level2 = (int)(level/100);
		level2 = level2*100;
		System.out.println(level2);
		if(pay_total_price >= 20000) {
			pay_Shipping_cost = 0;

		}else {
			pay_Shipping_cost = 2500;
		}
		int pay_total_money= pay_Shipping_cost +pay_total_price - level2; 
		payVO.setPay_Shipping_cost(pay_Shipping_cost);
		payVO.setPay_total_price(pay_total_price);
		payVO.setPay_total_point(pay_total_point);
		payVO.setPay_total_money(pay_total_money);
		payVO.setPay_Membership(level2);
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
		@RequestMapping("/request_pay.do") // Bronze 1%, silver 3%, gold 5%, Platinum 7%, dia 9%
		@ResponseBody
		public void order_request_pay(@RequestBody PayVO payVO,@SessionAttribute("userVO") UserVO vo) { // 제품들 주문 리스트에 등록
			System.out.println("결제 성고옹");
			System.out.println("금액: "+ payVO.getPay_total_money());
			
			System.out.println(payVO.toString());
			int a = orderService.insert_order_list(vo.getUser_id());
			System.out.println(a +"- 0이면 실패");
			
			int orVO = orderService.orderNum(vo.getUser_id());
	
			payVO.setOrder_seq(orVO);
			int aaa = orderService.insert_pay(payVO);
			System.out.println(aaa +"- 0이면 실패");
			
		}
		@RequestMapping("order_Success.do")
		public String order_Success(@SessionAttribute("userVO") UserVO vo, HttpSession session,PayVO payvo, OrderVO ordervo) {
			System.out.println("userVO =" + vo.toString());
			System.out.println("PayVO =" + payvo.toString());
			System.out.println("OrderVO =" + ordervo.toString());
			String receiver_name_1 = ordervo.getReceiver_name();
			String receiver_phone1_1 = ordervo.getReceiver_phone1();
			String receiver_phone2_1 = ordervo.getReceiver_phone2();
			String receiver_zipcode_1 = ordervo.getReceiver_zipcode();
			String receiver_address1_1 = ordervo.getReceiver_address1();
			String receiver_address2_1 = ordervo.getReceiver_address2();
			String receiver_memo_1 = ordervo.getReceiver_memo();
			
			System.out.println("이름 : " + receiver_name_1);
			System.out.println("폰1 : " + receiver_phone1_1);
			System.out.println("폰2 : " + receiver_phone2_1);
			System.out.println("우편번호 : " + receiver_zipcode_1);
			System.out.println("주소 : " + receiver_address1_1);
			System.out.println("상세 : " + receiver_address2_1);
			System.out.println("메모 : " + receiver_memo_1);
			
			int orVO = orderService.orderNum(vo.getUser_id());
				
			ordervo.setOrder_seq(orVO);
			ordervo.setUser_id(vo.getUser_id());
			
			System.out.println(ordervo.toString());
			
			int a =orderService.insert_delivery(ordervo);
			
			System.out.println(a +"- 0이면 실패");
			//order_prod 테이블 - 주문상태를 결제완료 업데이트
			//order_list 테이블 - 주문생태를 배송전 업데이트
			//order
			
			
			return "order/order_success";
		}
		@RequestMapping("/check_point.do")
		@ResponseBody
		public int order_request_pay(@SessionAttribute("userVO") UserVO vo) { // 제품들 주문 리스트에 등록
			System.out.println("포인트 확인 - " +vo.getUser_id());
			int point = orderService.Check_Point(vo.getUser_id());
		
			return point;
			
		}
}

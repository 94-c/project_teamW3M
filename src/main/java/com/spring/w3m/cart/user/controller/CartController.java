package com.spring.w3m.cart.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.cart.user.service.CartService;
import com.spring.w3m.cart.user.vo.CartVO;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("/GoCart.do")
	public String GoCart(@SessionAttribute("userVO") UserVO vo,HttpSession session) {
		//vo = (UserVO) session.getAttribute("userVO");
		int totalPrice = 0; 
		int totalPoint = 0;
		List<CartVO> cartList = cartService.CartList(vo.getUser_id());
		System.out.println(vo.getUser_id());
		for(CartVO list : cartList) {
			System.out.println(list.toString());
			totalPrice = totalPrice +list.getTotal_price();
			totalPoint = totalPoint +list.getTotal_point();
		}
		System.out.println(totalPrice);
		session.setAttribute("cartList", cartList);
		session.setAttribute("total_Price", totalPrice);
		session.setAttribute("total_Point", totalPoint);
		
		
		return "cart/cart";
		
	}
	
	@RequestMapping(value = "/send_order_cnt.do", method=RequestMethod.POST)
	@ResponseBody
	public int Send_order_cnt_update(@RequestBody CartVO cartvo) { // 장바구니 제품 수량 수정 시 적용 
		System.out.println("주문수량 변경했습니까? 개 : "+ cartvo.getOrder_cnt());
		System.out.println("장바구니 id는? : "+ cartvo.getCart_id());
		int a = cartService.Cart_Order_Cnt_Update(cartvo);
		System.out.println(a);
		return a;
		
	}
	@RequestMapping(value = "/send_cart_delete.do", method=RequestMethod.POST)
	@ResponseBody
	public int Send_cart_delete(@RequestBody int cart_id,HttpSession session) { // 장바구니 제거 적용 

		int a = cartService.Send_cart_delete(cart_id);
		System.out.println(a);
		return a;
		
	}
	@RequestMapping("/send_cart_allDelete.do")
	public void Send_cart_Alldelete(HttpSession session,@SessionAttribute("userVO") UserVO vo) { // 장바구니 비우기 적용 
		cartService.Send_cart_alldelete(vo.getUser_id());
	}
}

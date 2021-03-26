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
		List<CartVO> cartList = cartService.CartList(vo.getUser_id());
		System.out.println(vo.getUser_id());
		for(CartVO list : cartList) {
			System.out.println(list.toString());
		}
		session.setAttribute("cartList", cartList);
			
		
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
}

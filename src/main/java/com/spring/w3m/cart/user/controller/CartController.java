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
import com.spring.w3m.order.user.service.OrderService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;

	@RequestMapping("/send_cart.do")
	@ResponseBody
	public int send_Cart(@RequestBody ProductVO productvo, @SessionAttribute("userVO") UserVO vo) {
		CartVO cartvo = new CartVO();
		cartvo.setUser_id(vo.getUser_id());
		cartvo.setProd_code(productvo.getProd_code());
		cartvo.setOrder_cnt(productvo.getProd_amount());
		int check = cartService.Cart_distinct(cartvo); // 장바구니 중복 확인
		System.out.println(check);
		if (check > 0) {
			check = 99;
		} else {
			cartService.Cart_insert(cartvo);
		}
		return check;
	}

	@RequestMapping("/GoCart.do")
	public String GoCart(@SessionAttribute("userVO") UserVO vo, HttpSession session) {
		int totalPrice = 0;
		int totalPoint = 0;
		List<CartVO> cartList = cartService.CartList(vo.getUser_id());
		for (CartVO list : cartList) {
			System.out.println(list.toString());
			totalPrice = totalPrice + list.getTotal_price();
			totalPoint = totalPoint + list.getTotal_point();
		}
		session.setAttribute("cartList", cartList);
		session.setAttribute("total_Price", totalPrice);
		session.setAttribute("total_Point", totalPoint);

		return "cart/cart";
	}

	@RequestMapping(value = "/send_order_cnt.do", method = RequestMethod.POST)
	@ResponseBody
	public int Send_order_cnt_update(@RequestBody CartVO cartvo) { // 장바구니 제품 수량 수정 시 적용
		return cartService.Cart_Order_Cnt_Update(cartvo);
	}

	@RequestMapping(value = "/send_cart_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public int Send_cart_delete(@RequestBody int cart_id, HttpSession session) { // 장바구니 제거 적용
		return cartService.Send_cart_delete(cart_id);
	}

	@RequestMapping("/send_cart_allDelete.do")
	public void Send_cart_Alldelete(@SessionAttribute("userVO") UserVO vo) { // 장바구니 비우기 적용
		cartService.Send_cart_alldelete(vo.getUser_id());
	}

	@RequestMapping(value = "/multi_Order_List.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public int multi_Order_List(@RequestBody UserVO vo) { // 장바구니 제품 수량 수정 시 적용
		orderService.order_drop_List(vo.getUser_id());
		return cartService.multi_Order_List(vo.getUser_id());
	}

}

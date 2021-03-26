package com.spring.w3m.login.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.cart.user.service.CartService;
import com.spring.w3m.cart.user.vo.CartVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.user.service.UserLoginService;

@Controller
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/loginForm.do")//로그인 폼으로 이동
	public String loginView() {
		System.out.println("로그인 폼으로 이동...");
		return "login/login";
	}
	
	@RequestMapping("/login.do")//로그인 유효성 검증
	public ModelAndView userloginCheck(@ModelAttribute UserVO vo,CartVO cartvo, HttpSession session) {
		
		int result = userLoginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result == 1) {				// 로그인성공
			System.out.println("장바구니 갯수 : "+cartService.cart_Cnt(cartvo));
			session.setAttribute("cart", cartService.cart_Cnt(cartvo));
			mav.setViewName("login/loginSuccess");
			mav.addObject("msg", "success");
			
		}else if(result == -1) {		// 정지된 계정
			mav.setViewName("login/login");
			mav.addObject("msg", "suspended");
		}
		
		else if (result == -2) {		// 탈퇴한 계정
			mav.setViewName("login/login");
			mav.addObject("msg", "delete");
			
		}else if (result == 0) {		// 로그인실패
			mav.setViewName("login/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")//로그아웃
	public ModelAndView userLogout(HttpSession session) {
		userLoginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/logoutSuccess");
		mav.addObject("msg", "logout");
		return mav;
	}
	
}

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
import com.spring.w3m.mypage.user.service.MyPageService;

@Controller
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/login.do") // 로그인 유효성 검증
	public ModelAndView userloginCheck(@ModelAttribute UserVO vo, CartVO cartvo, HttpSession session) {

		int result = userLoginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();

		if (result == 1) { // 로그인성공	
			mav.setViewName("login/loginSuccess");
			mav.addObject("msg", "success");
			if (session.getAttribute("returnURL") != null) {
				if (session.getAttribute("returnURL").equals("cart")) { // 비 로그인으로 장바구니 진입 시 로그인페이지 진입 후 성공하면 장바구니로 바로이동
					mav.setViewName("redirect:/GoCart.do");
					
				}
			}

		} else if (result == -1) { // 정지된 계정
			mav.setViewName("login/login");
			mav.addObject("msg", "suspended");
		}

		else if (result == -2) { // 탈퇴한 계정
			mav.setViewName("login/login");
			mav.addObject("msg", "delete");

		} else if (result == 0) { // 로그인실패
			mav.setViewName("login/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}

	@RequestMapping("/logout.do") // 로그아웃
	public ModelAndView userLogout(HttpSession session) {
		userLoginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/logoutSuccess");
		mav.addObject("msg", "logout");
		return mav;
	}

}

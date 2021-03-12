package com.spring.w3m.login.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.user.service.UserLoginService;

@Controller
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping("/loginCheck.do")
	public ModelAndView userloginCheck(@ModelAttribute UserVO vo, HttpSession session) {
		boolean result = userLoginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) { //로그인 성공
			mav.setViewName("redirect:/");
			mav.addObject("msg", "success");
			
		}else {				//로그인 실패
			mav.setViewName("login/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView userLogout(HttpSession session) {
		userLoginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		mav.addObject("msg", "logout");
		return mav;
	}
	
}

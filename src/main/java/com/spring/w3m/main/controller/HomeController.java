package com.spring.w3m.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
//header 부분
	@RequestMapping("/login.do")
	public String login() {

		return "login/login";
	}

	@RequestMapping("/logout.do")
	public String logout() {

		return "login/logout";
	}
	
	@RequestMapping("/memberinsert.do")
	public String memberinsert() {

		return "login/memberinsert";
	}
}

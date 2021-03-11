package com.spring.w3m.login.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {

	// 관리자 페이지
	@RequestMapping("/login.mdo")
	public String adminLogin() {
		System.out.println("=== 관리자 로그인 ===");
		return "login";
	}
	
	@RequestMapping("/index.mdo")
	public String index() {
		System.out.println("=== 관리자 페이지 ===");
		return "page/index";
	}
	
}

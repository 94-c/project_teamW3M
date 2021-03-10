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


	@RequestMapping("/insertMember.do")
	public String memberinsert() {

		return "login/insertMember";
	}

	@RequestMapping("/searchID.do")
	public String searchID() {

		return "login/searchID";
	}

	// 공지사항
	@RequestMapping("/notice.do")
	public String notification() {
		System.out.println("---공지사항---");
		return "list/notice";
	}

	// 관리자 페이지
	@RequestMapping("/login.mdo")
	public String adminLogin() {
		return "login";
	}
}

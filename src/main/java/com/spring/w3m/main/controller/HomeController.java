package com.spring.w3m.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
//header 부분
	
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public String index() {
		
		return "index";
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


}

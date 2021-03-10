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
<<<<<<< HEAD
<<<<<<< HEAD
	
	@RequestMapping("/memberinsert.do")
=======
	@RequestMapping("/memberInsert.do")
>>>>>>> bc4f3a36a10e20dead2773626760a73de66e7694
	public String memberinsert() {

		return "login/memberInsert";
=======
	@RequestMapping("/insertMember.do")
	public String memberinsert() {

		return "login/insertMember";
>>>>>>> 205f12ee40b231075fc62accdcf0e9f86e012fef
	}
	
	//공지사항
	@RequestMapping("/notification.do")
	public String notification() {
		System.out.println("---공지사항---");
		return "list/notification";
	}
	
}

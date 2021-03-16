package com.spring.w3m.find.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserInfoFindController {
//	@Autowired
//	private UserInfoFindService service;
	
	@RequestMapping("/findIDForm.do")
	public String findIdView() {
		System.out.println("아이디찾기/비밀번호찾기 폼으로 이동...");
		
		return "login/findID";	
	}
	
	//@RequestMapping("/findID.do")
	
	
}

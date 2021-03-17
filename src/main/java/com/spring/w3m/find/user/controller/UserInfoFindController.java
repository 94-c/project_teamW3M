package com.spring.w3m.find.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.find.user.service.UserInfoFindService;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class UserInfoFindController {
	@Autowired
	private UserInfoFindService service;
	
	@RequestMapping("/findIDForm.do") //아이디찾기 폼으로 이동
	public String findIdView() {
		System.out.println("아이디찾기/비밀번호찾기 폼으로 이동...");
		
		return "login/findID";	
	}
	
	@RequestMapping("/findID.do") //아이디찾기 결과창으로 이동
	public String findIdByPhone(@ModelAttribute UserVO vo, Model model) {
		System.out.println("아이디 찾기 결과창으로 이동...");
		
		String encodedId = service.findIdByPhone(vo);
		
		model.addAttribute("userId", encodedId);
		return "login/findID_result";
	}
	
}

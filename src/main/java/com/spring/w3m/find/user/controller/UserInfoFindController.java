package com.spring.w3m.find.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.find.user.service.UserInfoFindService;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class UserInfoFindController {
	@Autowired
	private UserInfoFindService service;
	
	@RequestMapping("/findIDForm.do")
	public String findIdView() {
		System.out.println("아이디찾기/비밀번호찾기 폼으로 이동...");
		
		return "login/findID";	
	}
	
	@RequestMapping("/findID.do")
	public String findIdByPhone(@ModelAttribute UserVO vo) {
		System.out.println("아이디 찾기 결과창으로 이동...");
		System.out.println("입력받은 유저이름 : "+vo.getUser_name());
		System.out.println("입력받은 유저폰넘버 : "+vo.getUser_phone());
		String userId = service.findIdByPhone(vo);
		System.out.println(userId);
		return "login/findID_result";
	}
	
}

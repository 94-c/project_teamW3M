package com.spring.w3m.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.user.common.UserVO;
import com.spring.w3m.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login_insert.do")
	public String isert_success(UserVO vo) {
		userService.insertUser(vo);
		return "login/insert_success";
	}
}

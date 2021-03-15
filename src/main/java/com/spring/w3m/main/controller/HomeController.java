package com.spring.w3m.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public String index() {
		System.out.println("메인홈으로 이동...");

		return "index";
	}
	
}

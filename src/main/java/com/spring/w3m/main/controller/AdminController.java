package com.spring.w3m.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/index.mdo")
	public String index() {
		return "page/index";
	}
}

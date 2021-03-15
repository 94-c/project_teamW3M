package com.spring.w3m.login.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.login.admin.service.AdminService;
import com.spring.w3m.login.admin.vo.AdminVO;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 페이지
	@RequestMapping(value = "/login.mdo", method=RequestMethod.GET)
	public String adminLogin() {
		System.out.println("=== 관리자 로그인 ===");
		return "login";
	}

	//관리자 페이지
	@RequestMapping("/index.mdo")
	public String index(AdminVO vo, Model model) {
		//회원관리 리스트
		model.addAttribute("userList", adminService.getUserList());
		
		//관리자 로그인 유효성
		AdminVO voo = adminService.getAdmin();
		System.out.println("사이트-"+vo.getAdmin_id());
		System.out.println("db-"+voo.getAdmin_id());
		
		if(vo.getAdmin_id().equals(voo.getAdmin_id())){
			if(vo.getAdmin_password().equals(voo.getAdmin_password())) {
				return "page/index";
			}else {
				System.out.println("아이디는 맞으나 비번이 틀림");
				return "login";
			}
		}else 
			System.out.println(" 틀림");
			return "login";
			
	}
		
	
	// 고객 관리
	@RequestMapping("/userMemberList.mdo")
	public String userMembeList(Model model)  {
		System.out.println("=== 고객관리 ===");
		model.addAttribute("userList", adminService.getUserList());
		return "page/userMemberList";
	}
	
	//공지 사항
	@RequestMapping("/userNotice.mdo")
	public String userNotice() {
		System.out.println("=== 공지사항 ===");
		return "page/userNotice";
	}

}

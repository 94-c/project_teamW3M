package com.spring.w3m.login.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.service.AdminService;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;

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
	
	
	@RequestMapping("/loginIndex.mdo")
	public String loginIndex(AdminVO vo, Model model, HttpSession session) {
		model.addAttribute("userList", adminService.getUserList());
		return "page/index";
	}
	
	// 관리자 로그아웃 세션
	@RequestMapping("/adminLogout.mdo")
	public ModelAndView userLogout(HttpSession session) {
		adminService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	
	//관리자 페이지
	@RequestMapping("/index.mdo")
	public String index(AdminVO vo, Model model, HttpSession session) {
		//회원관리 리스트
		model.addAttribute("userList", adminService.getUserList());
		boolean result = adminService.loginCheck(vo, session);
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
	@RequestMapping("/admin_notice_list.mdo")
	public String getNoticeList(NoticeVO vo, Model model) {
		System.out.println("=== 공지사항 ===");
		if(vo.getSearchCondition() == null) vo.setSearchCondition("nt_title");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		model.addAttribute("noticeList", adminService.getNoticeList(vo));
		return "page/notice/admin_notice_list";
	}
	
	// 문의사항
	@RequestMapping("/adminInquiry.mdo")
	public String adminInquiry(InquiryVO vo, Model model) {
		System.out.println("=== 문의사항 ===");
		model.addAttribute("inquiryList", adminService.getInquiryList(vo));
		return "page/adminInquiry";
	}



}

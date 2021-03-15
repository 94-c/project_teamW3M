package com.spring.w3m.inquiry.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;

	// 게시판 글 작성하기(동작)
	@RequestMapping("/inquiry_write.do")
	public String inquiryWrite(InquiryVO vo, Model model) {
		inquiryService.insertInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "/list/inquiry";
	}
	
	// 게시판 글 작성하기(화면)
	@RequestMapping("/inquiry_write_view.do")
	public String inquiryWriteView() {
		return "/list/inquiry_write";
	}
	
	// 게시글 목록 보기
	@RequestMapping("/getInquiryList.do")
	public String getInquiryList(InquiryVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "list/inquiry";
	}
	
	// 게시글 상세 보기
	@RequestMapping("/inquiryContent.do")
	public String getInquiry(InquiryVO vo, Model model) {
		System.out.println("글 상세보기 처리");
		model.addAttribute("inquiryVO", inquiryService.getInquiry(vo));
		return "list/inquiryContent";
	}
}

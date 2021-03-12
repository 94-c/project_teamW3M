package com.spring.w3m.inquiry.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;

	// 게시판 글 작성하기(동작)
	@RequestMapping("/inquiry_write.do")
	public String inquiryWrite(InquiryVO inquiryVO) {
		inquiryService.insertInquiry(inquiryVO);
		return "/list/inquiry";
	}
	
	// 게시판 글 작성하기(화면)
	@RequestMapping("/inquiry_write_view.do")
	public String inquiryWriteView() {
		return "/list/inquiry_write";
	}
	

}

package com.spring.w3m.inquiry.user.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	// 문의사항
		@RequestMapping("/inquiry.do")
		public String getBoardList(InquiryVO vo, Model model) {
			System.out.println("---문의사항---");
			model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));		
			return "list/inquiry";
		}

	// 게시판 글 작성하기(동작)
	@RequestMapping("/inquiry_write.do")
	public String inquiryWrite(InquiryVO vo, Model model) throws IOException {
		inquiryService.insertInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "/list/inquiry";
	}
	
	// 게시판 글 작성하기(화면)
	@RequestMapping("/inquiry_write_view.do")
	public String inquiryWriteView(InquiryVO vo, Model model) {
		model.addAttribute("getInquiry", inquiryService.getInquiry(vo));
		return "/list/inquiry_write";
	}
	
	@RequestMapping("/inquiry_update_view.do")
	public String inquiryUpdateView(InquiryVO vo, Model model) {
		model.addAttribute("getInquiry", inquiryService.getInquiry(vo));
		return "/list/inquiry_update";
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
	
	// 게시글 수정 하기
	@RequestMapping("/updateInquiry.do")
	public String updateInquiry(InquiryVO vo, Model model) {
		inquiryService.updateInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "/list/inquiry";
	}
	
	// 게시글 삭제 하기
	@RequestMapping("/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo, Model model) {
		inquiryService.deleteInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "/list/inquiry";
	}


}

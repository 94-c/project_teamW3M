package com.spring.w3m.notice.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.notice.admin.dao.NoticeDAO;
import com.spring.w3m.notice.admin.service.NoticeService;
import com.spring.w3m.notice.admin.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/insertNotice.do")
	public String insertNotice(NoticeVO vo, Model model) {
		noticeService.insertNotice(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "list/notice";
	}
	
	@RequestMapping("/updateNotice.do")
	public String updateNotice() {
		return "list/notice";
	}
	
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice() {
		return "list/notice";
	}
	
	@RequestMapping("/getNotice.do")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "list/noticeContent"; 
	}
	
	@RequestMapping("/getNoticeList.do")
	public String getBoardList(NoticeVO vo, Model model) {
		if(vo.getSearchCondition() == null) vo.setSearchCondition("nt_title");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "list/notice";
	}
}

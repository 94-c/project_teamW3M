package com.spring.w3m.mypage.user.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.service.MyPageService;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/myinquryList.do")
	public String myWriteList(Model model,UserVO vo1, InquiryVO vo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {
		System.out.println("문의사항 리스트");

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setUser_name(vo1.getUser_name());
		search.setProd_code(vo.getProd_code());
		int cnt = myPageService.myPageListCnt(search);
		
		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<InquiryVO> pageList = myPageService.myPageList(search);
		
		model.addAttribute("userVO", myPageService.myUser(vo1));
		model.addAttribute("pagination", search);
		model.addAttribute("inquiryList", pageList);
		model.addAttribute("cnt", cnt);
		return "mypage/myWriteList";
	}
}

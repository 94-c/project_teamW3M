package com.spring.w3m.notice.admin.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.notice.admin.service.NoticeService;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class NoticeController {
   
   @Autowired
   private NoticeService noticeService;
   
   
   
   @RequestMapping("/getNotice.do")
   public String getNotice(NoticeVO vo, Model model) {
      model.addAttribute("notice", noticeService.getNotice(vo));
      return "list/noticeContent"; 
   }
   
   @RequestMapping("/getNoticeList.do")
   public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = noticeService.getNoticeListCnt(search);

		search.pageInfo(page, range, cnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<NoticeVO> pageList = noticeService.getNoticePageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("getNoticeList", pageList);
		model.addAttribute("cnt", cnt);

		System.out.println(search.getKeyword());

		return "list/notice";
   }
}
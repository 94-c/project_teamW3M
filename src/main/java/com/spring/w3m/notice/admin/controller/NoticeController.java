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
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class NoticeController {
   
   @Autowired
   private NoticeService noticeService;
   
   
   
   @RequestMapping("/getUserNotice.do")
   public String getUserNotice(NoticeVO vo, Model model) {
      model.addAttribute("notice", noticeService.getUserNotice(vo));
      return "list/noticeContent"; 
   }
   
   @RequestMapping("/getUserNoticeList.do")
   public String getUserBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
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
		model.addAttribute("NoticeList", pageList);
		model.addAttribute("cnt", cnt);

		System.out.println(search.getKeyword());

		return "list/notice";
   }
   
   
   @RequestMapping("/search.do")
	public String getUserNoticeSearchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		
		Pagination pagination = new Pagination();
		int cnt = noticeService.getNoticeSearchCnt(keyword);
		System.out.println("cont Cnt : " + cnt);
		System.out.println(page);
		System.out.println(range);
		System.out.println(keyword);
		pagination.pageInfo(page, range, cnt, keyword);
		
		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);
		
		List<NoticeVO> pageList = noticeService.getUserNoticeSearchPagingList(pagination);
		
		System.out.println("cont List " + pagination.getSearchType());
		System.out.println("cont List " + pagination.getKeyword());
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("NoticeList", pageList);
		

		return "list/notice";
	}
   
   
   
   
   // 공지 사항
	@RequestMapping("/admin_notice_list.mdo")
	public String getNoticeList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
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
		model.addAttribute("NoticeList", pageList);
		model.addAttribute("cnt", cnt);

		System.out.println(search.getKeyword());

		return "page/notice/admin_notice_list";
	}

	@RequestMapping("/admin_search_notice_list.mdo")
	public String getNoticeSearchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		
		Pagination pagination = new Pagination();
		int cnt = noticeService.getNoticeSearchCnt(keyword);
		System.out.println("cont Cnt : " + cnt);
		System.out.println(page);
		System.out.println(range);
		System.out.println(keyword);
		pagination.pageInfo(page, range, cnt, keyword);
		
		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);
		
		List<NoticeVO> pageList = noticeService.getNoticeSearchPagingList(pagination);
		
		System.out.println("cont List " + pagination.getSearchType());
		System.out.println("cont List " + pagination.getKeyword());
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("NoticeList", pageList);
		

		return "page/notice/admin_notice_list";
	}

	
	// 공지사항 등록
	@RequestMapping("/admin_notice_insert.mdo")
	public String admin_notice_insert(NoticeVO vo, Model model) {
		System.out.println("공지사항 등록 실행");
		noticeService.admin_notice_insert(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 등록 뷰 이동
	@RequestMapping("/admin_notice_insert_view.mdo")
	public String admin_notice_insert_view(NoticeVO vo, Model model) {
		model.addAttribute("getNotice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_insert_view";
	}

	// 공지사항 업데이트
	@RequestMapping("/admin_notice_update.mdo")
	public String admin_notice_update(NoticeVO vo, Model model) {
		noticeService.admin_notice_update(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 업데이트 뷰 이동
	@RequestMapping("/admin_notice_update_view.mdo")
	public String admin_notice_update_View(NoticeVO vo, Model model) {
		model.addAttribute("getNotice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_update_view";
	}

	// 공지사항 삭제
	@RequestMapping("/admin_notice_delete.mdo")
	public String admin_notice_delete(NoticeVO vo, Model model) {
		noticeService.admin_notice_delete(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 상세보기
	@RequestMapping("/admin_notice_content.mdo")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_content";
	}
   
	
	@RequestMapping("/tos_content.mdo")
	public String getTos(TosVO vo, Model model) {
		model.addAttribute("tos", noticeService.getTos(vo));
		return "page/notice/tos";
	}
	
	@RequestMapping("/tos_update_view.mdo")
	public String tos_update_view(TosVO vo, Model model) {
		model.addAttribute("tos", noticeService.getTos(vo));
		return "page/notice/tosUpdate";
	}
	
	@RequestMapping("/tosUpdate.mdo")
	public String tosUpdate(TosVO vo, Model model) {
		noticeService.tosUpdate(vo);
		model.addAttribute("tos", noticeService.getTos(vo));
		return "redirect:/tos_content.mdo";
	}
   
}
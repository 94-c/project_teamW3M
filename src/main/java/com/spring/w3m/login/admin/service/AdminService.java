package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface AdminService {

	public AdminVO getAdmin();

	// 회원 목록 리스트
	List<UserVO> getUserList();

	// 회원 관리 - 검색 ,페이징
	int getUserListCnt(Search search);

	List<UserVO> getPageList(Search search);

	int getSearchCnt(String searchKeyword);

	List<UserVO> getSearchPagingList(Pagination pagination);

	// 문의사항 게시글 리스트
	List<InquiryVO> getInquiryList(InquiryVO vo);

	boolean loginCheck(AdminVO vo, HttpSession session);

	AdminVO viewAdmin(AdminVO vo);

	void logout(HttpSession session);

	// 공지사항 게시글 리스트
	List<NoticeVO> getNoticeList(NoticeVO vo);

	// 공지사항 페이징, 검색
	int getNoticeListCnt(Search search);
	
	int getNoticeSearchCnt(String searchKeyword);

	List<NoticeVO> getNoticePageList(Search search);


	List<NoticeVO> getNoticeSearchPagingList(Pagination pagination);

	// 공지사항 등록
	void admin_notice_insert(NoticeVO vo);

	// 공지사항 업데이트
	void admin_notice_update(NoticeVO vo);

	// 공지사항 삭제
	void admin_notice_delete(NoticeVO vo);

	// 공지사항 상세보기
	NoticeVO getNotice(NoticeVO vo);

}

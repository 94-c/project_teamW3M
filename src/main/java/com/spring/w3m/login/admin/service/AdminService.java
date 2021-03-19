package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;

public interface AdminService {
	
	public AdminVO getAdmin();
	
	//회원 목록 리스트
	List<UserVO> getUserList(UserVO vo);
	
	// 문의사항 게시글 리스트
	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	boolean loginCheck(AdminVO vo, HttpSession session);
	
	AdminVO viewAdmin(AdminVO vo);
	
	void logout(HttpSession session);
	
	//공지사항 게시글 리스트
	List<NoticeVO> getNoticeList(NoticeVO vo);
	
	//공지사항 등록
	void admin_notice_insert(NoticeVO vo);
	
	//공지사항 업데이트
	void admin_notice_update(NoticeVO vo);
	
	//공지사항 삭제
	void admin_notice_delete(NoticeVO vo);
	
	//공지사항 상세보기
	NoticeVO getNotice(NoticeVO vo);
}

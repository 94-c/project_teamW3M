package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;

public interface AdminService {
	
	//관리자 계정
	public AdminVO getAdmin();
	//관리자 로그인 체크
	boolean loginCheck(AdminVO vo, HttpSession session);
	
	AdminVO viewAdmin(AdminVO vo);
	//관리자 로그아웃 체크
	void logout(HttpSession session);
	
	//회원 목록 리스트
	List<UserVO> getUserList();
	
	// 문의사항 게시글 리스트
	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	// 공지사항 게시글 리스트
	List<NoticeVO> getNoticeList(NoticeVO vo);
}

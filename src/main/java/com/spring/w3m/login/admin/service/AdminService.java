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
	
	List<NoticeVO> getNoticeList(NoticeVO vo);
}

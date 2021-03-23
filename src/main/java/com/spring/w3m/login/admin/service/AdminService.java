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

	boolean loginCheck(AdminVO vo, HttpSession session);

	AdminVO viewAdmin(AdminVO vo);

	void logout(HttpSession session);


}

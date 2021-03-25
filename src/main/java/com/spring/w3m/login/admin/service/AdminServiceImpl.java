package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.dao.AdminDAO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Service("AdminSerivce")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public AdminVO getAdmin() {
		return dao.getAdmin();		
	}

	// 회원 데이터 가져오기
	@Override
	public List<UserVO> getUserList( ) {
		return dao.getUserList();
	}
	
	@Override
	public boolean loginCheck(AdminVO vo, HttpSession session) {
		String dbPw = dao.pwCheck(vo);
		boolean pwResult = vo.getAdmin_password().equals(dbPw);
		
		if(pwResult) {
			System.out.println("비번 일치");
			vo.setAdmin_password(dbPw);
		}else {
			System.out.println("비번 불일치");
		}
		
		boolean result = dao.loginCheck(vo);
		if(result) { //true일 경우 세션에 등록
			AdminVO admin = viewAdmin(vo);
			//세션 변수 등록
			session.setAttribute("adminId", admin.getAdmin_id());
			session.setAttribute("adminName", admin.getAdmin_name());
			session.setAttribute("adminLogin_state", "adminLogin");
		}
		return result;
	}

	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return dao.viewAdmin(vo);
	}


	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		//session.removeAttribute("userId");
		
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	@Override
	public int getUserListCnt(Search search) {
		return dao.getUserListCnt(search);
	}

	@Override
	public List<UserVO> getPageList(Search search) {
		return dao.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	public List<UserVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}

	@Override
	public void updateUserPause(UserVO vo) {
		System.out.println("impl"+vo.getUser_state());
		dao.updateUserPause(vo);
	}
	
}

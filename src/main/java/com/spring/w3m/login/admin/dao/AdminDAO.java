package com.spring.w3m.login.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public AdminVO getAdmin() {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdmin");

	}

	public boolean loginCheck(AdminVO vo) {
		String name = sqlSessionTemplate.selectOne("AdminDAO.loginCheck", vo);
		return (name == null) ? false : true;
	}

	public String pwCheck(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.pwCheck", vo);
	}

	public AdminVO viewAdmin(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.viewUser", vo);
	}

	// 회원 목록 가져오기
	public List<UserVO> getUserList() {
		return sqlSessionTemplate.selectList("AdminDAO.getUserList");
	}

	public int getUserListCnt(Search search) {
		System.out.println("getUserListCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getUserListCnt");
	}

	public List<UserVO> getPageList(Search search) {
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getPageList", search);
	}

	public int getSearchCnt(String searchKeyword) {
		System.out.println("getSearchCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchKeyword");
	}

	public List<UserVO> getSearchPagingList(Pagination pagination) {
		System.out.println("getSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getSearchPagingList");
	}

	// 문의사항 게시글 목록 가져오기
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getInquiryList");
	}


}

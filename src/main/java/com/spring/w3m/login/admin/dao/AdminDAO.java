package com.spring.w3m.login.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.notice.admin.vo.NoticeVO;

@Controller
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 관리자 계정 불러오기
	public AdminVO getAdmin() {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdmin");
	}
	
	// 관리자 로그인 체크
	public boolean loginCheck(AdminVO vo) {
		String name = sqlSessionTemplate.selectOne("AdminDAO.loginCheck", vo);
		return (name == null) ? false : true;
	}
	// 관리자 계정 비밀번호 체크
	public String pwCheck(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.pwCheck", vo);
	}
		
	public AdminVO viewAdmin(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.viewUser", vo);
	}
	
	
	// 회원 목록 가져오기
	public List<UserVO> getUseList() {
		return sqlSessionTemplate.selectList("AdminDAO.userList");
	}
	
	// 문의사항 게시글 목록 가져오기
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getInquiryList");
	}
	
	// 공지사항 게시글 목록 가져오기
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getNoticeList");
	}
	
	
}

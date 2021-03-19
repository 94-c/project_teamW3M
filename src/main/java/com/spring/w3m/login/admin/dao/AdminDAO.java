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

@Controller
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminVO getAdmin() {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdmin");
		
	}
	

	public List<UserVO> getUseList(UserVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.userList");
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
	public List<UserVO> getUseList() {
		return sqlSessionTemplate.selectList("AdminDAO.userList");
	}
	
	public int getUserListCnt() {
		System.out.println("getUserListCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getUserListCnt");
	}
	
	public List<UserVO> getPageList(Pagination pagination){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getPageList", pagination);
	}
	
	public int getSearchCnt(String searchKeyword) {
		System.out.println("getSearchCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchKeyword");
	}
	
	public List<UserVO> getSearchPagingList(Pagination pagination){
		System.out.println("getSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getSearchPagingList");
	}
	
	
	// 문의사항 게시글 목록 가져오기
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getInquiryList");
	}
	
	//공지사항 게시글 목록 가져오기
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getNoticeList");
	}
	
	//공지사항 글 등록
	public void admin_notice_insert(NoticeVO vo) {
		sqlSessionTemplate.insert("AdminDAO.admin_notice_insert", vo);
	}
	
	//공지사항 수정
	public void admin_notice_update(NoticeVO vo) {
		sqlSessionTemplate.update("AdminDAO.admin_notice_update", vo);
	}
	
	//공지사항 삭제
	public void admin_notice_delete(NoticeVO vo) {
		sqlSessionTemplate.delete("AdminDAO.admin_notice_delete", vo);
	}

	//공지사항 상세보기
	public NoticeVO getNotice(NoticeVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.getNotice", vo);
	}
	
	
}

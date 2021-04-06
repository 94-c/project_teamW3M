package com.spring.w3m.login.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
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
		return sqlSessionTemplate.selectOne("AdminDAO.getUserListCnt");
	}

	public List<UserVO> getPageList(Search search) {
		return sqlSessionTemplate.selectList("AdminDAO.getPageList", search);
	}

	public int getSearchCnt(String searchKeyword) {
		return sqlSessionTemplate.selectOne("AdminDAO.getSearchKeyword");
	}

	public List<UserVO> getSearchPagingList(Pagination pagination) {
		return sqlSessionTemplate.selectList("AdminDAO.getSearchPagingList");
	}

	public void updateUserPause(UserVO vo) {
		sqlSessionTemplate.update("AdminDAO.updateUserPause", vo);
	}

	public List<AdminVO> getPurchaseList(AdminVO vo) {
		return sqlSessionTemplate.selectList("AdminDAO.getPurchaseList");
	}

	// 페이징
	public int getPurchaseListCnt(Search search) {
		return sqlSessionTemplate.selectOne("AdminDAO.getPurchaseListCnt");
	}

	public List<AdminVO> getPurchasePageList(Search search) {
		return sqlSessionTemplate.selectList("AdminDAO.getPurchasePageList", search);
	}

	public List<AdminVO> getPurchaseSearchPagingList(Pagination pagination) {
		return sqlSessionTemplate.selectList("AdminDAO.getPurchaseSearchPagingList");
	}

}
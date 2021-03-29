package com.spring.w3m.mypage.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.paging.common.Search;

@Controller
public class MyPageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int myPageListCnt(Search search) {
		System.out.println("getInquiryListCnt() 실행");
		return sqlSessionTemplate.selectOne("myPageDAO.myPageListcnt");
	}
	
	public List<InquiryVO> myPageList(Search search){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("myPageDAO.myPageList", search);
	}
	
	public UserVO myUser(UserVO vo) {
		return sqlSessionTemplate.selectOne("myPageDAO.myUser" ,vo);
	}
}

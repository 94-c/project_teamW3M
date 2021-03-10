package com.spring.w3m.login.user.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.user.common.UserVO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public boolean loginCheck(UserVO vo) {
		String name = sqlSessionTemplate.selectOne("UserDAO.loginCheck", vo);
		return (name == null) ? false : true;
	}
	
	public UserVO viewUser(UserVO vo) {
		return sqlSessionTemplate.selectOne("userDAO.viewMember", vo);
	}
	
	public void logout(HttpSession session) {
		
	}
}

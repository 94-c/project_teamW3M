package com.spring.w3m.login.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.login.user.dao.LoginDAO;
import com.spring.w3m.user.common.UserVO;

@Service("UserLoginService")
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private LoginDAO dao;
	
	//회원 로그인 체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if(result) { //true일 경우 세션에 등록
			UserVO user = viewUser(vo);
			//세션 변수 등록
			session.setAttribute("userId", user.getUser_id());
			session.setAttribute("userName", user.getUser_name());
		}
		return result;
	}
	//회원 로그인 정보
	@Override
	public UserVO viewUser(UserVO vo) {
		return dao.viewUser(vo);
	}
	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		//session.removeAttribute("userId");
		
		//세션 정보를 초기화 시킴
		session.invalidate();
	}	
	
}

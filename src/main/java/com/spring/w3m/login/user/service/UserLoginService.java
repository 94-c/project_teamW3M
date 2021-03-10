package com.spring.w3m.login.user.service;

import javax.servlet.http.HttpSession;

import com.spring.w3m.user.common.UserVO;

public interface UserLoginService {
	//회원 로그인 체크
	boolean loginCheck(UserVO vo, HttpSession session);
	
	//회원 로그인 정보
	UserVO viewUser(UserVO vo);
	
	//회원 로그아웃
	void logout(HttpSession session);
}

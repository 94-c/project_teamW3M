package com.spring.w3m.login.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.user.dao.LoginDAO;

@Service("UserLoginService")
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private LoginDAO dao;
	
	//회원 로그인 체크
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) {
		String dbPw = dao.pwCheck(vo);
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		boolean pwResult = passEncoder.matches(vo.getUser_password(), dbPw);
		
		if(pwResult) {
			System.out.println("암호화된 비번과 입력하신 비번이 일치합니다.");
			vo.setUser_password(dbPw);
		}else {
			System.out.println("암호화된 비번과 입력하신 비번이 일치하지않습니다.");
		}
		
		boolean result = dao.loginCheck(vo);
		if(result) { //true일 경우 세션에 등록
			UserVO user = viewUser(vo);
			session.setMaxInactiveInterval(60*5); //세션만료시간 설정(초단위)
			session.setAttribute("login_state", "login");
			session.setAttribute("userVO", user);
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

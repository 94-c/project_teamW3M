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
	public int loginCheck(UserVO vo, HttpSession session) {
		String dbPw = dao.pwCheck(vo);
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		boolean pwResult = passEncoder.matches(vo.getUser_password(), dbPw);
		
		if(pwResult) {
			System.out.println("입력받은 비번과 암호화된 비번이 일치합니다.");
			vo.setUser_password(dbPw);
		}else {
			System.out.println("입력받은 비번과 암호화된 비번이 일치하지 않습니다.");
		}
		
		boolean result = dao.loginCheck(vo);
		UserVO user = viewUser(vo);
		
		if(result) {
			if(user.getUser_state().equals("일반")) { //일반계정여부 검증
				//session.setMaxInactiveInterval(60*5); //세션만료시간 설정(초단위)
				session.setAttribute("login_state", "login");
				session.setAttribute("userVO", user);
				return 1; // 1 일반계정
			}else if(user.getUser_state().equals("정지")) {
				return -1; // -1 정지계정
			}else{
				return -2; // -2  탈퇴계정
			}
		}
		return 0; // 0 로그인 실패
		
	}//end loginCheck

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

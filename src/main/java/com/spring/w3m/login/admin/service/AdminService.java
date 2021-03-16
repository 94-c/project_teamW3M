package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;

public interface AdminService {
	
	public AdminVO getAdmin();
	
	//회원 목록 리스트
	List<UserVO> getUserList();
	
	boolean loginCheck(AdminVO vo, HttpSession session);
	
	AdminVO viewAdmin(AdminVO vo);
	
	void logout(HttpSession session);
}

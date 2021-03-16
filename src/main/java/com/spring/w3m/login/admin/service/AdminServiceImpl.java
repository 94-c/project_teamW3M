package com.spring.w3m.login.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.dao.AdminDAO;
import com.spring.w3m.login.admin.vo.AdminVO;

@Service("AdminSerivce")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public AdminVO getAdmin() {
		return dao.getAdmin();		
	}

	// 회원 데이터 가져오기
	@Override
	public List<UserVO> getUserList() {
		return dao.getUseList();
	}
	

}

package com.spring.w3m.login.admin.service;

import java.util.List;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;

public interface AdminService {
	
	public AdminVO getAdmin();
	
	List<UserVO> getUserList();
}
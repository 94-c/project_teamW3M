package com.spring.w3m.login.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}

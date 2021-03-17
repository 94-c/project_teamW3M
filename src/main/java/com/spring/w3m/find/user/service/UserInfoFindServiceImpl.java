package com.spring.w3m.find.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.find.user.dao.UserInfoFindDAO;
import com.spring.w3m.join.user.vo.UserVO;

@Service
public class UserInfoFindServiceImpl implements UserInfoFindService {
	@Autowired
	private UserInfoFindDAO findDAO;

	@Override
	public String findIdByPhone(UserVO vo) {		
		return findDAO.findIdByPhone(vo);
	}
	
}

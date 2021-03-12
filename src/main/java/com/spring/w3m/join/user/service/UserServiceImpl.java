package com.spring.w3m.join.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.join.user.dao.UserDAO;
import com.spring.w3m.join.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	@Override
	public UserVO getUser() {
		
		return dao.getUser();
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.memberInsert(vo);
	}

	@Override
	public UserVO updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO deleteUser(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheck(String user_id) {
		
		return dao.idCheck(user_id);
	}

}

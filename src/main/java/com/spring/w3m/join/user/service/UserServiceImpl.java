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
	public UserVO getUser(UserVO vo) {
		
		return dao.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.memberInsert(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
		
	}

	@Override
	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}

	@Override
	public int idCheck(String user_id) {
		
		return dao.idCheck(user_id);
	}

	@Override
	public int phoneCheck(String user_phone) {
		
		return dao.phoneCheck(user_phone);
	}

	@Override
	public int SNSidCheck(String user_id) {
		
		return dao.SNSidCheck(user_id);
	}

}

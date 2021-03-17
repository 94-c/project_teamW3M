package com.spring.w3m.join.user.service;

import com.spring.w3m.join.user.vo.UserVO;

public interface UserService {
	public UserVO getUser();
	public void insertUser(UserVO vo);
	public void updateUser(UserVO vo);
	public UserVO deleteUser(UserVO vo);
	public int idCheck(String user_id);
}

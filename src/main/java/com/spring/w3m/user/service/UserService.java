package com.spring.w3m.user.service;

import com.spring.w3m.user.common.UserVO;

public interface UserService {
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
	public UserVO updateUser(UserVO vo);
	public UserVO deleteUser(UserVO vo);

}

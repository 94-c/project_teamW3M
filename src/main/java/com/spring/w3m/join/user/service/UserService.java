package com.spring.w3m.join.user.service;

import com.spring.w3m.join.user.vo.UserVO;

public interface UserService {
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
	public void updateUser(UserVO vo);
	public void deleteUser(UserVO vo);
	public int idCheck(String user_id);
	public int SNSidCheck(String user_id);
	public int phoneCheck(String user_phone);
}

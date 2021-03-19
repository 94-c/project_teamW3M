package com.spring.w3m.find.user.service;

import java.util.List;

import com.spring.w3m.join.user.vo.UserVO;

public interface UserInfoFindService {
	
	public List<String> findIdByPhone(UserVO vo);
	
	public String encodedId(String dbId);
	
	public String addBarToNumber(String inputNumber);
	
	public UserVO selectEmail(UserVO vo);
	
	public String getRamdomPassword(int size);
	
	public void updateTempPw(UserVO vo); //임시 비밀번호 DB에 넣어주기.
}

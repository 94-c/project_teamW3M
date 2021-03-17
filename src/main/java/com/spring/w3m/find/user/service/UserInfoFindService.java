package com.spring.w3m.find.user.service;

import com.spring.w3m.join.user.vo.UserVO;

public interface UserInfoFindService {
	
	public String findIdByPhone(UserVO vo);
	
	public String encodedId(String dbId);
	
	public String addBarToNumber(String inputNumber);
}

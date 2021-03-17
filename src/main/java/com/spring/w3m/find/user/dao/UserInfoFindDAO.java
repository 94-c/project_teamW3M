package com.spring.w3m.find.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.join.user.vo.UserVO;

@Repository
public class UserInfoFindDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String findIdByPhone(UserVO vo) {
		return sqlSessionTemplate.selectOne("user.findIdByPhone", vo);
	}
	
}

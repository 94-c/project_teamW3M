package com.spring.w3m.find.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.join.user.vo.UserVO;

@Repository
public class UserInfoFindDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> findIdByPhone(UserVO vo) {
		return sqlSessionTemplate.selectList("user.findIdByPhone", vo);
	}
	
	public UserVO selectEmail(UserVO vo) {
		return sqlSessionTemplate.selectOne("user.selectEmail", vo);
	}
}

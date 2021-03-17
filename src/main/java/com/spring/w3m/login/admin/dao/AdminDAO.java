package com.spring.w3m.login.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;

@Controller
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminVO getAdmin() {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdmin");
		
	}
	

	public List<UserVO> getUseList() {
		return sqlSessionTemplate.selectList("AdminDAO.userList");
	}
	
	
	public boolean loginCheck(AdminVO vo) {
		String name = sqlSessionTemplate.selectOne("AdminDAO.loginCheck", vo);
		return (name == null) ? false : true;
	}
	
	public String pwCheck(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.pwCheck", vo);
	}
	
	public AdminVO viewAdmin(AdminVO vo) {
		return sqlSessionTemplate.selectOne("AdminDAO.viewUser", vo);
	}
	
}

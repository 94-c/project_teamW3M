package com.spring.w3m.join.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class UserDAO { // DB 왔다갔다

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   public void memberInsert(UserVO vo) {
      sqlSessionTemplate.insert("UserDAO.insertUser",vo);
      System.out.println("회원가입 정보 입력");
      
   }
   public UserVO getUser(UserVO vo) {
   
	return sqlSessionTemplate.selectOne("UserDAO.getUser",vo);
	   
   }
   public int idCheck(String user_id) {
	   
	return sqlSessionTemplate.selectOne("UserDAO.idCheck",user_id);
	   
   }
   public int SNSidCheck(String user_id) {
	   
		return sqlSessionTemplate.selectOne("UserDAO.SNSidCheck",user_id);
		   
	   }
   public int phoneCheck(String user_phone) {
	   
	   return sqlSessionTemplate.selectOne("UserDAO.phoneCheck",user_phone);
   }
   public void updateUser(UserVO vo) {
	   sqlSessionTemplate.update("UserDAO.updateUser",vo);
   }
   public void updateUserNoPass(UserVO vo) {
	   sqlSessionTemplate.update("UserDAO.updateUserNoPass",vo);
   }
   public void deleteUser(UserVO vo) {
	   sqlSessionTemplate.update("UserDAO.deleteUser",vo);
   }
}
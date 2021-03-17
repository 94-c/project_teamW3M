package com.spring.w3m.find.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.find.user.dao.UserInfoFindDAO;
import com.spring.w3m.join.user.vo.UserVO;

@Service
public class UserInfoFindServiceImpl implements UserInfoFindService {
	@Autowired
	private UserInfoFindDAO findDAO;

	@Override //DB에 저장된 아이디 가져오는 메서드
	public String findIdByPhone(UserVO vo) {
		String barNumber = addBarToNumber(vo.getUser_phone());
		vo.setUser_phone(barNumber);
		String dbId = findDAO.findIdByPhone(vo);
		String encodedId = encodedId(dbId);//아이디가공하는 메서드 호출
		
		return encodedId;
	}
	
	@Override //아이디 가공하는 메서드(순수 자바코드)
	public String encodedId(String dbId) {				
		int idCount = dbId.length();
		String encodedId = dbId.substring(0, idCount-2) + "**";
		return encodedId;
	}
	@Override //휴대폰 번호에 작대기 추가 메서드(순수 자바코드)
	public String addBarToNumber(String inputNumber) {
		String first = inputNumber.substring(0, 3); //010
		String second = inputNumber.substring(3, 7); //1234
		String third = inputNumber.substring(7); //5678	
		
		StringBuilder sb = new StringBuilder();
		sb = sb.append(first).append("-").append(second).append("-").append(third); //010-1234-5678
		String barNumber = new String(sb);
		return barNumber;
	}
	
}

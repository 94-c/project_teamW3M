package com.spring.w3m.join.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.w3m.join.user.dao.UserDAO;
import com.spring.w3m.join.user.service.UserService;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login_insert.do")
	public String insert_success(UserVO vo) {
	//	userService.insertUser(vo);

		if(vo.getUser_marketing_mail() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_mail(false);
		}
		if(vo.getUser_marketing_sms() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_sms(false);
		}
		
		String emailFormat = vo.getUser_email(); // 이메일 형식 만들기 '@'
		vo.setUser_email(emailFormat.replace(",", "@"));
		
		String phoneFormat = vo.getUser_phone();//폰 형식 '-'
		vo.setUser_phone(phoneFormat.replace(",","-"));
		
		String birthdayFormat = vo.getUser_birthday();//폰 형식 '-'
		vo.setUser_birthday(birthdayFormat.replace(",","-"));
		
		System.out.println(vo.toString());
		return "login/insert_success";
	}
	@RequestMapping("")
	public String getUser(UserVO vo, UserDAO dao) {
		vo = userService.getUser();
		System.out.println(vo.toString());
		return null;
		
	}
	@RequestMapping(value ="/user_id_check.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) {
		int check = userService.idCheck(user_id);
		System.out.println(user_id);
		System.out.println(check);
		return check;
		
	}
}

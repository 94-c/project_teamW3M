package com.spring.w3m.join.user.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.w3m.join.user.dao.UserDAO;
import com.spring.w3m.join.user.service.UserService;
import com.spring.w3m.join.user.service.certificationSMS;
import com.spring.w3m.join.user.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@RequestMapping("/insertMember.do")
	public String insert_member() {
		return "login/insertMember";
		
	}
	@RequestMapping("/login_insert.do")
	public String insert_success(UserVO vo) {
		

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
		
		vo.setUser_password(passEncoder.encode(vo.getUser_password()));
		
		System.out.println(vo.toString());
		userService.insertUser(vo);
		return "login/insert_success";
	}
	@RequestMapping("")
	public String getUser(UserVO vo, UserDAO dao) {
		vo = userService.getUser();
		System.out.println(vo.toString());
		return null;
		
	}
	@RequestMapping(value ="/user_id_check.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestBody String user_id) {
		int check = userService.idCheck(user_id);
		System.out.println("아이디 중복 확인 ");
//		System.out.println(user_id);
//		System.out.println(check);
		return check;
		
	}
	@ResponseBody
	@RequestMapping("/send_sms.do")
	public String sendSMS(@RequestBody String user_phoneAll) {
		
		 Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<6; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }

	        System.out.println("수신자 번호 : " + user_phoneAll);
	        System.out.println("인증번호 : " + numStr);
	        certificationSMS sms = new certificationSMS();
	        sms.certifiedPhone(user_phoneAll, numStr);
	        return numStr;
	
	}
}

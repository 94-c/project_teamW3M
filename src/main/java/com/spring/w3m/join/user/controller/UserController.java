package com.spring.w3m.join.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private JavaMailSenderImpl mailSender;
	

	@RequestMapping("/insertMember.do") //회원가입 페이지 진입
	public String insert_member() {
		return "join/insertMember";

	}

	@RequestMapping("/mypage.do")
	public String myPage() { //마이페이지 진입
		System.out.println("마이페이지 진입");
		return "mypage/myPage";
	}

	@RequestMapping("/memberInfoUpdate.do") 
	public String memberInfoUpdate(HttpSession session,Model model) { //회원 정보 변경 페이지 진입
		System.out.println("회원 정보 변경 진입");
		
			
		System.out.println();
		return "join/memberInfo";
	}
	@RequestMapping("/user_update.do")
	public String update_success(UserVO vo) {
		if (vo.getUser_marketing_mail() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_mail(false);
		}
		if (vo.getUser_marketing_sms() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_sms(false);
		}

		String emailFormat = vo.getUser_email(); // 이메일 형식 만들기 '@'
		vo.setUser_email(emailFormat.replace(",", "@"));

		String phoneFormat = vo.getUser_phone();// 폰 형식 '-'
		vo.setUser_phone(phoneFormat.replace(",", "-"));

		String birthdayFormat = vo.getUser_birthday();// 폰 형식 '-'
		vo.setUser_birthday(birthdayFormat.replace(",", "-"));
		String a = vo.getUser_password();
		vo.setUser_password(passEncoder.encode(vo.getUser_password()));
		System.out.println(vo.toString());
		
		userService.updateUser(vo);

		
		return "index";
		
	}
	@RequestMapping("/login_insert.do")
	public String insert_success(UserVO vo) { // insert member

		if (vo.getUser_marketing_mail() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_mail(false);
		}
		if (vo.getUser_marketing_sms() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_sms(false);
		}

		String emailFormat = vo.getUser_email(); // 이메일 형식 만들기 '@'
		vo.setUser_email(emailFormat.replace(",", "@"));

		String phoneFormat = vo.getUser_phone();// 폰 형식 '-'
		vo.setUser_phone(phoneFormat.replace(",", "-"));

		String birthdayFormat = vo.getUser_birthday();// 폰 형식 '-'
		vo.setUser_birthday(birthdayFormat.replace(",", "-"));
		String a = vo.getUser_password();
		vo.setUser_password(passEncoder.encode(vo.getUser_password())); //비밀번호 암호화

		System.out.println(vo.toString());
		userService.insertUser(vo);
		
		
		// 이메일 보내기
		
		String setfrom = "w3mmask@gmail.com";         
	    String tomail  = vo.getUser_email();     // 받는 사람 이메일
	    String title   = "w3m에 가입해 주셔서 감사합니다.";      // 제목
	    String content =  vo.getUser_name()+ "님 w3m에 가입해 주셔서 감사합니다.";    // 내용
	    
	    
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
		
		return "join/insert_success";
	}

	@RequestMapping("")
	public String getUser(UserVO vo, UserDAO dao) {
		vo = userService.getUser();
		System.out.println(vo.toString());
		return null;

	}

	@RequestMapping(value = "/user_id_check.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestBody String user_id) { //아이디 중복 확인
		int check = userService.idCheck(user_id);
		System.out.println("아이디 중복 확인 ");
//		System.out.println(user_id);
//		System.out.println(check);
		return check;

	}

	@ResponseBody
	@RequestMapping("/send_sms.do")
	public String sendSMS(@RequestBody String user_phoneAll) { //핸드폰 인증

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + user_phoneAll);
		System.out.println("인증번호 : " + numStr);
		certificationSMS sms = new certificationSMS();
		sms.certifiedPhone(user_phoneAll, numStr);
		return numStr;

	}
}

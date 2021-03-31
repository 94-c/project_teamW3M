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

import com.spring.w3m.join.user.service.UserService;
import com.spring.w3m.join.user.service.certificationSMS;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.point.user.service.PointService;
import com.spring.w3m.point.user.vo.PointVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private PointService pointService;
	

	@RequestMapping("/selectJoin.do") //회원가입 선택 페이지 진입
	public String selectJoin() {
		return "join/selectJoin";

	}
	@RequestMapping("/insertMember.do") //회원가입 페이지 진입
	public String insert_member(TosVO vo, Model model) {
		model.addAttribute("tos", userService.getTos(vo));
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
	public String update_success(UserVO vo,HttpSession session) {
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
		
		System.out.println(vo.toString());
		if(vo.getUser_password().equals("")) {
			userService.updateUserNoPass(vo);
		}else {
			vo.setUser_password(passEncoder.encode(vo.getUser_password()));
			userService.updateUser(vo);
		}
		session.invalidate();//세션 초기화
		
		return "index";
		
	}
	
	
	@RequestMapping("/memberInfoDelete.do")
	public String delete_success(UserVO vo,HttpSession session) {//회원삭제
		System.out.println("회원 삭제");
		System.out.println(vo.getUser_id());
		userService.deleteUser(vo);
		session.invalidate();//세션 초기화
		return "index";
		
	}
	@RequestMapping("/login_insert.do")
	public String insert_success(UserVO vo, PointVO vo1) { // insert member

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
		vo.setUser_password(passEncoder.encode(vo.getUser_password())); //비밀번호 암호화

		System.out.println(vo.toString());
		userService.insertUser(vo);
		
		vo1.setPoint_content("회원가입 기념 적립금 지급");
		vo1.setUser_id(vo.getUser_id());
		vo1.setAdd_point(vo.getUser_point());
		pointService.insertPoint(vo1);
		
		// 이메일 보내기
		
		String setfrom = "w3mmask@gmail.com";         
	    String tomail  = vo.getUser_email();     // 받는 사람 이메일
	    String title   = "W3M에 가입해 주셔서 감사합니다.";      // 제목
	    String content =  vo.getUser_name()+ "님 W3M에 가입해 주셔서 감사합니다.";    // 내용
	    
	    
	   
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
	
	@RequestMapping("/login_insert_sns.do")
	public String insert_success_sns(UserVO vo, PointVO vo1) { // SNS naver insert member

		if (vo.getUser_marketing_mail() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_mail(false);
		}
		if (vo.getUser_marketing_sms() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_sms(false);
		}


		String phoneFormat = vo.getUser_phone();// 폰 형식 '-'
		vo.setUser_phone(phoneFormat.replace(",", "-"));


		System.out.println(vo.toString());
		userService.insertUser(vo);
		
		vo1.setPoint_content("회원가입 기념 적립금 지급");
		vo1.setUser_id(vo.getUser_id());
		vo1.setAdd_point(vo.getUser_point());
		pointService.insertPoint(vo1);
		
		
		
		// 이메일 보내기
		
		String setfrom = "w3mmask@gmail.com";         
	    String tomail  = vo.getUser_email();     // 받는 사람 이메일
	    String title   = "W3M에 가입해 주셔서 감사합니다.";      // 제목
	    String content =  vo.getUser_name()+ "님 W3M에 가입해 주셔서 감사합니다.";    // 내용
	    
	    
	   
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
	@RequestMapping("/login_insert_kakao.do")
	public String insert_success_kakao(UserVO vo, PointVO vo1) { // SNS kakao insert member

		if (vo.getUser_marketing_mail() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_mail(false);
		}
		if (vo.getUser_marketing_sms() == null) { // check box 가 Null 이면 false
			vo.setUser_marketing_sms(false);
		}


		String birthdayFormat = vo.getUser_birthday();// 생일  형식 '-'
		vo.setUser_birthday(birthdayFormat.replace(",", "-"));
		String phoneFormat = vo.getUser_phone();// 폰 형식 '-'
		vo.setUser_phone(phoneFormat.replace(",", "-"));


		System.out.println(vo.toString());
		userService.insertUser(vo);
		
		vo1.setPoint_content("회원가입 기념 적립금 지급");
		vo1.setUser_id(vo.getUser_id());
		vo1.setAdd_point(vo.getUser_point());
		pointService.insertPoint(vo1);
		
		
		// 이메일 보내기
		
		String setfrom = "w3mmask@gmail.com";         
	    String tomail  = vo.getUser_email();     // 받는 사람 이메일
	    String title   = "W3M에 가입해 주셔서 감사합니다.";      // 제목
	    String content =  vo.getUser_name()+ "님 W3M에 가입해 주셔서 감사합니다.";    // 내용
	    
	    
	   
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
	@ResponseBody
	@RequestMapping("/check_sms.do")
	public int checkSMS(@RequestBody String user_phoneAll2) {
		System.out.println(user_phoneAll2);
		int check = userService.phoneCheck(user_phoneAll2);
		System.out.println(check);
		if(check==0) { //중복이 읍다
			return 0;
		}else { //중복이 이뜨아
		return 1;
		}
	}
}

package com.spring.w3m.find.user.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.w3m.find.user.dao.UserInfoFindDAO;
import com.spring.w3m.join.user.vo.UserVO;

@Service
public class UserInfoFindServiceImpl implements UserInfoFindService {
	@Autowired
	private UserInfoFindDAO findDAO;
	@Autowired
	private JavaMailSender mailSender;

	@Override // DB에 저장된 아이디 가져오는 메서드
	public List<String> findIdByPhone(UserVO vo) {
		String barNumber = addBarToNumber(vo.getUser_phone());
		vo.setUser_phone(barNumber);

		List<String> dbIdList = findDAO.findIdByPhone(vo);
		List<String> encodedIdList = new ArrayList<String>();
		for (int i = 0; i < dbIdList.size(); i++) {
			encodedIdList.add(encodedId(dbIdList.get(i)));// 아이디 가공하는 메서드 호출
		}
		return encodedIdList;
	}

	@Override // ID와 폰번호 입력받아서 이메일주소 리턴하는 메서드
	public UserVO selectEmail(UserVO vo) {
		String barNumber = addBarToNumber(vo.getUser_phone());
		vo.setUser_phone(barNumber);
		UserVO userInfo = findDAO.selectEmail(vo);
		if (userInfo != null) {
			userInfo.setUser_password(getRamdomPassword(10)); // 임시비밀번호를 생성한 후 생성한 비번을 유저의 비밀번호로 설정해줌.
			//////////////////////DB에 넣어주는 추가작업해야함////////////////////////////
			// 이메일 보내기
			String from = "w3mmask@gmail.com";
			String to = userInfo.getUser_email(); // 받는 사람 이메일
			String title = "W3M에서 임시 비밀번호를 알려드립니다."; // 제목
			String content = "안녕하세요." + userInfo.getUser_name() + "님\n" + "고객님의 임시 비밀번호를 알려드립니다.\n"
					+ "임시 비밀번호로 로그인하신 후 원하시는 비밀번호로 수정해서 이용하시기 바랍니다.\n" + "임시 비밀번호	: " + userInfo.getUser_password()
					+ "\n\n※ 참고하세요!" + "임시 비밀번호로 로그인 하신 후, 반드시 비밀번호를 수정해 주세요.\n"
					+ "비밀번호는 쇼핑몰 로그인 > 마이페이지 > 회원정보수정 에서 수정하실 수 있습니다.\n" + "안전한 서비스 이용을 위해서 비밀번호는 정기적으로 변경해주는 것이 좋습니다."; // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(from); // 보내는사람 생략하면 정상작동 안함
				messageHelper.setTo(to); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능
				messageHelper.setText(content); // 메일 내용
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return userInfo;
		} else {
			return userInfo;
		}
	}
	
	@Override // 아이디 가공하는 메서드(순수 자바코드)
	public String encodedId(String dbId) {
		int idCount = dbId.length();
		String encodedId = dbId.substring(0, idCount - 2) + "**";
		return encodedId;
	}

	@Override // 휴대폰 번호에 작대기 추가 메서드(순수 자바코드)
	public String addBarToNumber(String inputNumber) {
		String first = inputNumber.substring(0, 3); // 010
		String second = inputNumber.substring(3, 7); // 1234
		String third = inputNumber.substring(7); // 5678

		StringBuilder sb = new StringBuilder();
		sb = sb.append(first).append("-").append(second).append("-").append(third); // 010-1234-5678
		String barNumber = new String(sb);
		return barNumber;
	}

	@Override // 임시비밀번호 생성하는 메서드
	public String getRamdomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };

		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());

		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) {
			// idx = (int) (len * Math.random());
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

}

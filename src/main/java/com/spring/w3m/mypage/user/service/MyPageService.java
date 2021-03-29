package com.spring.w3m.mypage.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.paging.common.Search;

public interface MyPageService {
	
	int myPageListCnt(Search search);

	List<InquiryVO> myPageList(Search search);
	
	UserVO myUser(UserVO vo);
}

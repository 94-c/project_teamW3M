package com.spring.w3m.mypage.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.dao.MyPageDAO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO dao;
	
	@Override
	public int myPageListCnt(Search search) {
		return dao.myPageListCnt(search);
	}

	@Override
	public List<InquiryVO> myPageList(Search search) {
		return dao.myPageList(search);
	}

	@Override
	public UserVO myUser(UserVO vo) {
		return dao.myUser(vo);
	}

	@Override
	public int myReviewListCnt(Search search) {
		return dao.myReviewListCnt(search);
	}

	@Override
	public List<ReviewVO> myReviewList(Search search) {
		return dao.myReviewList(search);
	}
}

package com.spring.w3m.mypage.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface MyPageService {
	
	int myPageListCnt(Search search);

	List<InquiryVO> myPageList(Search search);
	
	UserVO myUser(UserVO vo);
	
	int myReviewListCnt(Search search);

	List<ReviewVO> myReviewList(Search search);
	
	public List<OrderVO> myOrderList(String user_id); //마이페이지 주문내역
}

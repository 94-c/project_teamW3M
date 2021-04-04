package com.spring.w3m.mypage.user.service;

import java.util.List;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.vo.MyPageVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface MyPageService {
	
	int myPageListCnt(Search search);

	List<InquiryVO> myPageList(Search search);
	
	UserVO myUser(UserVO vo);
	
	int myReviewListCnt(Search search);

	List<ReviewVO> myReviewList(Search search);
	
	List<DeliveryVO> deliveryState(int order_seq);
	
	List<OrderVO> myOrderList(String user_id); //마이페이지 주문내역
	
	OrderVO getReceiverInfo(OrderVO vo); //주문상세 주문자정보
	
	DeliveryVO getDeliveryInfo(DeliveryVO vo); //주문상세 배송지정보
	
	String makeRandomNumber(); //임의의 12자리 택배송장번호
	
	List<MyPageVO> recentList(MyPageVO vo);
}

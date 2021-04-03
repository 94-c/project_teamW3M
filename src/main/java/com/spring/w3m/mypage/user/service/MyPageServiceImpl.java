package com.spring.w3m.mypage.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.dao.MyPageDAO;
import com.spring.w3m.order.user.vo.OrderVO;
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
	
	@Override
	public List<OrderVO> myOrderList(String user_id){
		return dao.myOrderList(user_id);
	}

	@Override
	public List<DeliveryVO> deliveryState(int order_seq) {
		return dao.deliveryState(order_seq);
	}

	@Override
	public OrderVO getReceiverInfo(OrderVO vo) {
		return dao.getReceiverInfo(vo);
	}
	
//	@Override
//	public List<OrderVO> orderDetail(String user_id){
//		return dao.orderDetail(user_id);
//	}
	
	
}

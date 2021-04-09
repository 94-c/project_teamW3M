package com.spring.w3m.mypage.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.dao.MyPageDAO;
import com.spring.w3m.mypage.user.vo.MyPageVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.vo.PointVO;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;
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
	public List<MyPageVO> recentList(MyPageVO vo) {
		return dao.recentList(vo);
	}
	
	/* 주문상세 관련*/
	@Override
	public OrderVO getReceiverInfo(OrderVO vo) {
		return dao.getReceiverInfo(vo);
	}
	@Override
	public DeliveryVO getDeliveryInfo(DeliveryVO vo) {
		return dao.getDeliveryInfo(vo);
	}	
	public String makeRandomNumber() { //롯데택배 송장번호 제조기
		int[] randomNumbers = new int[12];
		String strRd = "";
		for(int i=0; i<randomNumbers.length; i++) {
			randomNumbers[i] = (int) (Math.random()*10);
			strRd += String.valueOf(randomNumbers[i]);
		}		
		System.out.println(strRd);		
		return strRd;
	}	
	@Override
	public List<OrderProductInfoVO> getOrderProductInfo(OrderVO vo){
		return dao.getOrderProductInfo(vo);
	}
	@Override
	public PayVO getPayInfo(PayVO pVO) {
		return dao.getPayInfo(pVO);
	}
	@Override
	public String getUserLevel(String userId) {
		if(dao.getUserLevel(userId).equals("Bronze")) {
			return "1";
		}else if(dao.getUserLevel(userId).equals("Silver")) {
			return "3";
		}else if(dao.getUserLevel(userId).equals("Gold")) {
			return "5";
		}else if(dao.getUserLevel(userId).equals("Platinum")) {
			return "7";
		}else if(dao.getUserLevel(userId).equals("Dia")) {
			return "9";
		}else {
			return "-1";
		}
	}
	/*-----------------------------------------*/
	
	/* 주문 취소 관련 */
	@Override
	public void deletePoint(PointVO vo) {
		dao.deletePoint(vo);
	}
	@Override
	public void changePayState(PayVO vo) {
		dao.changePayState(vo);
	}
	@Override
	public void changeOrderState(OrderVO vo) {
		dao.changeOrderState(vo);
	}
	@Override
	public void changeOrderProductState(OrderVO vo) {
		dao.changeOrderProductState(vo);
	}
	@Override
	public void changeDeliveryState(DeliveryVO vo) {
		dao.changeDeliveryState(vo);
	}	
	/*-----------------------------------------*/
	
	/* 회원의 총 주문금액 */
	@Override
	public int getTotalOrderMoney(String userId) {
		return dao.getTotalOrderMoney(userId);
	}
	@Override
	public void changeUserLevel(UserVO vo) {
		dao.changeUserLevel(vo);
	}

	@Override
	public List<OrderVO> recentOrderList(String user_id) {
		return dao.recentOrderList(user_id);
	}	
	
}

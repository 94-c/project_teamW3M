package com.spring.w3m.mypage.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class MyPageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int myPageListCnt(Search search) {
		System.out.println("getInquiryListCnt() 실행");
		return sqlSessionTemplate.selectOne("myPageDAO.myPageListcnt");
	}
	
	public List<InquiryVO> myPageList(Search search){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("myPageDAO.myPageList", search);
	}
	
	public UserVO myUser(UserVO vo) {
		return sqlSessionTemplate.selectOne("myPageDAO.myUser" ,vo);
	}
	
	public int myReviewListCnt(Search search) {
		System.out.println("getInquiryListCnt() 실행");
		return sqlSessionTemplate.selectOne("myPageDAO.myReviewListcnt");
	}
	
	public List<ReviewVO> myReviewList(Search search){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("myPageDAO.myReviewList", search);
	}
	
	public List<OrderVO> myOrderList(String user_id){
		System.out.println("myOrderList() 실행");
		return sqlSessionTemplate.selectList("myPageDAO.myOrderList", user_id);
	}
	
	public List<DeliveryVO> deliveryState(int order_seq){
		System.out.println("deliveryState() 실행");
		return sqlSessionTemplate.selectList("myPageDAO.deliveryState", order_seq);
	}
}

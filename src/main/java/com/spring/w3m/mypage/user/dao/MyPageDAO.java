package com.spring.w3m.mypage.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.mypage.user.vo.MyPageVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.vo.PointVO;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;
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
	
	public List<MyPageVO> recentList(MyPageVO vo) {
		return sqlSessionTemplate.selectList("myPageDAO.recentList", vo);
	}
	
	/* 주문상세 */
	public OrderVO getReceiverInfo(OrderVO vo) {
		return sqlSessionTemplate.selectOne("myPageDAO.receiverInfo", vo);
	}	
	public DeliveryVO getDeliveryInfo(DeliveryVO vo) {
		return sqlSessionTemplate.selectOne("myPageDAO.deliveryInfo", vo);
	}	
	public List<OrderProductInfoVO> getOrderProductInfo(String userId){
		return sqlSessionTemplate.selectList("myPageDAO.orderProductInfo", userId);
	}	
	public PayVO getPayInfo(PayVO pVO) {
		return sqlSessionTemplate.selectOne("myPageDAO.payInfo", pVO);
	}
	public String getUserLevel(String userId) {
		return sqlSessionTemplate.selectOne("myPageDAO.getUserLevel", userId);
	}
	
	/* 주문 취소 */
	public void deletePoint(PointVO vo) {
		sqlSessionTemplate.delete("myPageDAO.deletePoint", vo);
	}
	public void changePayState(PayVO vo) {
		sqlSessionTemplate.update("myPageDAO.changePayState", vo);
	}
	public void changeOrderState(OrderVO vo) {
		sqlSessionTemplate.update("myPageDAO.changeOrderState", vo);
	}
	public void changeOrderProductState(OrderVO vo) {
		sqlSessionTemplate.update("myPageDAO.changeOrderProductState", vo);
	}
	public void changeDeliveryState(DeliveryVO vo) {
		sqlSessionTemplate.update("myPageDAO.changeDeliveryState", vo);
	}
	
}

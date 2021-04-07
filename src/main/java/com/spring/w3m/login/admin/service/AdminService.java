package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;

public interface AdminService {

	public AdminVO getAdmin();

	// 회원 목록 리스트
	List<UserVO> getUserList();
	
	// 회원 정보 가져오기
	UserVO getUser(String user_id);

	// 배송 정보 가져오기
	DeliveryVO getDelivery(int order_seq);
	
	// 상품 정보 가져오기
	List<OrderProductInfoVO> getOrderProductList(DeliveryVO vo);
	
	// 결제 정보 가져오기
	PayVO getPay(int order_seq);
	
	// 회원 등급 가져오기
	String getUserLevel(String user_id);

	// 회원 관리 - 검색 ,페이징
	int getUserListCnt(Search search);

	List<UserVO> getPageList(Search search);

	int getSearchCnt(String searchKeyword);

	List<UserVO> getSearchPagingList(Pagination pagination);

	boolean loginCheck(AdminVO vo, HttpSession session);

	AdminVO viewAdmin(AdminVO vo);

	void logout(HttpSession session);

	void updateUserPause(UserVO vo);
	
	
}

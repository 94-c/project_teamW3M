package com.spring.w3m.login.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.dao.AdminDAO;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;

@Service("AdminSerivce")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public AdminVO getAdmin() {
		return dao.getAdmin();		
	}

	// 회원 데이터 가져오기
	@Override
	public List<UserVO> getUserList( ) {
		return dao.getUserList();
	}
	
	@Override
	public boolean loginCheck(AdminVO vo, HttpSession session) {
		String dbPw = dao.pwCheck(vo);
		boolean pwResult = vo.getAdmin_password().equals(dbPw);
		
		if(pwResult) {
			System.out.println("비번 일치");
			vo.setAdmin_password(dbPw);
		}else {
			System.out.println("비번 불일치");
		}
		
		boolean result = dao.loginCheck(vo);
		if(result) { //true일 경우 세션에 등록
			AdminVO admin = viewAdmin(vo);
			//세션 변수 등록
			session.setAttribute("adminId", admin.getAdmin_id());
			session.setAttribute("adminName", admin.getAdmin_name());
			session.setAttribute("adminLogin_state", "adminLogin");
		}
		return result;
	}

	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return dao.viewAdmin(vo);
	}


	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		//session.removeAttribute("userId");
		
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	@Override
	public int getUserListCnt(Search search) {
		return dao.getUserListCnt(search);
	}

	@Override
	public List<UserVO> getPageList(Search search) {
		return dao.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	public List<UserVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}

	@Override
	public void updateUserPause(UserVO vo) {
		System.out.println("impl"+vo.getUser_state());
		dao.updateUserPause(vo);
	}

	@Override
	public UserVO getUser(String user_id) {
		return dao.getUser(user_id);
	}

	@Override
	public DeliveryVO getDelivery(int order_seq) {
		return dao.getDelivery(order_seq);
	}

	@Override
	public List<OrderProductInfoVO> getOrderProductList(DeliveryVO vo) {
		return dao.getOrderProductList(vo);
	}

	@Override
	public PayVO getPay(int order_seq) {
		return dao.getPay(order_seq);
	}
	
	@Override
	public String getUserLevel(String user_id) {
		if(dao.getUserLevel(user_id).equals("Bronze")) {
			return "1";
		}else if(dao.getUserLevel(user_id).equals("Silver")) {
			return "3";
		}else if(dao.getUserLevel(user_id).equals("Gold")) {
			return "5";
		}else if(dao.getUserLevel(user_id).equals("Platinum")) {
			return "7";
		}else if(dao.getUserLevel(user_id).equals("Dia")) {
			return "9";
		}else {
			return "-1";
		}
	}

}

package com.spring.w3m.mypage.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.w3m.delivery.common.service.DeliveryService;
import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.user.service.UserLoginService;
import com.spring.w3m.mypage.user.service.MyPageService;
import com.spring.w3m.mypage.user.vo.MyPageVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.service.PointService;
import com.spring.w3m.point.user.vo.PointVO;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private PointService pointService;
	@Autowired
	private DeliveryService deliveryService;
	@Autowired
	private UserLoginService userLoginService;

	@RequestMapping("/mypage.do")
	public String myPage(MyPageVO vo, Model model, @SessionAttribute("userVO") UserVO uvo) { // 마이페이지 진입
		System.out.println("마이페이지 진입");
		int totalOrderPage = myPageService.getTotalOrderMoney(uvo.getUser_id());
		if (totalOrderPage >= 700000) {
			uvo.setUser_level("Dia");
		} else if (totalOrderPage >= 500000) {
			uvo.setUser_level("Platinum");
		} else if (totalOrderPage >= 300000) {
			uvo.setUser_level("Gold");
		} else if (totalOrderPage >= 100000) {
			uvo.setUser_level("Silver");
		} else {
			uvo.setUser_level("Bronze");
		}
		myPageService.changeUserLevel(uvo); // 등급 업데이트
		model.addAttribute("myRecent", myPageService.recentList(vo));
		List<OrderVO> myOrderList = myPageService.recentOrderList(uvo.getUser_id());
		model.addAttribute("myOrderList", myOrderList);

		// 총 주문금액 찍기
		int totalOrderMoney = myPageService.getTotalOrderMoney(uvo.getUser_id());
		model.addAttribute("totalOrderMoney", totalOrderMoney);

		return "mypage/myPage";
	}

	@RequestMapping("/myinquryList.do")
	public String myWriteList(Model model, UserVO vo1, InquiryVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setUser_email(vo1.getUser_email());
		search.setProd_code(vo.getProd_code());
		int cnt = myPageService.myPageListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<InquiryVO> pageList = myPageService.myPageList(search);

		model.addAttribute("userVO", myPageService.myUser(vo1));
		model.addAttribute("pagination", search);
		model.addAttribute("inquiryList", pageList);
		model.addAttribute("cnt", cnt);
		return "mypage/myWriteList";
	}

	@RequestMapping("/myReviewList.do")
	public String myReviewList(Model model, UserVO vo1, ReviewVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setUser_email(vo1.getUser_email());
		search.setProd_code(vo.getProd_code());
		int cnt = myPageService.myReviewListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<ReviewVO> pageList = myPageService.myReviewList(search);

		model.addAttribute("userVO", myPageService.myUser(vo1));
		model.addAttribute("pagination", search);
		model.addAttribute("ReviewList", pageList);
		model.addAttribute("cnt", cnt);
		return "mypage/myReviewList";
	}

	@RequestMapping("/getPointList.do")
	public String getPointList(Model model, UserVO vo1, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setUser_id(vo1.getUser_id());
		int cnt = pointService.getPointListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<PointVO> pageList = pointService.getPointPageList(search);

		model.addAttribute("userVO", myPageService.myUser(vo1));
		model.addAttribute("pagination", search);
		model.addAttribute("pointList", pageList);
		model.addAttribute("cnt", cnt);
		return "mypage/myPoint";
	}

	// 주문내역
	@RequestMapping("myOrderList.do")
	public String getOrderList(Model model, @SessionAttribute("userVO") UserVO vo) {
		List<OrderVO> myOrderList = myPageService.myOrderList(vo.getUser_id());
		model.addAttribute("myOrderList", myOrderList);
		return "mypage/myOrder";
	}

	// 배송상세
	@RequestMapping("deliveryState.do")
	public String deliveryState(Model model, DeliveryVO vo1, @SessionAttribute("userVO") UserVO uvo) {
		// 배송내역
		List<DeliveryVO> deliveryState = myPageService.deliveryState(vo1.getOrder_seq());
		// 총 주문금액 찍기
		int totalOrderMoney = myPageService.getTotalOrderMoney(uvo.getUser_id());
		model.addAttribute("totalOrderMoney", totalOrderMoney);
		model.addAttribute("deliveryState", deliveryState);
		return "mypage/myDeliveryDetail";
	}

	// 주문상세
	@RequestMapping("myOrderDetail.do")
	public String getOrderDetail(Model model, @SessionAttribute("userVO") UserVO vo, OrderVO oVO, DeliveryVO dVO,
			PayVO pVO) {
		oVO.setUser_id(vo.getUser_id());
		OrderVO receiverInfo = myPageService.getReceiverInfo(oVO);

		dVO.setUser_id(vo.getUser_id());
		DeliveryVO deliveryInfo = myPageService.getDeliveryInfo(dVO);
		String lotteRandomNum = myPageService.makeRandomNumber();

		List<OrderProductInfoVO> opiList = myPageService.getOrderProductInfo(oVO);

		PayVO payInfo = myPageService.getPayInfo(pVO);

		String userId = vo.getUser_id();
		String salePercent = myPageService.getUserLevel(userId);

		model.addAttribute("receiverInfo", receiverInfo); // 주문자정보
		model.addAttribute("deliveryInfo", deliveryInfo); // 배송지정보
		model.addAttribute("orderProductInfo", opiList); // 주문상품정보
		model.addAttribute("payInfo", payInfo); // 결제정보
		model.addAttribute("lotteRandomNum", lotteRandomNum); // 송장번호(12자리난수)
		model.addAttribute("salePercent", salePercent); // 회원등급에 따른 추가할인율
		return "mypage/myOrderDetail";
	}

	@RequestMapping("orderCancel.do")
	public String cancelOrder(Model model, DeliveryVO dVO, PointVO pVO, PayVO payVO, OrderVO oVO, @SessionAttribute("userVO") UserVO uVO, HttpSession session) {
		System.out.println("구매취소 버튼 클릭!");
		
		myPageService.deletePoint(pVO); // 포인트 회수
		myPageService.changePayState(payVO); // 결제정보 변경
		myPageService.changeOrderState(oVO); // 주문상태 변경
		myPageService.changeOrderProductState(oVO); // 주문상품상태 변경
		myPageService.changeDeliveryState(dVO); // 배송상태 변경	
		pVO.setAdd_point(payVO.getPay_use_point());
		if (pVO.getAdd_point() != 0) {
			pVO.setUser_id(uVO.getUser_id());
			pVO.setAdd_point(pVO.getAdd_point());
			pVO.setPoint_content("주문취소");
			myPageService.cancelPoint(pVO); // 사용한 포인트 돌려주기(구매취소시)
			pointService.update_point(uVO.getUser_id());
		}		
		dVO.setDelivery_state("주문취소");
		deliveryService.insertDelivery_state(deliveryService.getDeliveryCont(dVO)); // 배송상세내역에 넣어줌
		// 유저정보 동기화
		UserVO user = userLoginService.viewUser(uVO);
		session.setAttribute("userVO", user);
		return "redirect:myOrderList.do";
	}

	@RequestMapping("orderCommit.do")
	public String commitOrder(@SessionAttribute("userVO") UserVO uVO, DeliveryVO dVO, OrderProductInfoVO opiVO,
			HttpSession session) {
		System.out.println("구매확정 버튼 클릭!");

		deliveryService.updateDeliveryState(dVO);
		int orderSeq = dVO.getOrder_seq(); // 주문번호
		// 구매 확정시 적립금 지급
		pointService.orderSuccessPoint(dVO);
		pointService.update_point(dVO.getUser_id());
		// order_prod 상태 구매확정으로
		deliveryService.Prod_state_change(orderSeq);
		// order_list 상태 구매확정으로
		deliveryService.order_state_change(orderSeq);
		// pay 상태 구매확정으로
		deliveryService.pay_state_change(orderSeq);
		// 판매량 구입한 수량만큼 더해주기 (feat.김요셉)
		deliveryService.getOrderInfo(orderSeq, opiVO);

		int totalOrderPage = myPageService.getTotalOrderMoney(uVO.getUser_id());
		if (totalOrderPage >= 700000) {
			uVO.setUser_level("Dia");
		} else if (totalOrderPage >= 500000) {
			uVO.setUser_level("Platinum");
		} else if (totalOrderPage >= 300000) {
			uVO.setUser_level("Gold");
		} else if (totalOrderPage >= 100000) {
			uVO.setUser_level("Silver");
		} else {
			uVO.setUser_level("Bronze");
		}
		myPageService.changeUserLevel(uVO); // 등급 업데이트

		// 유저정보 동기화
		UserVO user = userLoginService.viewUser(uVO);
		session.setAttribute("userVO", user);

		return "redirect:/mypage.do";
	}

}

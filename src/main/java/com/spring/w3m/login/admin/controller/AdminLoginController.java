package com.spring.w3m.login.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.service.AdminService;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;
import com.spring.w3m.statistics.admin.service.StatisticsService;
import com.spring.w3m.statistics.admin.vo.StatisticsVO;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private StatisticsService statisticsService;

	// 관리자 로그인화면
	@RequestMapping(value = "/loginForm.mdo", method = RequestMethod.GET)
	public String adminLoginForm() {
		System.out.println("=== 관리자 로그인 화면===");
		return "page/login/login";
	}
	
	// 관리자 로그인
	@RequestMapping("/login.mdo")
	public String adminLogin(AdminVO vo, HttpSession session) {
		if(adminService.loginCheck(vo, session)){
			System.out.println("관리자 로그인 성공!");
			return "redirect:/index.mdo";
		}else {
			System.out.println("관리자 로그인 실패!");
			return "page/login/login";
		}
	}

	// 관리자 로그아웃
	@RequestMapping("/adminLogout.mdo")
	public String userLogout(HttpSession session) {
		adminService.logout(session);
		return "page/login/login";
	}

	// 관리자 메인페이지
	@RequestMapping("/index.mdo")
	public String index(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		// 회원관리 리스트
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = adminService.getUserListCnt(search);
		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		List<UserVO> pageList = adminService.getPageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("userList", pageList);
		model.addAttribute("cnt", cnt);

		// 메인 카드들
		StatisticsVO svo = statisticsService.todaySales();
		int money;
		if(svo == null) {
			money = 0;
		}else {
			money = svo.getTotal_sum(); //매출 하나도 없으면 svo에 null 들어가서 널포인터exception 뜨길래 일단 이렇게 해놨어!
		}
		model.addAttribute("todaySales", money);
		
		
		return "admin_index";
	}

	// 고객 관리
	@RequestMapping("/userMemberList.mdo")
	public String userMembeList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {
		System.out.println("=== 고객관리 ===");

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = adminService.getUserListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		List<UserVO> pageList = adminService.getPageList(search);

		for (UserVO list : pageList) {
			String kakao = list.getUser_sns_kakao();
			String naver = list.getUser_sns_naver();
			System.out.println(kakao);
			System.out.println(naver);
			if (kakao == null & naver == null) {
				list.setUser_sns_naver("W3M");
			} else if (kakao == null & naver != null) {
				list.setUser_sns_naver("NAVER");
			} else {
				list.setUser_sns_naver("KAKAO");
			}
		}
		model.addAttribute("pagination", search);
		model.addAttribute("userList", pageList);

		model.addAttribute("cnt", cnt);

		return "page/user/userMemberList";
	}

	@RequestMapping("/updateUserPause.mdo")
	public String updateUserPause(UserVO vo, Model model, @RequestParam("user_id") String user_id,
			@RequestParam("user_state") String user_state) {
		vo.setUser_id(user_id);
		if (user_state.equals("정지")) {
			vo.setUser_state("일반");
		}
		if (user_state.equals("일반")) {
			vo.setUser_state("정지");
		}
		adminService.updateUserPause(vo);
		return "redirect:/userMemberList.mdo";
	}

	@RequestMapping("/purchaseDetail.mdo")
	public String adminPurchaseDetail(Model model, @RequestParam("user_id") String user_id,
			@RequestParam("order_seq") int order_seq, DeliveryVO vo) {

		List<OrderProductInfoVO> opiList = adminService.getOrderProductList(vo);

		model.addAttribute("userInfo", adminService.getUser(user_id));
		model.addAttribute("deliveryInfo", adminService.getDelivery(order_seq));
		model.addAttribute("orderProductInfo", opiList); // 주문상품정보
		model.addAttribute("payInfo", adminService.getPay(order_seq));
		model.addAttribute("salePercent", adminService.getUserLevel(user_id));

		return "page/order/orderDetail";
	}
}

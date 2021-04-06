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
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.login.admin.service.AdminService;
import com.spring.w3m.login.admin.vo.AdminVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminService adminService;

	// 관리자 페이지
	@RequestMapping(value = "/login.mdo", method = RequestMethod.GET)
	public String adminLogin() {
		System.out.println("=== 관리자 로그인 ===");
		return "login";
	}

	@RequestMapping("/loginIndex.mdo")
	public String loginIndex(AdminVO vo, Model model, HttpSession session, @RequestParam(required = false, defaultValue = "1") int page,
																		   @RequestParam(required = false, defaultValue = "1") int range,
																		   @RequestParam(required = false, defaultValue = "title") String searchType,
																		   @RequestParam(required = false) String keyword) throws PSQLException, IOException {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int cnt = adminService.getUserListCnt(search);
		
		search.pageInfo(page, range, cnt);
		
		//Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<UserVO> pageList = adminService.getPageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("userList", pageList);
		model.addAttribute("cnt", cnt);		
		return "page/index/index";

	}

	// 관리자 페이지
	@RequestMapping("/index.mdo")
	public String index(AdminVO vo, Model model, HttpSession session, @RequestParam(required = false, defaultValue = "1") int page,
																	  @RequestParam(required = false, defaultValue = "1") int range,
																	  @RequestParam(required = false, defaultValue = "title") String searchType,
																	  @RequestParam(required = false) String keyword) throws PSQLException, IOException {
		// 회원관리 리스트	
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int cnt = adminService.getUserListCnt(search);
		
		search.pageInfo(page, range, cnt);
		
		//Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<UserVO> pageList = adminService.getPageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("userList", pageList);
		model.addAttribute("cnt", cnt);

		// 관리자 로그인 유효성
		AdminVO voo = adminService.getAdmin();
		System.out.println("사이트-" + vo.getAdmin_id());
		System.out.println("db-" + voo.getAdmin_id());

		if (vo.getAdmin_id().equals(voo.getAdmin_id())) {
			if (vo.getAdmin_password().equals(voo.getAdmin_password())) {
				return "page/index/index";
			} else {
				System.out.println("아이디는 맞으나 비번이 틀림");
				return "login";
			}
		} else
			System.out.println(" 틀림");
		return "login";

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
		for( UserVO list : pageList) {
			String kakao = list.getUser_sns_kakao();
			String naver = list.getUser_sns_naver();
			System.out.println(kakao);
			System.out.println(naver);
			if(kakao==null & naver==null) {
				list.setUser_sns_naver("W3M");
			}else if(kakao==null & naver!=null) {
				list.setUser_sns_naver("NAVER");
			}else {
				list.setUser_sns_naver("KAKAO");
			}
		}
		model.addAttribute("pagination", search);
		model.addAttribute("userList", pageList);
		model.addAttribute("cnt", cnt);

		return "page/user/userMemberList";
	}

	
	@RequestMapping("/updateUserPause.mdo")
	public String updateUserPause(UserVO vo, Model model,@RequestParam("user_id")String user_id,
			@RequestParam("user_state")String user_state) {
		vo.setUser_id(user_id);
		if(user_state.equals("정지")) {
			vo.setUser_state("일반");
		}if(user_state.equals("일반")) {
			vo.setUser_state("정지");
		}
		adminService.updateUserPause(vo);
		return "redirect:/userMemberList.mdo";
	}

	@RequestMapping("/adminLogout.mdo")
	public ModelAndView userLogout(HttpSession session) {
		adminService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	
	
	
	@RequestMapping("/purchase.mdo")
	public String adminPurchase(AdminVO vo, Model model){		
		List<AdminVO> purchaseList = adminService.getPurchaseList(vo);
		model.addAttribute("purchase", purchaseList);
		System.out.println("주문내역");

		return "page/order/admin_order";
	}
	

}

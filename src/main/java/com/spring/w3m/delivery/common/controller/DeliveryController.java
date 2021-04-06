package com.spring.w3m.delivery.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.delivery.common.service.DeliveryService;
import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.service.PointService;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService service;
	@Autowired
	private PointService pointService;
	
	@RequestMapping("/getDeliveryList.mdo")
	public String delivery(DeliveryVO vo, Model model, @RequestParam(required = false, defaultValue = "1")int page,
													   @RequestParam(required = false, defaultValue = "1")int range,
													   @RequestParam(required = false, defaultValue = "title") String searchType,
													   @RequestParam(required = false)String keyword
													   ) throws PSQLException, IOException {
		System.out.println("배송정보 목록으로 이동...");		
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = service.getDeliveryListCnt(search);

		search.pageInfo(page, range, cnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		List<DeliveryVO> deliveryList = service.getPageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("cnt", cnt);
		
		return "page/delivery/deliveryList";
	}	
	
	@RequestMapping("/changeDeliveryState.mdo") //배송상태 변경버튼
	public String delivery(DeliveryVO vo,HttpSession session) {
		System.out.println("배송정보 수정하기 클릭!");	
		
		service.updateDeliveryState(vo);		
		
		DeliveryVO vvs = service.getDeliveryCont(vo);		
		service.insertDelivery_state(vvs);
		
		//구매확정 시  point 지급 기능 들어갈 자리-김웅기		
		String DeliveryState = vo.getDelivery_state();
		System.out.println(DeliveryState);
		if(DeliveryState.equals("구매확정")) {
			System.out.println("구매확정입니다.");
			System.out.println(vo.toString());
			int orderSeq = vo.getOrder_seq();
			String user_id = vo.getUser_id();
			System.out.println(orderSeq);
			System.out.println(user_id);
			pointService.orderSuccessPoint(vo);
			// order_prod 상태 구매확정으로
			int a = service.Prod_state_change(orderSeq);
			System.out.println("prod상태 변경"+a);
			// order_list 상태 구매확정으로
			int aa = service.order_state_change(orderSeq);
			System.out.println("오더 리스트상태 변경"+aa);
			// pay 상태 구매확정으로
			int aaa = service.pay_state_change(orderSeq);
			System.out.println("페이 상태 변경"+aaa);
			
			
		}
		if(DeliveryState.equals("주문취소")) {
			System.out.println("주문취소입니다.");
			System.out.println(vo.toString());
			pointService.orderDeletePoint(vo);

		}
//		//여기서 포인트 업데이트
		pointService.update_point(vo.getUser_id());//사용한 적립금 업데이트!
//		//세션 초기화
//		UserVO user = userService.getUser(vo1);

		/*if(vo.getDelivery_state() != null &&vo1.getOrder_state() != null) {
			if(vo.getDelivery_state().equals("주문취소")&&vo1.getOrder_state().equals("구매확정"));{
			vo2.setOrder_seq(vo.getOrder_seq());
			pointSevice.getPayList(vo2);
			
			vo1.setUser_id(vo.getUser_id());
			vo1.setAdd_point(vo2.getPay_total_point()*-1);
			vo1.setOrder_seq(vo.getOrder_seq());
			vo1.setPoint_content(vo.getProd_title() + "주문 취소");
			pointSevice.insertPoint(vo1);
			pointSevice.minusPoint(vo1);
			}
		}
		*/
		return "redirect:/getDeliveryList.mdo";
	}
	
}

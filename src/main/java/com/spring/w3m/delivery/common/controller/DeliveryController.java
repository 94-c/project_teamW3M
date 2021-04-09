package com.spring.w3m.delivery.common.controller;

import java.io.IOException;
import java.util.List;

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
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;

@Controller
public class DeliveryController {

	@Autowired
	private DeliveryService service;
	@Autowired
	private PointService pointService;

	@RequestMapping("/getDeliveryList.mdo")
	public String delivery(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

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

	@RequestMapping("/changeDeliveryState.mdo") // 배송상태 변경버튼
	public String delivery(DeliveryVO vo, OrderProductInfoVO opiVO) {

		service.updateDeliveryState(vo);

		DeliveryVO vvs = service.getDeliveryCont(vo);
		service.insertDelivery_state(vvs);

		// 구매확정 시 point 지급 기능 들어갈 자리-김웅기
		String DeliveryState = vo.getDelivery_state();
		if (DeliveryState.equals("구매확정")) {
			int orderSeq = vo.getOrder_seq();
			pointService.orderSuccessPoint(vo);
			// order_prod 상태 구매확정으로
			service.Prod_state_change(orderSeq);
			// order_list 상태 구매확정으로
			service.order_state_change(orderSeq);
			// pay 상태 구매확정으로
			service.pay_state_change(orderSeq);
			// 판매량 구입한 수량만큼 더해주기 (feat.김요셉)
			service.getOrderInfo(orderSeq, opiVO);
		}
		if (DeliveryState.equals("주문취소")) {
			pointService.orderDeletePoint(vo);
		}
		// 여기서 포인트 업데이트
		pointService.update_point(vo.getUser_id());// 사용한 적립금 업데이트!

		return "redirect:/getDeliveryList.mdo";
	}

}

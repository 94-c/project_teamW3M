package com.spring.w3m.delivery.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.dao.DeliveryDAO;
import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.OrderProductInfoVO;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	@Autowired
	private DeliveryDAO dao;

	@Override
	public List<DeliveryVO> getDeliveryList(DeliveryVO vo) {
		return dao.getDeliveryList(vo);
	}

	@Override // 배송상태 변경이벤트 발생시 처리메서드
	public void updateDeliveryState(DeliveryVO vo) {
		if (vo.getDelivery_state() == null) {
			vo.setDelivery_state("배송전");
		} else if (vo.getDelivery_state().equals("before")) {
			vo.setDelivery_state("배송전");
		} else if (vo.getDelivery_state().equals("ing")) {
			vo.setDelivery_state("배송중");
		} else if (vo.getDelivery_state().equals("after")) {
			vo.setDelivery_state("배송완료");
		} else if (vo.getDelivery_state().equals("commit")) {
			vo.setDelivery_state("구매확정");
		} else {
			vo.setDelivery_state("주문취소");
		}
		dao.updateDeliveryState(vo);
	}

	@Override
	public int getDeliveryListCnt(Search search) {
		return dao.getDeliveryListCnt(search);
	}

	@Override
	public List<DeliveryVO> getPageList(Search search) {
		return dao.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return dao.getSearchCnt(searchKeyword);
	}

	@Override
	public List<DeliveryVO> getSearchPagingList(Pagination pagination) {
		return dao.getSearchPagingList(pagination);
	}

	@Override
	public void insertDelivery_state(DeliveryVO vo) {
		dao.insertDelivery_state(vo);
	}

	@Override
	public DeliveryVO getDelivery(OrderVO vo) {
		return dao.getDelivery(vo);
	}

	@Override
	public DeliveryVO getDeliveryCont(DeliveryVO vo) {
		return dao.getDeliverycont(vo);
	}

	@Override
	public int order_state_change(int order_seq) {

		return dao.order_state_change(order_seq);
	}

	@Override
	public int Prod_state_change(int order_seq) {

		return dao.Prod_state_change(order_seq);
	}

	@Override
	public int pay_state_change(int order_seq) {

		return dao.pay_state_change(order_seq);
	}

	@Override // 주문한 상품품목을 리스트로 얻어옴(ex. 소독제 대형, 쿨패치)
	public void getOrderInfo(int order_seq, OrderProductInfoVO opiVO) {
		List<OrderProductInfoVO> orderProductList = dao.getOrderInfo(order_seq);
		for (int i = 0; i < orderProductList.size(); i++) {
			opiVO.setProd_amount(orderProductList.get(i).getProd_amount());
			opiVO.setProd_code(orderProductList.get(i).getProd_code());
			opiVO.setOrder_seq(order_seq);
			addSalesRate(opiVO);
		}
	}

	@Override // 얻어온 상품 개수만큼 판매량 플러스시킴(ex. 소독제 대형, 쿨패치)
	public void addSalesRate(OrderProductInfoVO opiVO) {
		dao.addSalesRate(opiVO);
	}

}

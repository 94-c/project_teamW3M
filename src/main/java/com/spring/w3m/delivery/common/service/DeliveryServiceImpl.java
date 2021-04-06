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
	public List<DeliveryVO> getDeliveryList(DeliveryVO vo){		
		return dao.getDeliveryList(vo);
	}
	
	@Override //배송상태 변경이벤트 발생시 처리메서드
	public void updateDeliveryState(DeliveryVO vo) {
		if(vo.getDelivery_state() == null) {
			vo.setDelivery_state("배송전");			
		}else if(vo.getDelivery_state().equals("before")) {
			vo.setDelivery_state("배송전");
		}else if(vo.getDelivery_state().equals("ing")) {
			vo.setDelivery_state("배송중");
		}else if(vo.getDelivery_state().equals("after")) {
			vo.setDelivery_state("배송완료");
		}else if(vo.getDelivery_state().equals("commit")) {
			vo.setDelivery_state("구매확정");
		}else {
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
	
	@Override //주문상품 개수 얻어옴
	public void getOrderAmount(int order_seq, OrderProductInfoVO opiVO) {
		List<Integer> amountList = dao.getOrderAmount(order_seq);
		for(int i=0; i<amountList.size(); i++) {
			opiVO.setProd_amount(amountList.get(i));
			addSalesRate(opiVO);
		}
	}
	@Override //얻어온 상품 개수만큼 판매량 플러스시킴
	public void addSalesRate(OrderProductInfoVO opiVO) {
		dao.addSalesRate(opiVO);
	}
	
}

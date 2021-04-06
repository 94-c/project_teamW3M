package com.spring.w3m.delivery.common.service;

import java.util.List;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface DeliveryService {

	public List<DeliveryVO> getDeliveryList(DeliveryVO vo);
	
	public void updateDeliveryState(DeliveryVO vo);
	
	int getDeliveryListCnt(Search search);
	
	List<DeliveryVO> getPageList(Search search);
	
	int getSearchCnt(String searchKeyword);
	
	List<DeliveryVO> getSearchPagingList(Pagination pagination);
	
	void insertDelivery_state(DeliveryVO vo);
	
	DeliveryVO getDelivery(OrderVO vo);
	
	DeliveryVO getDeliveryCont(DeliveryVO vo);
	int order_state_change(int order_seq);
	int Prod_state_change(int order_seq);
	int pay_state_change(int order_seq);

}

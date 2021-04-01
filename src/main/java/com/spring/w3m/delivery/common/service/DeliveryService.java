package com.spring.w3m.delivery.common.service;

import java.util.List;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface DeliveryService {

	public List<DeliveryVO> getDeliveryList(DeliveryVO vo);
	
	public void updateDeliveryState(DeliveryVO vo);
	
	int getDeliveryListCnt(Search search);
	
	List<DeliveryVO> getPageList(Search search);
	
	int getSearchCnt(String searchKeyword);
	
	List<DeliveryVO> getSearchPagingList(Pagination pagination);

}

package com.spring.w3m.order.admin.service;

import java.util.List;

import com.spring.w3m.order.admin.vo.PurchaseVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface PurchaseService {

	List<PurchaseVO> getPurchaseList(PurchaseVO vo);

	int getPurchaseListCnt(Search search);

	List<PurchaseVO> getPageList(Search search);

	int getSearchCnt(String searchKeyword);

	List<PurchaseVO> getSearchPagingList(Pagination pagination);

}

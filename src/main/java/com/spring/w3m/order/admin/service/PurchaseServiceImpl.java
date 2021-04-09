package com.spring.w3m.order.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.admin.dao.PurchaseDAO;
import com.spring.w3m.order.admin.vo.PurchaseVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO;

	@Override
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return purchaseDAO.getPurchaseList(vo);
	}

	@Override
	public int getPurchaseListCnt(Search search) {
		return purchaseDAO.getPurchaseListCnt(search);
	}

	@Override
	public List<PurchaseVO> getPageList(Search search) {
		return purchaseDAO.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return purchaseDAO.getSearchCnt(searchKeyword);
	}

	@Override
	public List<PurchaseVO> getSearchPagingList(Pagination pagination) {
		return purchaseDAO.getSearchPagingList(pagination);
	}

}

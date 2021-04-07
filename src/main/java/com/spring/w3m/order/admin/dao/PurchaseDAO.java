package com.spring.w3m.order.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.admin.vo.PurchaseVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Service
public class PurchaseDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<PurchaseVO> getPurchaseList(PurchaseVO vo) {
		return sqlSessionTemplate.selectList("PurchaseDAO.getPurchaseList");
	}

	public int getPurchaseListCnt(Search search) {
		System.out.println("getPurchaseListCnt() 실행");
		return sqlSessionTemplate.selectOne("PurchaseDAO.getPurchaseListCnt");
	}
	
	public List<PurchaseVO> getPageList(Search search){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("PurchaseDAO.getPageList", search);
	}
	
	public int getSearchCnt(String searchKeyword) {
		System.out.println("getSearchCnt() 실헹");
		return sqlSessionTemplate.selectOne("PurchaseDAO.getSearchKeyword");
	}
	
	public List<PurchaseVO> getSearchPagingList(Pagination pagination){
		System.out.println("getSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("PurchaseVO.getSearchPagingList");
	}
	
}

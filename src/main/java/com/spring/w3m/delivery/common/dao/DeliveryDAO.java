package com.spring.w3m.delivery.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Repository
public class DeliveryDAO {
	@Autowired
	private SqlSessionTemplate template;

	public List<DeliveryVO> getDeliveryList(DeliveryVO vo) {
		return template.selectList("delivery.getDeliveryList", vo);
	}

	public void updateDeliveryState(DeliveryVO vo) {
		template.update("delivery.updateDeliveryState", vo);
	}
	
	//페이징 및 검색
	public int getDeliveryListCnt(Search search) {
		System.out.println("getDeliveryListCnt() 실행");
		return template.selectOne("delivery.getDeliveryListCnt");
	}
	
	public List<DeliveryVO> getPageList(Search search){
		System.out.println("getPageList() 실행");
		return template.selectList("delivery.getPageList", search);
	}
	
	public int getSearchCnt(String searchKeyword) {
		System.out.println("getSearchCnt() 실헹");
		return template.selectOne("delivery.getSearchKeyword");
	}
	
	public List<DeliveryVO> getSearchPagingList(Pagination pagination){
		System.out.println("getSearchPagingList() 실행");
		return template.selectList("delivery.getSearchPagingList");
	}

}

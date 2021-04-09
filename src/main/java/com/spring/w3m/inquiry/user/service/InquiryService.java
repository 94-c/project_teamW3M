package com.spring.w3m.inquiry.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

public interface InquiryService {
	void insertInquiry(InquiryVO vo);

	void updateInquiry(InquiryVO vo);

	void deleteInquiry(InquiryVO vo);

	InquiryVO getInquiry(InquiryVO vo);

	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	ProductVO getProduct(ProductVO vo);
	
	
	// 검색 ,페이징
	int getInquiryListCnt(Search search);

	List<InquiryVO> getPageList(Search search);

	int getSearchCnt(String searchKeyword);

	List<InquiryVO> getSearchPagingList(Pagination pagination);
	
}

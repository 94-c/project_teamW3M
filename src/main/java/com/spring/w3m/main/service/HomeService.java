package com.spring.w3m.main.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

public interface HomeService {
	List<ProductVO> selectProduct(ProductVO vo);

	ProductVO getProduct(ProductVO vo);
	
	List<InquiryVO> productInq(Search search);
	
	int getInquiryListCnt(Search search);
}

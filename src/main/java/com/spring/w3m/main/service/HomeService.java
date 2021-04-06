package com.spring.w3m.main.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface HomeService {
	List<ProductVO> selectProduct(ProductVO vo);

	ProductVO getProduct(ProductVO vo);
	
	List<InquiryVO> productInq(Search search);
	
	int getInquiryListCnt(Search search);
	
	TosVO getTos(TosVO vo);
	
	List<ReviewVO> productRe(Search search);
	
	int getReviewListCnt(Search search1);
}

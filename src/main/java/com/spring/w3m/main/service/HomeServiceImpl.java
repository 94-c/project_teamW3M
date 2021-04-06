package com.spring.w3m.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.main.dao.HomeDAO;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Service("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDAO dao;

	@Override
	public List<ProductVO> selectProduct(ProductVO vo) {
		return dao.selectProduct(vo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return dao.getProduct(vo);
	}

	@Override
	public List<InquiryVO> productInq(Search search) {
		return dao.productInq(search);
	}
	
	@Override
	public int getInquiryListCnt(Search search) {
		return dao.getInquiryListCnt(search);
	}

	@Override
	public TosVO getTos(TosVO vo) {
		return dao.getTos(vo);
	}

	@Override
	public List<ReviewVO> productRe(Search search1) {
		return dao.productRe(search1);
	}

	@Override
	public int getReviewListCnt(Search search1) {
		return dao.getReviewListCnt(search1);
	}

}

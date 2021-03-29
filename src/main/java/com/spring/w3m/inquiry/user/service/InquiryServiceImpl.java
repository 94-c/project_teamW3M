package com.spring.w3m.inquiry.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.inquiry.user.dao.InquiryDAO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public void insertInquiry(InquiryVO vo) {
		inquiryDAO.insertInquiry(vo);
		
	}

	@Override
	public void updateInquiry(InquiryVO vo) {
		inquiryDAO.updateInquiry(vo);		
	}

	@Override
	public void deleteInquiry(InquiryVO vo) {
		inquiryDAO.deleteInquiry(vo);		
	}

	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return inquiryDAO.getInquiry(vo);
	}

	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return inquiryDAO.getInquiryList(vo);
	}

	@Override
	public int getInquiryListCnt(Search search) {
		return inquiryDAO.getInquiryListCnt(search);
	}

	@Override
	public List<InquiryVO> getPageList(Search search) {
		return inquiryDAO.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return inquiryDAO.getSearchCnt(searchKeyword);
	}

	@Override
	public List<InquiryVO> getSearchPagingList(Pagination pagination) {
		return inquiryDAO.getSearchPagingList(pagination);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return inquiryDAO.getProduct(vo);
	}

}

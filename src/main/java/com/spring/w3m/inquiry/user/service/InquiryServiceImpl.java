package com.spring.w3m.inquiry.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.common.paging.vo.Criteria;
import com.spring.w3m.inquiry.user.dao.InquiryDAO;
import com.spring.w3m.inquiry.user.vo.InquiryVO;

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

}

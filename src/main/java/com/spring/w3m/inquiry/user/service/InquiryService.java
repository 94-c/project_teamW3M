package com.spring.w3m.inquiry.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.InquiryVO;

public interface InquiryService {
	void insertInquiry(InquiryVO vo);

	void updateInquiry(InquiryVO vo);

	void deleteInquiry(InquiryVO vo);

	InquiryVO getInquiry(InquiryVO vo);

	List<InquiryVO> getInquiryList(InquiryVO vo);
}

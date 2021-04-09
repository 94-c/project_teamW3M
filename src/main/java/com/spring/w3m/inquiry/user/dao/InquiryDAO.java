package com.spring.w3m.inquiry.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class InquiryDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertInquiry(InquiryVO vo) { // 문의게시판 글쓰기
		sqlSessionTemplate.insert("InquiryDAO.insertInquiry", vo);
	}

	public void updateInquiry(InquiryVO vo) {// 문의게시판 글수정
		sqlSessionTemplate.update("InquiryDAO.updateInquiry", vo);
	}

	public void deleteInquiry(InquiryVO vo) {// 문의게시판 글삭제
		sqlSessionTemplate.delete("InquiryDAO.deleteInquiry", vo);
	}

	public InquiryVO getInquiry(InquiryVO vo) {// 문의게시판 글상세보기
		// 조회수 증가
		sqlSessionTemplate.update("inquiryCntUpdate", vo);
		return sqlSessionTemplate.selectOne("InquiryDAO.getInquiry", vo);
	}

	public List<InquiryVO> getInquiryList(InquiryVO vo) {// 문의게시판 글목록보기
		return sqlSessionTemplate.selectList("InquiryDAO.getInquiryList", vo);
	}

	public int getInquiryListCnt(Search search) {
		return sqlSessionTemplate.selectOne("InquiryDAO.getInquiryListCnt");
	}

	public List<InquiryVO> getPageList(Search search) {
		return sqlSessionTemplate.selectList("InquiryDAO.getPageList", search);
	}

	public int getSearchCnt(String searchKeyword) {
		return sqlSessionTemplate.selectOne("InquiryDAO.getSearchKeyword");
	}

	public List<InquiryVO> getSearchPagingList(Pagination pagination) {
		return sqlSessionTemplate.selectList("InquiryDAO.getSearchPagingList");
	}

	public ProductVO getProduct(ProductVO vo) {
		return sqlSessionTemplate.selectOne("InquiryDAO.getProduct", vo);
	}

}
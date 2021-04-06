package com.spring.w3m.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Repository
public class HomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ProductVO> selectProduct(ProductVO vo) {
		System.out.println("DAO 실행");
		return sqlSessionTemplate.selectList("HomeDAO.selectProduct", vo);
	}

	public ProductVO getProduct(ProductVO vo) {
		System.out.println("DAO 실행");
		sqlSessionTemplate.update("HomeDAO.countUpdate",vo);
		return sqlSessionTemplate.selectOne("HomeDAO.getProduct", vo);
	}
	
	public List<InquiryVO> productInq(Search search){
		System.out.println("inq dao");
		return sqlSessionTemplate.selectList("HomeDAO.productInq",search);
	}
	
	public int getInquiryListCnt(Search search) {
		System.out.println("getInquiryListCnt() 실행");
		return sqlSessionTemplate.selectOne("HomeDAO.getInquiryListCnt");
	}
	
	public void countUpdate(ProductVO vo) {		
	}
	
	public TosVO getTos(TosVO vo) {
		return sqlSessionTemplate.selectOne("HomeDAO.getTos", vo);
	}
	
	public List<ReviewVO> productRe(Search search1){
		return sqlSessionTemplate.selectList("HomeDAO.productRe",search1);
	}
	
	public int getReviewListCnt(Search search1) {
		return sqlSessionTemplate.selectOne("HomeDAO.getReviewListCnt");
	}
}

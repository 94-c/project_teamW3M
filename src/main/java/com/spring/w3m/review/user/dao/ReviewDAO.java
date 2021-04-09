package com.spring.w3m.review.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertReview(ReviewVO vo) {
		sqlSessionTemplate.insert("ReviewDAO.insertReview", vo);
	}

	public void updateReview(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.updateReview", vo);
	}

	public void deleteReview(ReviewVO vo) {
		sqlSessionTemplate.delete("ReviewDAO.deleteReview", vo);
	}

	public ProductVO getProduct(ProductVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getProduct", vo);
	}

	public ReviewVO getReview(ReviewVO vo) {
		// 조회수 증가
		sqlSessionTemplate.update("reviewCntUpdate", vo);
		return sqlSessionTemplate.selectOne("ReviewDAO.getReview", vo);
	}

	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}

	public int getReviewListCnt(Search search) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getReviewListCnt");
	}

	public List<ReviewVO> getPageList(Search search) {
		return sqlSessionTemplate.selectList("ReviewDAO.getPageList", search);
	}

	public int getSearchCnt(String searchKeyword) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getSearchKeyword");
	}

	public List<ReviewVO> getSearchPagingList(Pagination pagination) {
		return sqlSessionTemplate.selectList("ReviewDAO.getSearchPagingList");
	}

	public int reviewReplyCount(ReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.reviewReplyCount", vo);
	}

}

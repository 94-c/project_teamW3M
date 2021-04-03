package com.spring.w3m.review.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertReview(ReviewVO vo) {
		sqlSessionTemplate.insert("ReviewDAO.insertReview", vo);
		System.out.println("후기게시판 글쓰기");

	}

	public void updateReview(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.updateReview", vo);
		System.out.println("후기게시판 글수정");

	}

	public void deleteReview(ReviewVO vo) {
		sqlSessionTemplate.delete("ReviewDAO.deleteReview", vo);
		System.out.println("후기게시판 글삭제");

	}

	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("후기게시판 글 상세보기");
		// 조회수 증가
		sqlSessionTemplate.update("reviewCntUpdate", vo);
		return sqlSessionTemplate.selectOne("ReviewDAO.getReview", vo);
	}


	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("후기게시판 글목록 보기");
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}
	
	public int getReviewListCnt(Search search) {
		System.out.println("getReviewListCnt() 실행");
		return sqlSessionTemplate.selectOne("ReviewDAO.getReviewListCnt");
	}
	
	public List<ReviewVO> getPageList(Search search){
		System.out.println("getPageList() 실행");
		return sqlSessionTemplate.selectList("ReviewDAO.getPageList", search);
	}
	
	public int getSearchCnt(String searchKeyword) {
		System.out.println("getSearchCnt() 실헹");
		return sqlSessionTemplate.selectOne("ReviewDAO.getSearchKeyword");
	}
	
	public List<ReviewVO> getSearchPagingList(Pagination pagination){
		System.out.println("getSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("ReviewDAO.getSearchPagingList");
	}

	public int reviewReplyCount(ReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.reviewReplyCount", vo);
	}
	
	/*
	 * public ProductVO getProduct(ProductVO vo) { return
	 * sqlSessionTemplate.selectOne("ReviewDAO.getProduct", vo); }
	 */
	
}


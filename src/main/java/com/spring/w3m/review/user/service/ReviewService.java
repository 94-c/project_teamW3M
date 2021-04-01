package com.spring.w3m.review.user.service;

import java.util.List;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface ReviewService {
	
	void insertReview(ReviewVO vo);

	void updateReview(ReviewVO vo);

	void deleteReview(ReviewVO vo);

	ReviewVO getReview(ReviewVO vo);

	List<ReviewVO> getReviewList(ReviewVO vo);
	
	
	/* ProductVO getProduct(ProductVO vo); */
	
	
	// 검색 ,페이징
	int getReviewListCnt(Search search);

	List<ReviewVO> getPageList(Search search);

	int getSearchCnt(String searchKeyword);

	List<ReviewVO> getSearchPagingList(Pagination pagination);
	
}
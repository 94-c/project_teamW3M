package com.spring.w3m.review.user.service;

import java.util.List;

import com.spring.w3m.review.user.vo.ReviewVO;

public interface ReviewService {
	
	//후기 목록
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//후기 작성
	void insertReview(ReviewVO vo);
}

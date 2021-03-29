package com.spring.w3m.review.user.service;

import java.util.List;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface ReviewService {
	
	//후기 목록
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//후기 작성
	void insertReview(ReviewVO vo);
	
	//후기 상세보기
	ReviewVO getReview(ReviewVO vo);
	
	//후기  업데이트
	void updateReview(ReviewVO vo);
	
	//후기 삭제하기
	void deleteReview(ReviewVO vo);
	
	//상품 정보
	ProductVO getProduct(ProductVO vo);
	
	//회원 정보
	UserVO getUser(UserVO vo);
}

package com.spring.w3m.review.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.review.user.dao.ReviewDAO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	//후기 목록 보기
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("Review 목록 보기");
		return reviewDAO.getReviewList(vo);
	}
	
	//후기 작성
	@Override
	public void insertReview(ReviewVO vo) {
		System.out.println("Review 작성");
		reviewDAO.insertReview(vo);
	}

	

}

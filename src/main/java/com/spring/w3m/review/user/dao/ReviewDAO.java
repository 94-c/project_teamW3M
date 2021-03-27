package com.spring.w3m.review.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.review.user.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("문의게시판 글목록 보기");
		return sqlsessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}
	
	//후기 글 작성
	public void insertReview(ReviewVO vo) {
		System.out.println("Review 후기 작성");
		sqlsessionTemplate.insert("ReviewDAO.insertReview", vo);
		
	}
}

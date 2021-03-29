package com.spring.w3m.review.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	//후기 게시판 목록 보기
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("후기게시판 글목록 보기");
		return sqlsessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}
	
	//후기 글 작성
	public void insertReview(ReviewVO vo) {
		System.out.println("후기게시판 후기 작성");
		sqlsessionTemplate.insert("ReviewDAO.insertReview", vo);
	}
	
	//후기 글 상세보기
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("후기게시판 글 상세 보기");
		return sqlsessionTemplate.selectOne("ReviewDAO.getReview", vo);
	}
	
	//후기 글 수정하기
	public void updateReview(ReviewVO vo) {
		System.out.println("후기게시판 글 수정 하기");
		sqlsessionTemplate.update("ReviewDAO.updateReview", vo);
	}
	
	//후기 글 삭제하기
	public void deleteReview(ReviewVO vo) {
		System.out.println("후기게시판 글 삭제 하기");
		sqlsessionTemplate.delete("ReviewDAO.deleteReview", vo);
	}
	
	//상품 정보
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("상품정보 보기");
		return sqlsessionTemplate.selectOne("ReviewDAO.getProduct", vo);
	}
	
	//회원정보
	public UserVO getUser(UserVO vo) {
		System.out.println("회원정보 보기");
		return sqlsessionTemplate.selectOne("ReviewDAO.getUser", vo);
	}
	
}


package com.spring.w3m.review.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.review.user.dao.ReviewDAO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewVO vo) {
		System.out.println("후기 게시글 작성");
		reviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		System.out.println("후기 게시글 수정");
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		System.out.println("후기 게시글 삭제");
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("후기 게시글 가져오기");
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("후기 리스트 가져오기");
		return reviewDAO.getReviewList(vo);
	}

	/*
	 * @Override public ProductVO getProduct(ProductVO vo) { return
	 * reviewDAO.getProduct(vo); }
	 */
	@Override
	public int getReviewListCnt(Search search) {
		return reviewDAO.getReviewListCnt(search);
	}

	@Override
	public List<ReviewVO> getPageList(Search search) {
		return reviewDAO.getPageList(search);
	}

	@Override
	public int getSearchCnt(String searchKeyword) {
		return reviewDAO.getSearchCnt(searchKeyword);
	}

	@Override
	public List<ReviewVO> getSearchPagingList(Pagination pagination) {
		return reviewDAO.getSearchPagingList(pagination);
	}
	
	 @Override
	 public int reviewReplyCount(ReviewVO vo) { 
		 return reviewDAO.reviewReplyCount(vo); 
	}
}
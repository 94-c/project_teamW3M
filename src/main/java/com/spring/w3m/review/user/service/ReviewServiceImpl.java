package com.spring.w3m.review.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.dao.ReviewDAO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

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

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return reviewDAO.getProduct(vo);
	}
}
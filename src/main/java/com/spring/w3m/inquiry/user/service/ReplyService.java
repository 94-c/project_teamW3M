package com.spring.w3m.inquiry.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.ReplyVO;
import com.spring.w3m.review.user.vo.ReviewVO;

public interface ReplyService {
	//댓글 조회
	List<ReplyVO> getReplyList(int inq_seq);
	
	// 후기 댓글 조회
	List<ReplyVO> getReviewReplyList(int review_seq);
	
	//댓글 등록
	void insertReply(ReplyVO vo);
	
	// 후기 댓글 등록
	void insertReviewReply(ReplyVO vo);
	
	// 후기댓글 상세
	ReplyVO getReply(ReplyVO vo);
	
	//댓글 삭제
	void deleteReply(ReplyVO vo);
	
	// 후기 댓글 삭제
	void deleteRevireReply(ReplyVO vo);
	
	//댓글 수정
	void updateReply(ReplyVO vo);
	
	// 후기 댓글 수정
	void updateReviewReply(ReplyVO vo);
	
	List<ReplyVO> getReplyList_review(int review_seq);
	
	// 후기 댓글 갯수
	int count(int review_re_seq);
	
	void reviewCnt(ReviewVO vo);
	
	void deleteReviewCnt(ReviewVO vo);

}

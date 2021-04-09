package com.spring.w3m.inquiry.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.ReplyVO;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 댓글 조회
	public List<ReplyVO> getReplyList(int inq_seq) {
		return sqlSessionTemplate.selectList("ReplyDAO.getReplyList", inq_seq);
	}

	// 후기 댓글 조회
	public List<ReplyVO> getReviewReplyList(int review_seq) {
		return sqlSessionTemplate.selectList("ReplyDAO.getReviewReplyList", review_seq);
	}

	// 후기 댓글 상세
	public ReplyVO getReply(ReplyVO vo) {
		return sqlSessionTemplate.selectOne("ReplyDAO.getReply", vo);
	}

	// 댓글 등록
	public void insertReply(ReplyVO vo) {
		sqlSessionTemplate.insert("ReplyDAO.insertReply", vo);
		sqlSessionTemplate.update("replyCntUpdate", vo);
	}

	// 후기 댓글 등록
	public void insertReviewReply(ReplyVO vo) {
		sqlSessionTemplate.insert("ReplyDAO.insertReviewReply", vo);
	}

	// 댓글 삭제
	public void deleteReply(ReplyVO vo) {
		sqlSessionTemplate.delete("ReplyDAO.deleteReply", vo);
	}

	// 댓글 수정
	public void updateReply(ReplyVO vo) {
		sqlSessionTemplate.update("ReplyDAO.updateReply", vo);
	}

	// 후기 댓글 수정
	public void updateReviewReply(ReplyVO vo) {
		sqlSessionTemplate.update("ReplyDAO.updateReviewReply", vo);
	}

	// 댓글 삭제
	public void deleteReviewReply(ReplyVO vo) {
		sqlSessionTemplate.delete("ReplyDAO.deleteReviewReply", vo);
	}

	public void reviewCnt(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.reviewCnt", vo);
	}

	public void deleteReviewCnt(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.deleteReviewCnt", vo);
	}
}
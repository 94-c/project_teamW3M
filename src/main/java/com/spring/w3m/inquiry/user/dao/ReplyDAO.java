package com.spring.w3m.inquiry.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.inquiry.user.vo.ReplyVO;

@Controller
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 댓글 조회
	public List<ReplyVO> getReplyList(int inq_seq) {
		System.out.println("댓글 목록 보기");
		return sqlSessionTemplate.selectList("ReplyDAO.getReplyList", inq_seq);
	}
	
	// 댓글 등록
	public void insertReply(ReplyVO vo) {
		sqlSessionTemplate.insert("ReplyDAO.insertReply", vo);
		System.out.println("댓글 등록");
	}
	
	// 댓글 삭제
	public void deleteReply(ReplyVO vo) {
		sqlSessionTemplate.delete("ReplyDAO.deleteReply", vo);
		System.out.println("댓글 삭제");

	}
	
	// 댓글 수정
	public void updateReply(ReplyVO vo) {
		sqlSessionTemplate.update("ReplyDAO.updateReply", vo);
		System.out.println("댓글 수정");

	}
}
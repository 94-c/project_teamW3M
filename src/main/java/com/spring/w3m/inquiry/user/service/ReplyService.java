package com.spring.w3m.inquiry.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.ReplyVO;

public interface ReplyService {
	//댓글 조회
	List<ReplyVO> getReplyList(int inq_seq);
	
	//댓글 등록
	void insertReply(ReplyVO vo);
}

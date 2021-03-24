package com.spring.w3m.inquiry.user.service;

import java.util.List;

import com.spring.w3m.inquiry.user.vo.ReplyVO;

public interface ReplyService {
	List<ReplyVO> getReplyList(int inq_seq);
}

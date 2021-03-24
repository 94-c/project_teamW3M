package com.spring.w3m.inquiry.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.inquiry.user.dao.ReplyDAO;
import com.spring.w3m.inquiry.user.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> getReplyList(int inq_seq) {
		return replyDAO.getReplyList(inq_seq);
	}

}

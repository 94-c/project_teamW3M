package com.spring.w3m.inquiry.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
}
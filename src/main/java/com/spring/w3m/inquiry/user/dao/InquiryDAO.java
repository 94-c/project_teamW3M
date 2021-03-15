package com.spring.w3m.inquiry.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.inquiry.user.vo.InquiryVO;

@Controller
public class InquiryDAO {
	@Autowired
	   private SqlSessionTemplate sqlSessionTemplate;
	   
	   public void insertInquiry(InquiryVO vo) {
	      sqlSessionTemplate.insert("InquiryDAO.insertInquiry",vo);
	      System.out.println("문의게시판 글쓰기");
	      
	   }
	   
	   public void updateInquiry(InquiryVO vo) {
		      sqlSessionTemplate.update("InquiryDAO.updateInquiry",vo);
		      System.out.println("문의게시판 글수정");
		      
		   }
	   
	   public void deleteInquiry(InquiryVO vo) {
		      sqlSessionTemplate.delete("InquiryDAO.deleteInquiry",vo);
		      System.out.println("문의게시판 글삭제");
		      
		   }
	   
	   public InquiryVO getInquiry(InquiryVO vo) {
		   	  System.out.println("문의게시판 글 상세보기");
		   	  //조회수 증가
		   	  sqlSessionTemplate.update("inquiryCntUpdate", vo);
		      return sqlSessionTemplate.selectOne("InquiryDAO.getInquiry",vo);		          
		   }
	   
	   public List<InquiryVO> getInquiryList(InquiryVO vo) {
		   	  System.out.println("문의게시판 글목록 보기");
		      return sqlSessionTemplate.selectList("InquiryDAO.getInquiryList",vo);		      
		   }
	}
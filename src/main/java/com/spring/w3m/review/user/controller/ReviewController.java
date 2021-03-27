package com.spring.w3m.review.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.inquiry.user.vo.ReplyVO;
import com.spring.w3m.review.user.service.ReviewService;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//후기 목록보가
	@RequestMapping("/review.do")
	public String getReviewList(ReviewVO vo,Model model) {
		System.out.println("후기 리스트");
		List<ReviewVO> reviewList = reviewService.getReviewList(vo);
		model.addAttribute("getReview", reviewList);
		return "review/review";
	}
	
	// 게시판 글 작성하기(화면)
		@RequestMapping("/review_write_view.do")
		public String reviewWrite(ReviewVO vo, Model model) {
			/* model.addAttribute("reviewList", reviewService.getReviewList(vo)); */
			return "review/review_write";
		}
		
		@RequestMapping("/review_write.do")
		public String insetReply(ReviewVO vo, Model model) {
			reviewService.insertReview(vo);
			return "redirect:/review.do";
		}
	
	
	//후기 작성
	/*
	 * @RequestMapping("/review_write.do") public String inquiryWrite(ReviewVO vo,
	 * Model model) throws Exception { System.out.println("후기 작성");
	 * model.addAttribute("getReview", reviewService.getReviewList(vo)); return
	 * "redirect:/review.do"; }
	 */
}

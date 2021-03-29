package com.spring.w3m.review.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.join.user.vo.UserVO;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.service.ReviewService;
import com.spring.w3m.review.user.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//후기 목록보기
	@RequestMapping("/review.do")
	public String getReviewList(ReviewVO vo,Model model) {
		System.out.println("후기 리스트");
		List<ReviewVO> reviewList = reviewService.getReviewList(vo);
		model.addAttribute("reviewList", reviewList);
		return "review/review";
	}
	
	//후기 글 작성하기(화면)
	@RequestMapping("/review_write_view.do")
	public String reviewWrite_view(ReviewVO vo, Model model,UserVO vo1, ProductVO vo2) {
		System.out.println("후기 글 작성");
		
		model.addAttribute("user", reviewService.getUser(vo1));
		model.addAttribute("product", reviewService.getProduct(vo2));
		
		return "review/review_write";
	}
	
	//후기 글 작성하기(작동)
	@RequestMapping("/review_write.do")
	public String reviewWrite(ReviewVO vo, Model model) {
		System.out.println("후기 글 작성");
		reviewService.insertReview(vo);
		return "redirect:/review.do";
	}
	
	//후기 글 상세보기
	@RequestMapping("/reviewContent.do")
	public String getReview(ReviewVO vo, Model model) {
		System.out.println("후기 글 상세보기");
		model.addAttribute("reviewVO", reviewService.getReview(vo));
		
		return "review/reviewContent";
	}
	
	//후기 글 수정하기
	@RequestMapping("/reviewUpdate.do")
	public String updateReview(ReviewVO vo, Model model) {
		reviewService.updateReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "review/review";
	}
	
	//후기 글 수정하기(화면)
	@RequestMapping("/reviewUpdate_view.do")
	public String updateReview_view(ReviewVO vo, Model model) {
		model.addAttribute("getReview", reviewService.getReview(vo));
		return "review/reviewUpdate";
	}
	
	//후기 글 삭제하기
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO vo, Model model) {
		reviewService.deleteReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "redirect:/review.do";
	}
	
}

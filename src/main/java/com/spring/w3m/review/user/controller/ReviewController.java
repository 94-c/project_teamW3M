package com.spring.w3m.review.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.inquiry.user.service.ReplyService;
import com.spring.w3m.inquiry.user.vo.ReplyVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.review.user.service.ReviewService;
import com.spring.w3m.review.user.vo.ReviewVO;
import com.spring.w3m.upload.common.AwsS3;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	public AwsS3 awsS3 = AwsS3.getInstance();

	@Autowired
	private ReplyService replyService;

	// 후기 게시글
	@RequestMapping("/review.do")
	public String getReviewList(Model model, ReplyVO rvo, ReviewVO vo, ProductVO pvo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		int cnt = reviewService.getReviewListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<ReviewVO> pageList = reviewService.getPageList(search);

		model.addAttribute("reviewList_review", reviewService.getReviewList(vo));
		model.addAttribute("pagination", search);
		model.addAttribute("reviewList", pageList);
		model.addAttribute("cnt", cnt);

		return "review/review";
	}

	// 게시판 글 작성하기(동작)
	@RequestMapping("/review_write.do")
	public String reviewWrite(ReviewVO vo, Model model, MultipartFile inq_mask) throws Exception {
		InputStream ism = inq_mask.getInputStream();
		String maskKey = inq_mask.getOriginalFilename();
		System.out.println(maskKey);
		String contentType = inq_mask.getContentType();
		long contentLength = inq_mask.getSize();
		System.out.println(maskKey);

		if (maskKey == "") {
			vo.setReview_image("파일없음");
		} else {
			String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/inquiry/" + maskKey;
			vo.setReview_image(path);
		}

		awsS3.uploadInquiry(ism, maskKey, contentType, contentLength);

		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		reviewService.insertReview(vo);
		return "redirect:/review.do";
	}

	// 게시판 글 작성하기(화면)
	@RequestMapping("/review_write_view.do")
	public String reviewWriteView(ProductVO vo, Model model) {
		model.addAttribute("product", reviewService.getProduct(vo));
		return "/review/review_write";
	}

	// 게시글 목록 보기
	@RequestMapping("/getReviewList.do")
	public String getReviewList(ReviewVO vo, Model model) {
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "review/review";
	}

	// 게시글 상세 보기
	@RequestMapping("/reviewContent.do")
	public String getReview(ReviewVO vo, ReplyVO rvo, ProductVO pvo, Model model) {
		System.out.println("글 상세보기 처리");

		model.addAttribute("reviewVO", reviewService.getReview(vo));
		model.addAttribute("product", reviewService.getProduct(pvo));
		List<ReplyVO> reviewReplyList = replyService.getReviewReplyList(vo.getReview_seq());
		model.addAttribute("reviewReplyList", reviewReplyList);

		return "review/reviewContent";
	}

	// 게시글 수정 하기
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewVO vo, Model model) {
		reviewService.updateReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "redirect:/review.do";
	}

	@RequestMapping("/review_update_view.do")
	public String reviewUpdateView(ReviewVO vo, Model model) {
		model.addAttribute("getReview", reviewService.getReview(vo));
		return "/review/reivew_update";
	}

	// 게시글 삭제 하기
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO vo, Model model) {
		reviewService.deleteReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "redirect:/review.do";
	}

	// 후기 게시글
	@RequestMapping("/adminReview.mdo")
	public String adminReviewList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = reviewService.getReviewListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<ReviewVO> pageList = reviewService.getPageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("reviewList", pageList);
		model.addAttribute("cnt", cnt);

		return "page/review/admin_review";
	}

	// 관리자 후기 상세보기
	@RequestMapping("/adminReviewContent.mdo")
	public String getAdminReview(ReviewVO vo, Model model) {
		System.out.println("글 상세보기 처리");
		model.addAttribute("reviewVO", reviewService.getReview(vo));

		List<ReplyVO> replyList = replyService.getReplyList(vo.getReview_seq());
		model.addAttribute("replyList", replyList);

		return "page/review/admin_review_content";
	}
	
	// 관리자 후기 삭제
	@RequestMapping("/deleteReview.mdo")
	public String deleteAdminReview(ReviewVO vo, Model model) {
		reviewService.deleteReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "redirect:/adminReview.mdo";
	}

	// 댓글 쓰기
	@RequestMapping("/insertReviewReply.do")
	public String insertReviewReply(ReplyVO rvo, ReviewVO vo) {
		replyService.insertReviewReply(rvo);
		replyService.reviewCnt(vo);
		return "redirect:/reviewContent.do?review_seq=" + rvo.getReview_seq();
	}

	// 댓글 수정
	@RequestMapping("/replyUpdate_view.do")
	public String updateReviewReplyView(ReplyVO rvo, Model model) {
		model.addAttribute("replyVO", replyService.getReply(rvo));
		return "/admin/page/reply/replyUpdate";
	}

	@RequestMapping("/replyUpdate.do")
	@ResponseBody
	public String updateReviewReply(@RequestBody ReplyVO vo, Model model) {
		replyService.updateReviewReply(vo);
		return "1";
	}

	@RequestMapping("/deleteReviewReply.do")
	public String deleteReviewReply(ReviewVO vo, ReplyVO rvo, Model model) {
		int seq = rvo.getReview_seq();
		replyService.deleteReviewCnt(vo);
		replyService.deleteReviewReply(rvo);
		return "redirect:/reviewContent.do?review_seq=" + seq;
	}

	// 후기 댓글 보기(새 창 띄우기)
	@RequestMapping("/review_reply.do")
	public String reviewReplyNew(Model model, ReviewVO vo) {
		List<ReplyVO> reviewReplyList = replyService.getReviewReplyList(vo.getReview_seq());
		model.addAttribute("reviewReplyList", reviewReplyList);
		return "/review/review_reply";
	}
}
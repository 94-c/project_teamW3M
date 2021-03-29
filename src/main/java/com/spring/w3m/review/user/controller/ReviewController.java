package com.spring.w3m.review.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String getReviewList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {
		System.out.println("후기게시글 리스트");

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

		return "review/review";
	}

	// 게시판 글 작성하기(동작)
	@RequestMapping("/review_write.do")
	public String reviewWrite(ReviewVO vo, Model model, MultipartFile inq_mask) throws Exception {
		
		  InputStream ism = inq_mask.getInputStream(); String maskKey =
		  inq_mask.getOriginalFilename(); System.out.println(maskKey); String
		  contentType = inq_mask.getContentType(); long contentLength =
		  inq_mask.getSize(); System.out.println(maskKey);
		  
		  if (maskKey == "") { vo.setReview_image("파일없음"); } else { String path =
		  "https://imageup.s3.ap-northeast-2.amazonaws.com/inquiry/" + maskKey;
		  vo.setReview_image(path); }
		  
		  awsS3.uploadInquiry(ism, maskKey, contentType, contentLength);
		
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		reviewService.insertReview(vo);
		return "redirect:/review.do";
	}

	// 게시판 글 작성하기(화면)
	@RequestMapping("/review_write_view.do")
	public String inquiryWriteView(ProductVO vo, Model model) {
		System.out.println(vo.getProd_seq());
		/* model.addAttribute("product", reviewService.getProduct(vo)); */
		System.out.println("---");
		System.out.println(vo.getProd_seq());
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
	public String getReview(ReviewVO vo, Model model) {
		System.out.println("글 상세보기 처리");
		model.addAttribute("reviewVO", reviewService.getReview(vo));

		List<ReplyVO> replyList = replyService.getReplyList(vo.getReview_seq());
		model.addAttribute("replyList", replyList);

		return "review/reviewContent";
	}

	// 게시글 수정 하기
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewVO vo, Model model) {
		reviewService.updateReview(vo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));
		return "/review/review";
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

	/*
	 * // 문의사항 리스트
	 * 
	 * @RequestMapping("/adminReview.mdo") public String adminReview(Model
	 * model, @RequestParam(required = false, defaultValue = "1") int page,
	 * 
	 * @RequestParam(required = false, defaultValue = "1") int range,
	 * 
	 * @RequestParam(required = false, defaultValue = "title") String searchType,
	 * 
	 * @RequestParam(required = false) String keyword) throws PSQLException,
	 * IOException { System.out.println("후기게시판 리스트");
	 * 
	 * Search search = new Search(); search.setSearchType(searchType);
	 * search.setKeyword(keyword);
	 * 
	 * int cnt = reviewService.getReviewListCnt(search);
	 * 
	 * search.pageInfo(page, range, cnt);
	 * 
	 * // Pagination Pagination pagination = new Pagination();
	 * pagination.pageInfo(page, range, cnt);
	 * 
	 * List<ReviewVO> pageList = reviewService.getPageList(search);
	 * 
	 * model.addAttribute("pagination", search); model.addAttribute("inquiryList",
	 * pageList); model.addAttribute("cnt", cnt);
	 * 
	 * return ""; }
	 * 
	 * // 관리자 문의사항 상세보기
	 * 
	 * @RequestMapping("/admin_inquiry_content.mdo") public String
	 * getAdminInquiry(InquiryVO vo, Model model) { model.addAttribute("inquiryVO",
	 * inquiryService.getInquiry(vo));
	 * 
	 * // 댓글 조회 List<ReplyVO> replyList =
	 * replyService.getReplyList(vo.getInq_seq()); model.addAttribute("replyList",
	 * replyList);
	 * 
	 * return "page/inquiry/admin_inquiry_content"; }
	 * 
	 * // 관리자 문의사항 삭제
	 * 
	 * @RequestMapping("/deleteInquiry.mdo") public String
	 * deleteAdminInquiry(InquiryVO vo, Model model) {
	 * inquiryService.deleteInquiry(vo); model.addAttribute("inquiryList",
	 * inquiryService.getInquiryList(vo)); return "redirect:/adminInquiry.mdo"; }
	 *
	 */
	
	/*
	 * // 댓글 쓰기
	 * 
	 * @RequestMapping("/insertReply.mdo") public String insetReply(ReplyVO
	 * rvo, @RequestParam("reply_text") String re_content) {
	 * rvo.setRe_content(re_content); replyService.insertReply(rvo); return
	 * "redirect:/admin_inquiry_content.mdo?inq_seq=" + rvo.getInq_seq(); }
	 * 
	 * // 댓글 삭제
	 * 
	 * @RequestMapping("/deleteReply.mdo") public String deleteReply(ReplyVO rvo) {
	 * int seq = rvo.getInq_seq(); replyService.deleteReply(rvo); return
	 * "redirect:/admin_inquiry_content.mdo?inq_seq=" + seq; }
	 * 
	 * // 댓글 수정
	 * 
	 * @RequestMapping("/updateReply.mdo") public String updateReply(ReplyVO
	 * rvo, @RequestParam("re_content_up") String re_content) { int seq =
	 * rvo.getInq_seq(); rvo.setRe_content(re_content);
	 * replyService.updateReply(rvo); return
	 * "redirect:/admin_inquiry_content.mdo?inq_seq=" + seq; }
	 */
	
}

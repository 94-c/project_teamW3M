package com.spring.w3m.inquiry.user.controller;

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

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.service.ReplyService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.inquiry.user.vo.ReplyVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.upload.common.AwsS3;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	public AwsS3 awsS3 = AwsS3.getInstance();

	@Autowired
	private ReplyService replyService;

	// 문의사항
	@RequestMapping("/inquiry.do")
	public String getInquiryList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {
		System.out.println("문의사항 리스트");

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = inquiryService.getInquiryListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<InquiryVO> pageList = inquiryService.getPageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("inquiryList", pageList);
		model.addAttribute("cnt", cnt);

		return "list/inquiry";
	}

	// 게시판 글 작성하기(동작)
	@RequestMapping("/inquiry_write.do")
	public String inquiryWrite(InquiryVO vo, Model model, MultipartFile inq_mask) throws Exception {
		InputStream ism = inq_mask.getInputStream();
		String maskKey = inq_mask.getOriginalFilename();
		System.out.println(maskKey);
		String contentType = inq_mask.getContentType();
		long contentLength = inq_mask.getSize();
		System.out.println(maskKey);

		if (maskKey == "") {
			vo.setInq_image("파일없음");
		} else {
			String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/inquiry/" + maskKey;
			vo.setInq_image(path);
		}

		awsS3.uploadInquiry(ism, maskKey, contentType, contentLength);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		inquiryService.insertInquiry(vo);
		return "redirect:/inquiry.do";
	}

	// 게시판 글 작성하기(화면)
	@RequestMapping("/inquiry_write_view.do")
	public String inquiryWriteView(ProductVO vo, Model model) {
		System.out.println(vo.getProd_seq());
		model.addAttribute("product", inquiryService.getProduct(vo));
		System.out.println("---");
		System.out.println(vo.getProd_seq());
		return "/list/inquiry_write";
	}

	@RequestMapping("/inquiry_update_view.do")
	public String inquiryUpdateView(InquiryVO vo, Model model) {
		model.addAttribute("getInquiry", inquiryService.getInquiry(vo));
		return "/list/inquiry_update";
	}

	// 게시글 목록 보기
	@RequestMapping("/getInquiryList.do")
	public String getInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "list/inquiry";
	}

	// 게시글 상세 보기
	@RequestMapping("/inquiryContent.do")
	public String getInquiry(InquiryVO vo, Model model) {
		System.out.println("글 상세보기 처리");
		model.addAttribute("inquiryVO", inquiryService.getInquiry(vo));

		List<ReplyVO> replyList = replyService.getReplyList(vo.getInq_seq());
		model.addAttribute("replyList", replyList);

		return "list/inquiryContent";
	}

	// 게시글 수정 하기
	@RequestMapping("/updateInquiry.do")
	public String updateInquiry(InquiryVO vo, Model model) {
		inquiryService.updateInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "/list/inquiry";
	}

	// 게시글 삭제 하기
	@RequestMapping("/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo, Model model) {
		inquiryService.deleteInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "redirect:/inquiry.do";
	}

	// 문의사항 리스트
	@RequestMapping("/adminInquiry.mdo")
	public String adminInquiry(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {
		System.out.println("문의사항 리스트");

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = inquiryService.getInquiryListCnt(search);

		search.pageInfo(page, range, cnt);

		// Pagination
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<InquiryVO> pageList = inquiryService.getPageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("inquiryList", pageList);
		model.addAttribute("cnt", cnt);

		return "page/inquiry/adminInquiry";
	}

	// 관리자 문의사항 상세보기
	@RequestMapping("/admin_inquiry_content.mdo")
	public String getAdminInquiry(InquiryVO vo, Model model) {
		model.addAttribute("inquiryVO", inquiryService.getInquiry(vo));

		// 댓글 조회
		List<ReplyVO> replyList = replyService.getReplyList(vo.getInq_seq());
		model.addAttribute("replyList", replyList);

		return "page/inquiry/admin_inquiry_content";
	}

	// 관리자 문의사항 삭제
	@RequestMapping("/deleteInquiry.mdo")
	public String deleteAdminInquiry(InquiryVO vo, Model model) {
		inquiryService.deleteInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "redirect:/adminInquiry.mdo";
	}

	// 댓글 쓰기
	@RequestMapping("/insertReply.mdo")
	public String insetReply(ReplyVO rvo, @RequestParam("reply_text") String re_content) {
		rvo.setRe_content(re_content);
		replyService.insertReply(rvo);
		return "redirect:/admin_inquiry_content.mdo?inq_seq=" + rvo.getInq_seq();
	}

	// 댓글 삭제
	@RequestMapping("/deleteReply.mdo")
	public String deleteReply(ReplyVO rvo) {
		int seq = rvo.getInq_seq();
		replyService.deleteReply(rvo);
		return "redirect:/admin_inquiry_content.mdo?inq_seq=" + seq;
	}

	// 댓글 수정
	@RequestMapping("/updateReply.mdo")
	public String updateReply(ReplyVO rvo, @RequestParam("re_content_up") String re_content) {
		int seq = rvo.getInq_seq();
		rvo.setRe_content(re_content);
		replyService.updateReply(rvo);
		return "redirect:/admin_inquiry_content.mdo?inq_seq=" + seq;
	}

}

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
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.upload.user.AwsS3;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	public AwsS3 awsS3 = AwsS3.getInstance();
	
	// 문의사항
		@RequestMapping("/inquiry.do")
		public String getBoardList(InquiryVO vo, Model model) {
			System.out.println("---문의사항---");
			model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));		
			return "list/inquiry";
		}

	// 게시판 글 작성하기(동작)
	@RequestMapping("/inquiry_write.do")
	public String inquiryWrite(InquiryVO vo, Model model, MultipartFile inq_mask) throws IOException {
		
		InputStream ism = inq_mask.getInputStream();
		String maskKey = inq_mask.getOriginalFilename();
		System.out.println(maskKey);
		String contentType = inq_mask.getContentType();
		long contentLength = inq_mask.getSize();
		
		String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/" + maskKey; 
		
		System.out.println("이미지 올라가라 제발 디비");
		vo.setInq_image(path);
		System.out.println("가만안둬 피바다....");
		System.out.println(path);
		System.out.println(vo.getInq_image());
		awsS3.upload(ism, maskKey, contentType, contentLength);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		inquiryService.insertInquiry(vo);
		return "redirect:/inquiry.do";
	}
	
	// 게시판 글 작성하기(화면)
	@RequestMapping("/inquiry_write_view.do")
	public String inquiryWriteView(InquiryVO vo, Model model) {
		model.addAttribute("getInquiry", inquiryService.getInquiry(vo));
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
		return "/list/inquiry";
	}
	
	// 문의사항 리스트
	@RequestMapping("/adminInquiry.mdo")
	public String adminInquiry(Model model, @RequestParam(required=false, defaultValue="1") int page,
											@RequestParam(required=false, defaultValue="1") int range,
											@RequestParam(required=false, defaultValue="title") String searchType,
											@RequestParam(required=false) String keyword) throws PSQLException, IOException{
		System.out.println("문의사항 리스트");
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int cnt  = inquiryService.getInquiryListCnt(search);
		
		search.pageInfo(page, range, cnt);
		
		//Pagination
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
		return "page/inquiry/admin_inquiry_content";
	}
	
	// 관리자 문의사항 삭제
	@RequestMapping("/deleteInquiry.mdo")
	public String deleteAdminInquiry(InquiryVO vo, Model model) {
		inquiryService.deleteInquiry(vo);
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "page/inquiry/adminInquiry";
	}

	/*
	// 파일업로드
	@RequestMapping("/testUpload.do")
    public String requestupload2(MultipartFile mask_image) throws Exception {
		InputStream ism = mask_image.getInputStream();
		String maskKey = mask_image.getOriginalFilename();
		String contentType = mask_image.getContentType();
		long contentLength = mask_image.getSize();
		
		awsS3.upload(ism, maskKey, contentType, contentLength);
		
		
		return "list/inquiry";
	}
*/
}
	


package com.spring.w3m.notice.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.w3m.notice.admin.service.NoticeService;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.notice.admin.vo.TosVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/getUserNotice.do")
	public String getUserNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getUserNotice(vo));
		return "list/noticeContent";
	}

	@RequestMapping("/getUserNoticeList.do")
	public String getUserBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = noticeService.getNoticeListCnt(search);

		search.pageInfo(page, range, cnt);

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<NoticeVO> pageList = noticeService.getNoticePageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("NoticeList", pageList);
		model.addAttribute("cnt", cnt);

		System.out.println(search.getKeyword());

		return "list/notice";
	}

	@RequestMapping("/search.do")
	public String getUserNoticeSearchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Pagination pagination = new Pagination();
		int cnt = noticeService.getNoticeSearchCnt(keyword);
		System.out.println("cont Cnt : " + cnt);
		System.out.println(page);
		System.out.println(range);
		System.out.println(keyword);
		pagination.pageInfo(page, range, cnt, keyword);

		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);

		List<NoticeVO> pageList = noticeService.getUserNoticeSearchPagingList(pagination);

		System.out.println("cont List " + pagination.getSearchType());
		System.out.println("cont List " + pagination.getKeyword());

		model.addAttribute("pagination", pagination);
		model.addAttribute("NoticeList", pageList);

		return "list/notice";
	}

	// 공지 사항
	@RequestMapping("/admin_notice_list.mdo")
	public String getNoticeList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		int cnt = noticeService.getNoticeListCnt(search);

		search.pageInfo(page, range, cnt);

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);

		List<NoticeVO> pageList = noticeService.getNoticePageList(search);

		model.addAttribute("pagination", search);
		model.addAttribute("NoticeList", pageList);
		model.addAttribute("cnt", cnt);

		System.out.println(search.getKeyword());

		return "page/notice/admin_notice_list";
	}

	@RequestMapping("/admin_search_notice_list.mdo")
	public String getNoticeSearchPagingList(Model model, NoticeVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword) throws PSQLException, IOException {

		Pagination pagination = new Pagination();
		int cnt = noticeService.getNoticeSearchCnt(keyword);
		System.out.println("cont Cnt : " + cnt);
		System.out.println(page);
		System.out.println(range);
		System.out.println(keyword);
		pagination.pageInfo(page, range, cnt, keyword);

		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);

		List<NoticeVO> pageList = noticeService.getNoticeSearchPagingList(pagination);

		System.out.println("cont List " + pagination.getSearchType());
		System.out.println("cont List " + pagination.getKeyword());

		model.addAttribute("pagination", pagination);
		model.addAttribute("NoticeList", pageList);

		return "page/notice/admin_notice_list";
	}

	// 공지사항 등록
	@RequestMapping("/admin_notice_insert.mdo")
	public String admin_notice_insert(NoticeVO vo, Model model) {
		System.out.println("공지사항 등록 실행");
		noticeService.admin_notice_insert(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 등록 뷰 이동
	@RequestMapping("/admin_notice_insert_view.mdo")
	public String admin_notice_insert_view(NoticeVO vo, Model model) {
		model.addAttribute("getNotice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_insert_view";
	}

	// 공지사항 업데이트
	@RequestMapping("/admin_notice_update.mdo")
	public String admin_notice_update(NoticeVO vo, Model model) {
		noticeService.admin_notice_update(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 업데이트 뷰 이동
	@RequestMapping("/admin_notice_update_view.mdo")
	public String admin_notice_update_View(NoticeVO vo, Model model) {
		model.addAttribute("getNotice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_update_view";
	}

	// 공지사항 삭제
	@RequestMapping("/admin_notice_delete.mdo")
	public String admin_notice_delete(NoticeVO vo, Model model) {
		noticeService.admin_notice_delete(vo);
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "redirect:/admin_notice_list.mdo";
	}

	// 공지사항 상세보기
	@RequestMapping("/admin_notice_content.mdo")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "page/notice/admin_notice_content";
	}

	@RequestMapping("/tos_content.mdo")
	public String getTos(TosVO vo, Model model) {
		model.addAttribute("tos", noticeService.getTos(vo));
		return "page/notice/tos";
	}

	@RequestMapping("/tos_update_view.mdo")
	public String tos_update_view(TosVO vo, Model model) {
		model.addAttribute("tos", noticeService.getTos(vo));
		return "page/notice/tosUpdate";
	}

	@RequestMapping("/tosUpdate.mdo")
	public String tosUpdate(TosVO vo, Model model) {
		noticeService.tosUpdate(vo);
		model.addAttribute("tos", noticeService.getTos(vo));
		return "redirect:/tos_content.mdo";
	}
	
	@RequestMapping(value = "/excelDown.do")
	public void excelDown(HttpServletResponse response) throws Exception {

	    // 게시판 목록조회
	    List<NoticeVO> list = noticeService.getNoticeListExcel();
	    
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("매출통계");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);



	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("제목");
	    
	    
	    for(int i=2; i<=2; i++) {
	    	sheet.autoSizeColumn(i);
	    	sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)12000);
	    }
	    

	    // 데이터 부분 생성
	    for(NoticeVO vo : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getNt_seq());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getNt_writer());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getNt_title());
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    String file_name = "매출통계";
	    file_name = java.net.URLEncoder.encode(file_name, "UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+file_name + ".xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}

}
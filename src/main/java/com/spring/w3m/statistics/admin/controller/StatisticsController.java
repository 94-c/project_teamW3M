package com.spring.w3m.statistics.admin.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.spring.w3m.statistics.admin.service.StatisticsService;
import com.spring.w3m.statistics.admin.vo.StatisticsVO;

@Controller
public class StatisticsController {

	@Autowired
	StatisticsService service;

	@RequestMapping("/admin_Sales.mdo")
	public String adminSales(HttpSession session, StatisticsVO vo) {
		if (session.getAttribute("dateSeach") == null) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -12);
			Calendar ca2 = Calendar.getInstance();
			ca2.add(Calendar.DATE, +1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 데이터 포맷 지정

			Date today = cal.getTime();
			Date ttoday = ca2.getTime();
			String strStartDate = simpleDateFormat.format(today); // 지정한 포맷으로 변환
			String strEndDate = simpleDateFormat.format(ttoday); // 지정한 포맷으로 변환

			vo.setStartDate(today);
			vo.setEndDate(ttoday);
			List<StatisticsVO> vo1 = service.salesByMonth(vo);
			List<StatisticsVO> vo2 = service.salesByCategory(vo);

			session.setAttribute("salesByCategory", vo2);
			session.setAttribute("dateSeach", vo1);
			session.setAttribute("strStartDate", strStartDate);
			session.setAttribute("strEndDate", strEndDate);
		}
		return "page/statistics/admin_Sales";
	}

	@RequestMapping(value = "/seach.mdo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public int seach(@RequestBody StatisticsVO vo, HttpSession session) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 데이터 포맷 지정
		String strStartDate = simpleDateFormat.format(vo.getStartDate()); // 지정한 포맷으로 변환
		String strEndDate = simpleDateFormat.format(vo.getEndDate()); // 지정한 포맷으로 변환

		List<StatisticsVO> vo1 = service.salesByMonth(vo);

		session.setAttribute("dateSeach", vo1);
		session.setAttribute("strStartDate", strStartDate);
		session.setAttribute("strEndDate", strEndDate);
		int aa = 0;

		if (vo1.isEmpty()) {
			aa = -1;
		} else {
			aa = 1;
		}
		return aa;
	}

	@RequestMapping("/admin_Product_Sales.mdo")
	public String adminProductSales(HttpSession session) {
		List<StatisticsVO> vo = service.Gender_Money();
		List<StatisticsVO> vo_level = service.salesByLevel();
		List<StatisticsVO> vo_top = service.salesByTOP();
		List<StatisticsVO> vo_bottom = service.salesByBOTTOM();
		session.setAttribute("Gender_Money", vo);
		session.setAttribute("salesByLevel", vo_level);
		session.setAttribute("salesByTOP", vo_top);
		session.setAttribute("salesByBOTTOM", vo_bottom);
		return "page/statistics/admin_Product_Sales";
	}

	@RequestMapping(value = "/excelDown.mdo", method = { RequestMethod.POST, RequestMethod.GET })
	public void excelDown(@RequestParam("startDate1") String startDate1, @RequestParam("endDate1") String endDate1,
			StatisticsVO vo, HttpServletResponse response) throws Exception {

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date to1 = transFormat.parse(startDate1);
		Date to2 = transFormat.parse(endDate1);

		vo.setStartDate(to1);
		vo.setEndDate(to2);
		// 게시판 목록조회
		List<StatisticsVO> list = service.getExceldata(vo);

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("매출통계");
		sheet.setAutoFilter(new CellRangeAddress(0, 3, 0, 8));
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
		cell.setCellValue("주문날짜");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문번호");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("아이디");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("제품코드");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품명");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품개수");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("사용 포인트");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("결제금액");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("결제 방식");

		sheet.autoSizeColumn(0);
		sheet.setColumnWidth(0, (sheet.getColumnWidth(0)) + (short) +1500);

		sheet.autoSizeColumn(1);
		sheet.setColumnWidth(1, (sheet.getColumnWidth(1)) + (short) +700);

		sheet.autoSizeColumn(2);
		sheet.setColumnWidth(2, (sheet.getColumnWidth(2)) + (short) +2000);

		sheet.autoSizeColumn(3);
		sheet.setColumnWidth(3, (sheet.getColumnWidth(3)) + (short) +3000);

		sheet.autoSizeColumn(4);
		sheet.setColumnWidth(4, (sheet.getColumnWidth(4)) + (short) +10000);

		sheet.autoSizeColumn(5);
		sheet.setColumnWidth(5, (sheet.getColumnWidth(5)) + (short) +700);

		sheet.autoSizeColumn(6);
		sheet.setColumnWidth(6, (sheet.getColumnWidth(6)) + (short) +1000);

		sheet.autoSizeColumn(7);
		sheet.setColumnWidth(7, (sheet.getColumnWidth(7)) + (short) +1000);

		sheet.autoSizeColumn(8);
		sheet.setColumnWidth(8, (sheet.getColumnWidth(8)) + (short) +1500);

		// 데이터 부분 생성
		for (StatisticsVO vo1 : list) {
			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(transFormat.format(vo1.getOrder_date()));

			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getOrder_seq());

			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getUser_id());

			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getProd_code());

			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getProd_title());

			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getProd_amount());

			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getPay_use_point());

			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getPay_total_money());

			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo1.getPay_tool());
		}
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		String file_name = "매출통계";
		file_name = java.net.URLEncoder.encode(file_name, "UTF-8");
		response.setHeader("Content-Disposition",
				"attachment;filename=" + startDate1 + "~" + endDate1 + file_name + ".xls");
		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

	// PDF 생성
	private Document makePdf(StatisticsVO vo, String fileName, String startDate1, String endDate1,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		Document document = new Document(PageSize.A3, 10, 10, 50, 50);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to1 = transFormat.parse(startDate1);
		Date to2 = transFormat.parse(endDate1);

		vo.setStartDate(to1);
		vo.setEndDate(to2);

		// 검색 조건에 맞는 통계 결과를 가져옵니다.
		List<StatisticsVO> list = service.getExceldata(vo);

		// PDF 생성
		document = new Document();

		response.setHeader("Content-Disposition",
				"attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ".pdf");

		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		writer.setInitialLeading(12.5f);

		document.open();

		// 폰트 설정
		BaseFont baseFont = BaseFont.createFont(
				request.getServletContext().getRealPath("resources/admin_css/NanumGothic.ttf"), BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);
		Font font = new Font(baseFont, 10);

		// 테이블 생성 (column,row)
		PdfPTable table = new PdfPTable(8);

		// 타이틀 설정
		Chunk chunk = new Chunk("W3M 매출현황", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
		Paragraph ph = new Paragraph(chunk);
		ph.setAlignment(Element.ALIGN_CENTER);
		document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)

		document.add(Chunk.NEWLINE);
		document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)

		PdfPCell cell1 = new PdfPCell(new Phrase("주문 날짜", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
		cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)

		PdfPCell cell2 = new PdfPCell(new Phrase("주문 번호", font));
		cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell3 = new PdfPCell(new Phrase("아이디", font));
		cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell4 = new PdfPCell(new Phrase("제품 코드", font));
		cell4.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell5 = new PdfPCell(new Phrase("상품명", font));
		cell5.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell6 = new PdfPCell(new Phrase("상품개수", font));
		cell6.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell7 = new PdfPCell(new Phrase("결제 금액", font));
		cell7.setHorizontalAlignment(Element.ALIGN_CENTER);

		PdfPCell cell8 = new PdfPCell(new Phrase("결제 방식", font));
		cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
		// 테이블에 생성된 셀 삽입
		table.addCell(cell1);
		table.addCell(cell2);
		table.addCell(cell3);
		table.addCell(cell4);
		table.addCell(cell5);
		table.addCell(cell6);
		table.addCell(cell7);
		table.addCell(cell8);

		// 검색 결과 데이터를 삽입
		for (int i = 0; i < list.size(); i++) {
			StatisticsVO vo1 = list.get(i);

			PdfPCell cellOrder_Date = new PdfPCell(new Phrase(transFormat.format(vo1.getOrder_date()), font));
			PdfPCell cellOrder_seq = new PdfPCell(new Phrase(String.valueOf(vo1.getOrder_seq()), font));
			PdfPCell cellUser_id = new PdfPCell(new Phrase(vo1.getUser_id(), font));
			PdfPCell cellProd_code = new PdfPCell(new Phrase(vo1.getProd_code(), font));
			PdfPCell cellProd_title = new PdfPCell(new Phrase(vo1.getProd_title(), font));
			PdfPCell cellProd_amount = new PdfPCell(new Phrase(String.valueOf(vo1.getProd_amount()), font));
			PdfPCell cellPay_total_money = new PdfPCell(new Phrase(String.valueOf(vo1.getPay_total_money()), font));
			PdfPCell cellPay_tool = new PdfPCell(new Phrase(vo1.getPay_tool(), font));

			table.addCell(cellOrder_Date);
			table.addCell(cellOrder_seq);
			table.addCell(cellUser_id);
			table.addCell(cellProd_code);
			table.addCell(cellProd_title);
			table.addCell(cellProd_amount);
			table.addCell(cellPay_total_money);
			table.addCell(cellPay_tool);

		}
		document.add(table);
		document.close();

		return document;
	}

	// 위에서 만들어진 PDF를 다운로드하는 함수
	@RequestMapping(value = "/pdfDownload.mdo")
	public void pdfDownload(@RequestParam("startDate1") String startDate1, @RequestParam("endDate1") String endDate1,
			StatisticsVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파일명 설정
		String fileName = startDate1 + "~" + endDate1 + "매출통계";

		// PDF 생성
		makePdf(vo, fileName, startDate1, endDate1, request, response);
	}

}

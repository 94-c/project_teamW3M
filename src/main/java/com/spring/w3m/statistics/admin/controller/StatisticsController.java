package com.spring.w3m.statistics.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.w3m.statistics.admin.service.StatisticsService;
import com.spring.w3m.statistics.admin.vo.StatisticsVO;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService service;
	
	@RequestMapping("/admin_Sales.mdo")
	public String adminSales(HttpSession session) {
		System.out.println("매출 통계");
		return "page/statistics/admin_Sales";
			
		}
		
	
	@RequestMapping(value="/seach.mdo", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public int seach(@RequestBody StatisticsVO vo,HttpSession session) {
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); //원하는 데이터 포맷 지정 
		

		
		List<StatisticsVO> vo1 = service.salesByMonth(vo);
		for(StatisticsVO svo : vo1) {
			System.out.println(svo.toString());
			String strNowDate = simpleDateFormat.format(svo.getDate_total()); //지정한 포맷으로 변환 
			System.out.println("포맷 지정 후 : " + strNowDate);
		}
		session.setAttribute("dateSeach", vo1);
		int aa=0;
		if(vo1.isEmpty()) {
			aa = -1;
		}else {
			aa= 1;
		}
		return aa;
	}
	
	
	@RequestMapping("/admin_Product_Sales.mdo")
	public String adminProductSales(HttpSession session) {
		System.out.println("상품 통계");
		List<StatisticsVO> vo = service.Gender_Money();
		session.setAttribute("Gender_Money", vo);
		return "page/statistics/admin_Product_Sales";
	}

}

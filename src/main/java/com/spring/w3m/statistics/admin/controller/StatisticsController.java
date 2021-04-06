package com.spring.w3m.statistics.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.w3m.statistics.admin.service.StatisticsService;
import com.spring.w3m.statistics.admin.vo.StatisticsVO;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService service;
	
	@RequestMapping("/admin_Sales.mdo")
	public String adminSales(HttpSession session) {
		System.out.println("매출 통계");
		List<StatisticsVO> vo = service.salesByMonth();
		for(StatisticsVO voo : vo) {
			System.out.println(voo.getTotal_sum());
			System.out.println(voo.getDate_total());
			
		}
		session.setAttribute("adminSales", vo);

		return "page/statistics/admin_Sales";
	}
	@RequestMapping(value="/seach.mdo", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String seach(@RequestBody StatisticsVO vo) {
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		return "aa";
	}
	
	
	@RequestMapping("/admin_Product_Sales.mdo")
	public String adminProductSales(HttpSession session) {
		System.out.println("상품 통계");
		List<StatisticsVO> vo = service.Gender_Money();
		session.setAttribute("Gender_Money", vo);
		return "page/statistics/admin_Product_Sales";
	}

}

package com.spring.w3m.statistics.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {
	
	@RequestMapping("/admin_Sales.mdo")
	public String adminSales() {
		System.out.println("매출 통계");
		return "page/statistics/admin_Sales";
	}
	
	@RequestMapping("/admin_Product_Sales.mdo")
	public String adminProductSales() {
		System.out.println("상품 통계");
		return "page/statistics/admin_Product_Sales";
	}

}

package com.spring.w3m.statistics.admin.service;

import java.util.List;

import com.spring.w3m.statistics.admin.vo.StatisticsVO;

public interface StatisticsService {
	public List<StatisticsVO> Gender_Money();
	public List<StatisticsVO> salesByLevel();
	public List<StatisticsVO> salesByTOP();
	public List<StatisticsVO> salesByBOTTOM();
	public List<StatisticsVO> salesByCategory(StatisticsVO vo);
	public List<StatisticsVO> salesByMonth(StatisticsVO vo);
	public StatisticsVO todaySales();
	public StatisticsVO todayJoin();
	public StatisticsVO todayProdAmount();
	public StatisticsVO todayCencle();
	public List<StatisticsVO> getExceldata(StatisticsVO vo);
}

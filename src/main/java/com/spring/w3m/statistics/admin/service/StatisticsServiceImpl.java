package com.spring.w3m.statistics.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.statistics.admin.dao.StatisticsDAO;
import com.spring.w3m.statistics.admin.vo.StatisticsVO;
@Service
public class StatisticsServiceImpl implements StatisticsService{

	@Autowired
	private StatisticsDAO dao;
	
	@Override
	public List<StatisticsVO> Gender_Money() {
		
		return dao.Gender_Money();
	}

	@Override
	public List<StatisticsVO> salesByMonth(StatisticsVO vo) {
		
		return dao.salesByMonth(vo);
	}

	@Override
	public StatisticsVO todaySales() {
		
		return dao.todaySales();
	}

	@Override
	public StatisticsVO todayJoin() {
		return dao.todayJoin();
	}

	@Override
	public StatisticsVO todayProdAmount() {
		return dao.todayProdAmount();
	}

	@Override
	public StatisticsVO todayCencle() {
		return dao.todayCencle();
	}

	@Override
	public List<StatisticsVO> getExceldata(StatisticsVO vo) {
		return dao.getExceldata(vo);
	}
	
}

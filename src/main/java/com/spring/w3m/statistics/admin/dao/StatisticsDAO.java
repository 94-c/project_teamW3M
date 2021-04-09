package com.spring.w3m.statistics.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.statistics.admin.vo.StatisticsVO;

@Service
public class StatisticsDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<StatisticsVO> Gender_Money() {
		
		return sqlSessionTemplate.selectList("StatisticsDAO.salesByGender");
	}

	public List<StatisticsVO> salesByMonth(StatisticsVO vo) {
		
		return sqlSessionTemplate.selectList("StatisticsDAO.salesByMonth",vo);
	}

	public StatisticsVO todaySales() {
		
		return sqlSessionTemplate.selectOne("StatisticsDAO.todaySales");
	}

	public StatisticsVO todayJoin() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.todayJoin");
	}

	public StatisticsVO todayProdAmount() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.todayProdAmount");
	}

	public StatisticsVO todayCencle() {
		return sqlSessionTemplate.selectOne("StatisticsDAO.todayCencle");
	}
	
	public List<StatisticsVO> getExceldata(StatisticsVO vo){
		return sqlSessionTemplate.selectList("StatisticsDAO.getExceldata",vo);
	}

	public List<StatisticsVO> salesByLevel() {
		return sqlSessionTemplate.selectList("StatisticsDAO.salesByLevel");
	}

	public List<StatisticsVO> salesByTOP() {
		return sqlSessionTemplate.selectList("StatisticsDAO.salesByTOP");
	}

	public List<StatisticsVO> salesByBOTTOM() {
		return sqlSessionTemplate.selectList("StatisticsDAO.salesByBOTTOM");
	}

	public List<StatisticsVO> salesByCategory(StatisticsVO vo) {

		return sqlSessionTemplate.selectList("StatisticsDAO.salesByCategory",vo);
	}

}

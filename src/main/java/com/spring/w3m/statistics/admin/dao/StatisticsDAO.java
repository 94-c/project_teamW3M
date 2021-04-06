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
		
		return sqlSessionTemplate.selectList("StatisDAO.Gender_Money");
	}

}

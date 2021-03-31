package com.spring.w3m.point.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.vo.PointVO;

@Repository
public class PointDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertPoint(PointVO vo) {
		sqlSessionTemplate.insert("PointDAO.insertPoint", vo);
	}
	
	public void deletePoint(PointVO vo) {
		sqlSessionTemplate.delete("PointDAO.deletePoint", vo);
	}
	
	public int getPointListCnt(Search search) {
		System.out.println("getPointListCnt() 실행");
		return sqlSessionTemplate.selectOne("PointDAO.getPointListCnt");
	}

	public List<PointVO> getPointPageList(Search search) {
		System.out.println("getPointPageList() 실행");
		return sqlSessionTemplate.selectList("PointDAO.getPointList", search);
	}
}

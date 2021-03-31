package com.spring.w3m.point.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.dao.PointDAO;
import com.spring.w3m.point.user.vo.PointVO;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDAO dao;
	
	@Override
	public void insertPoint(PointVO vo) {
		dao.insertPoint(vo);
	}

	@Override
	public void deletePoint(PointVO vo) {
		dao.deletePoint(vo);
	}

	@Override
	public int getPointListCnt(Search search) {
		return dao.getPointListCnt(search);
	}

	@Override
	public List<PointVO> getPointPageList(Search search) {
		return dao.getPointPageList(search);
	}

}

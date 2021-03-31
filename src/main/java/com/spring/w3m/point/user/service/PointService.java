package com.spring.w3m.point.user.service;

import java.util.List;

import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.vo.PointVO;

public interface PointService {
	
	void insertPoint(PointVO vo);
	
	void deletePoint(PointVO vo);
	
	int getPointListCnt(Search search);

	List<PointVO> getPointPageList(Search search);
}

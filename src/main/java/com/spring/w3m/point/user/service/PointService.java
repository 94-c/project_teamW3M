package com.spring.w3m.point.user.service;

import java.util.List;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.PayVO;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.point.user.vo.PointVO;

public interface PointService {

	void insertPoint(PointVO vo);

	void deletePoint(PointVO vo);

	int getPointListCnt(Search search);

	List<PointVO> getPointPageList(Search search);

	PayVO getPayList(PayVO vo);

	void plusPoint(PointVO vo);

	void minusPoint(PointVO vo);

	public int orderSuccessPoint(DeliveryVO vo);

	public int orderDeletePoint(DeliveryVO vo);

	public int update_point(String user_id);
}

package com.spring.w3m.point.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.PayVO;
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

	@Override
	public PayVO getPayList(PayVO vo) {
		return dao.getPayList(vo);
	}

	@Override
	public void plusPoint(PointVO vo) {
		dao.plusPoint(vo);
	}

	@Override
	public void minusPoint(PointVO vo) {
		dao.minusPoint(vo);
	}

	@Override
	public int orderSuccessPoint(DeliveryVO vo) {

		return dao.orderSuccessPoint(vo);
	}

	@Override
	public int orderDeletePoint(DeliveryVO vo) {

		return dao.orderDeletePoint(vo);
	}

	@Override
	public int update_point(String user_id) {

		return dao.update_point(user_id);
	}

}

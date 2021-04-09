package com.spring.w3m.point.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.delivery.common.vo.DeliveryVO;
import com.spring.w3m.order.user.vo.PayVO;
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
		return sqlSessionTemplate.selectOne("PointDAO.getPointListCnt");
	}

	public List<PointVO> getPointPageList(Search search) {
		return sqlSessionTemplate.selectList("PointDAO.getPointList", search);
	}

	public PayVO getPayList(PayVO vo) {
		return sqlSessionTemplate.selectOne("PointDAO.getPayList", vo);
	}

	public void plusPoint(PointVO vo) {
		sqlSessionTemplate.update("PointDAO.plusPoint", vo);
	}

	public void minusPoint(PointVO vo) {
		sqlSessionTemplate.update("PointDAO.minusPoint", vo);
	}

	public int orderSuccessPoint(DeliveryVO vo) {

		return sqlSessionTemplate.update("PointDAO.orderSuccessPoint", vo);
	}

	public int orderDeletePoint(DeliveryVO vo) {

		return sqlSessionTemplate.delete("PointDAO.orderDeletePoint", vo);
	}

	public int update_point(String user_id) {

		return sqlSessionTemplate.update("PointDAO.update_point", user_id);
	}
}

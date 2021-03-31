package com.spring.w3m.delivery.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.delivery.common.vo.DeliveryVO;

@Repository
public class DeliveryDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<DeliveryVO> getDeliveryList(DeliveryVO vo){
		
		return template.selectList("delivery.getDeliveryList", vo);
	}
	
	public void updateDeliveryState(DeliveryVO vo) {
		template.update("delivery.updateDeliveryState", vo);
	}
	
	
}

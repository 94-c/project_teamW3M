package com.spring.w3m.delivery.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.delivery.common.dao.DeliveryDAO;
import com.spring.w3m.delivery.common.vo.DeliveryVO;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	@Autowired
	private DeliveryDAO dao;
	
	@Override
	public List<DeliveryVO> getDeliveryList(DeliveryVO vo){
		
		return dao.getDeliveryList(vo);
	}
	
	@Override
	public void updateDeliveryState(DeliveryVO vo) {
		if(vo.getDel_state().equals("before")) {
			vo.setDelivery_state("배송전");
		}else if(vo.getDel_state().equals("ing")) {
			vo.setDelivery_state("배송중");
		}else if(vo.getDel_state().equals("after")) {
			vo.setDelivery_state("배송완료");
		}else {
			vo.setDelivery_state("주문취소");
		}			
		dao.updateDeliveryState(vo);
	}
	
	
}

package com.spring.w3m.delivery.common.service;

import java.util.List;

import com.spring.w3m.delivery.common.vo.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> getDeliveryList(DeliveryVO vo);
	
	public void updateDeliveryState(DeliveryVO vo);

}

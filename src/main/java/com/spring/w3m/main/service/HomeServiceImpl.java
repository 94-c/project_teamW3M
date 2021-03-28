package com.spring.w3m.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.main.dao.HomeDAO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Service("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDAO dao;

	@Override
	public List<ProductVO> selectProduct(ProductVO vo) {
		System.out.println("Impl 실행");
		return dao.selectProduct(vo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("Impl 실행");
		return dao.getProduct(vo);
	}

}

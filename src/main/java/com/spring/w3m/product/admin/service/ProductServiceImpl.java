package com.spring.w3m.product.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.product.admin.dao.ProductDAO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO  dao;
	
	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
	
}

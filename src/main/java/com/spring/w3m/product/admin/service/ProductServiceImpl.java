package com.spring.w3m.product.admin.service;

import java.util.List;

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

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		
		return dao.getProductList(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		dao.deleteProduct(vo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		
		return dao.getProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}
	
}

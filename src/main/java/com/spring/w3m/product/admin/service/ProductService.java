package com.spring.w3m.product.admin.service;

import java.util.List;

import com.spring.w3m.product.admin.vo.ProductVO;

public interface ProductService {
	void insertProduct(ProductVO vo);
	
	ProductVO getProduct(ProductVO vo);
	
	void deleteProduct(ProductVO vo);
	
	List<ProductVO> getProductList(ProductVO vo);
}

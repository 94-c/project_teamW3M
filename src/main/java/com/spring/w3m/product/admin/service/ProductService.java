package com.spring.w3m.product.admin.service;

import java.util.List;

import com.spring.w3m.product.admin.vo.ProductVO;

public interface ProductService {
	List<ProductVO> getProductList(ProductVO vo);
	
	ProductVO getProduct(ProductVO vo);
	
	void insertProduct(ProductVO vo);	
	
	void updateProduct(ProductVO vo);
	
	void deleteProduct(ProductVO vo);
	
}

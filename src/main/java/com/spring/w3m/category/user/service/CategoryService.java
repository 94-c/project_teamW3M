package com.spring.w3m.category.user.service;

import java.util.List;

import com.spring.w3m.product.admin.vo.ProductVO;

public interface CategoryService {

	public List<ProductVO> classify1(ProductVO vo);
	
	public List<ProductVO> classify2(ProductVO vo);
	
	public List<ProductVO> category(ProductVO vo);
}

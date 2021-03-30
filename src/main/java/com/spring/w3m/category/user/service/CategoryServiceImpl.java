package com.spring.w3m.category.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.category.user.dao.CategoryDAO;
import com.spring.w3m.product.admin.vo.ProductVO;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;

	@Override
	public List<ProductVO> classify1(ProductVO vo) {
		return dao.classify1(vo);
	}

	@Override
	public List<ProductVO> classify2(ProductVO vo) {
		return dao.classify2(vo);
	}
	
	@Override
	public List<ProductVO> category(ProductVO vo) {
		List<ProductVO> productList = null;
		
		if (vo.getProd_category1() != null && vo.getProd_category2() == null) {
			productList = dao.classify1(vo);
			return productList;
			
		} else if (vo.getProd_category1() != null && vo.getProd_category2() != null) {
			productList = dao.classify2(vo);			
			return productList;
			
		} else {			
			return productList;
		}

	}// end category
	
}

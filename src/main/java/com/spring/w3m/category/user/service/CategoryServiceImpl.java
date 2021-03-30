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
		
		if (vo.getProd_category1() != null && vo.getProd_category2() == null) { //카테고리 1단계 값만 있을 경우
			productList = dao.classify1(vo);			
			return productList;
			
		} else if (vo.getProd_category1() != null && vo.getProd_category2() != null) { //카테고리 1단계&2단계 값이 있을 경우
			productList = dao.classify2(vo);			
			return productList;
			
		} else {			
			return productList;
		}

	}// end category
	
	public String getName(List<ProductVO> productList) {
		if (productList.get(0).getProd_category1().equals("MM")) {
			if (productList.get(0).getProd_category2().equals("P")) {
				return "프리미엄 미세먼지마스크";
			} else if (productList.get(0).getProd_category2().equals("N")) {
				return "일반 미세먼지마스크";
			} else if (productList.get(0).getProd_category2().equals("B")) {
				return "블랙 미세먼지마스크";
			}
			return "W3M 미세먼지마스크";
		} else if (productList.get(0).getProd_category1().equals("BB")) {
			if (productList.get(0).getProd_category2().equals("N")) {
				return "일반 비말차단마스크";
			}
			return "W3M 비말차단마스크";
		} else if (productList.get(0).getProd_category1().equals("SS")) {
			if (productList.get(0).getProd_category2().equals("N")) {
				return "일반 손소독제";
			}
			return "W3M 손소독제";
		} else {
			return "카테고리 없음";
		}
	}//end getName
	
}

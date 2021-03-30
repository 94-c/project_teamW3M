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
	
	@Override
	public String getName(ProductVO vo) { //상품이름 얻어오는 메서드

		if (vo.getProd_category1() != null && vo.getProd_category2() == null) { // 카테고리 1단계 값만 있을 경우
			if (vo.getProd_category1().equals("MM")) {
				return "W3M 미세먼지마스크";
			} else if (vo.getProd_category1().equals("BB")) {
				return "W3M 비말차단마스크";
			} else if (vo.getProd_category1().equals("SS")) {
				return "W3M 손소독제";
			} else {
				return "해당사항 없음";
			}

		} else if (vo.getProd_category1() != null && vo.getProd_category2() != null) { // 카테고리 1단계&2단계 값이 있을 경우
			if (vo.getProd_category1().equals("MM")) {
				if (vo.getProd_category2().equals("P")) {
					return "프리미엄 미세먼지마스크";
				} else if (vo.getProd_category2().equals("N")) {
					return "일반 미세먼지마스크";
				} else if (vo.getProd_category2().equals("B")) {
					return "블랙 미세먼지마스크";
				}
			} else if (vo.getProd_category1().equals("BB")) {
				if (vo.getProd_category2().equals("N")) {
					return "일반 비말차단마스크";
				}
			} else if (vo.getProd_category1().equals("SS")) {
				if (vo.getProd_category2().equals("N")) {
					return "일반 손소독제";
				}
			} else {
				return "해당사항 없음";
			}

		} else {
			return "해당사항 없음";
		}
		return "해당사항 없음";

	}// end getName

	@Override
	public int productCount(ProductVO vo) {
		if (vo.getProd_category1() != null && vo.getProd_category2() == null) { // 카테고리 1단계 값만 있을 경우
			return dao.category1Count(vo);
		} else if (vo.getProd_category1() != null && vo.getProd_category2() != null) { // 카테고리 1단계&2단계 값이 있을 경우
			return dao.category2Count(vo);
		} else {
			return -1; //비정상
		}
	}
	
	@Override
	public int branchCount(ProductVO vo) {
		return dao.branchCount(vo);
	}
	
	@Override
	public int MMP_cnt(ProductVO vo) {
		return dao.MMP_cnt(vo);
	}
	@Override
	public int MMN_cnt(ProductVO vo) {
		return dao.MMN_cnt(vo);
	}
	@Override
	public int MMB_cnt(ProductVO vo) {
		return dao.MMB_cnt(vo);
	}
	@Override
	public int BBN_cnt(ProductVO vo) {
		return dao.BBN_cnt(vo);
	}
	@Override
	public int SSN_cnt(ProductVO vo) {
		return dao.SSN_cnt(vo);
	}
	
}

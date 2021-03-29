package com.spring.w3m.category.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.product.admin.vo.ProductVO;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<ProductVO> classify1(ProductVO vo){
		return template.selectList("category.classify1", vo);		
	}
	
	public List<ProductVO> classify2(ProductVO vo){
		return template.selectList("category.classify2", vo);		
	}
	
	
}

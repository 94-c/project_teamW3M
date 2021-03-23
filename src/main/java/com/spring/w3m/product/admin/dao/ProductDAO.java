package com.spring.w3m.product.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.product.admin.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertProduct(ProductVO vo) {
		template.insert("product.insert", vo);
	}
	
}	

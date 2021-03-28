package com.spring.w3m.product.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.product.admin.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<ProductVO> getProductList(ProductVO vo){
		return template.selectList("product.getProductList", vo);
	}
	
	public ProductVO getProduct(ProductVO vo) {		
		return template.selectOne("product.getProduct", vo);
	}
	
	public void deleteProduct(ProductVO vo) {
		template.delete("product.delete", vo);
	}
	
	public void insertProduct(ProductVO vo) {
		template.insert("product.insert", vo);
	}	
	
	public void updateProduct(ProductVO vo) {
		template.update("product.update", vo);
	}	
	
}	

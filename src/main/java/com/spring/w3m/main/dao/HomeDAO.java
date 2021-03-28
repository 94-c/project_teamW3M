package com.spring.w3m.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.product.admin.vo.ProductVO;

@Repository
public class HomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ProductVO> selectProduct(ProductVO vo) {
		System.out.println("DAO 실행");
		return sqlSessionTemplate.selectList("HomeDAO.selectProduct", vo);
	}

	public ProductVO getProduct(ProductVO vo) {
		System.out.println("DAO 실행");
		return sqlSessionTemplate.selectOne("HomeDAO.getProduct", vo);
	}
}

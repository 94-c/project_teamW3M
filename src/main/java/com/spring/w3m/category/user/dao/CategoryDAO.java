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
	
	public int category1Count(ProductVO vo) {
		return template.selectOne("category.category1_cnt", vo);
	}
	
	public int category2Count(ProductVO vo) {
		return template.selectOne("category.category2_cnt", vo);
	}
	
	public int branchCount(ProductVO vo) {
		return template.selectOne("category.branch_cnt", vo);
	}
	
	public int MMP_cnt(ProductVO vo) {
		return template.selectOne("category.MMP_cnt", vo);
	}
	public int MMN_cnt(ProductVO vo) {
		return template.selectOne("category.MMN_cnt", vo);
	}
	public int MMB_cnt(ProductVO vo) {
		return template.selectOne("category.MMB_cnt", vo);
	}
	public int BBN_cnt(ProductVO vo) {
		return template.selectOne("category.BBN_cnt", vo);
	}
	public int SSN_cnt(ProductVO vo) {
		return template.selectOne("category.SSN_cnt", vo);
	}
}

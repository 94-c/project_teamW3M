package com.spring.w3m.category.user.service;

import java.util.List;

import com.spring.w3m.product.admin.vo.ProductVO;

public interface CategoryService {

	public List<ProductVO> classify1(ProductVO vo);
	
	public List<ProductVO> classify2(ProductVO vo);
	
	public List<ProductVO> category(ProductVO vo);
	
	public String getName(ProductVO vo);
	
	public int productCount(ProductVO vo);
	
	public int branchCount(ProductVO vo);
	
	public int MMP_cnt(ProductVO vo);
	public int MMN_cnt(ProductVO vo); 
	public int MMB_cnt(ProductVO vo);
	public int BBN_cnt(ProductVO vo);
	public int SSN_cnt(ProductVO vo);
}

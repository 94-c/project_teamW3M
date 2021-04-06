package com.spring.w3m.product.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate template;

	public List<ProductVO> getProductList(ProductVO vo) {
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

	public void addStock(ProductVO vo) { // 재고추가하기
		template.update("product.addStock", vo);
	}

	// 페이징 및 검색
	public int getProductListCnt(Search search) {
		return template.selectOne("product.getProductListCnt");
	}

	public List<ProductVO> getPageList(Search search) {
		return template.selectList("product.getPageList", search);
	}

	public int getSearchCnt(String searchKeyword) {
		return template.selectOne("product.getSearchKeyword");
	}

	public List<ProductVO> getSearchPagingList(Pagination pagination) {
		return template.selectList("product.getSearchPagingList");
	}
}

package com.spring.w3m.product.admin.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.vo.ProductVO;

public interface ProductService {
	
	List<ProductVO> getProductList(ProductVO vo);
	
	ProductVO getProduct(ProductVO vo);
	
	void insertProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8,
			MultipartFile image9, MultipartFile image10) throws IOException;
	
	void updateProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8,
			MultipartFile image9, MultipartFile image10) throws IOException;
	
	void deleteProduct(ProductVO vo);
	
	//페이징 및 검색
	int getProductListCnt(Search search);
	
	 List<ProductVO> getPageList(Search search);
	 
	 int getSearchCnt(String searchKeyword);
	 
	 List<ProductVO> getSearchPagingList(Pagination pagination);
	
}

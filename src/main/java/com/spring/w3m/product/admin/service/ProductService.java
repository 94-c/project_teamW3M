package com.spring.w3m.product.admin.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.product.admin.vo.ProductVO;

public interface ProductService {
	List<ProductVO> getProductList(ProductVO vo);
	
	ProductVO getProduct(ProductVO vo);
	
	void insertProduct(ProductVO vo, MultipartFile img) throws IOException;	
	
	void updateProduct(ProductVO vo);
	
	void deleteProduct(ProductVO vo);
	
}

package com.spring.w3m.product.admin.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.product.admin.dao.ProductDAO;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.upload.user.AwsS3;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO  dao;
	
	private AwsS3 awsS3 = AwsS3.getInstance();
	
	@Override
	public void insertProduct(ProductVO vo, MultipartFile img) throws IOException {
		InputStream ism = img.getInputStream();
		String fileName = img.getOriginalFilename();
		String contentType = img.getContentType();
		long contentLength = img.getSize();
		
		String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/" + fileName; 
		
		vo.setProd_title_image(path);
		System.out.println(vo.getProd_title_image());
		awsS3.upload(ism, fileName, contentType, contentLength);
		dao.insertProduct(vo);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		
		return dao.getProductList(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		dao.deleteProduct(vo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		
		return dao.getProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}
	
}

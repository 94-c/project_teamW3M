package com.spring.w3m.product.admin.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.product.admin.dao.ProductDAO;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.upload.common.AwsS3;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO  dao;	
	public AwsS3 awsS3 = AwsS3.getInstance();	

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {		
		return dao.getProductList(vo);
	}
	
	@Override
	public ProductVO getProduct(ProductVO vo) {		
		return dao.getProduct(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		dao.deleteProduct(vo);
	}
	
	@Override
	public void insertProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8, MultipartFile image9, 
			MultipartFile image10) throws IOException {
		
			vo.setProd_title_image(thumbUpload(vo, prod_thumb));
//			vo.setProd_image1(singleUpload(image1));
//			vo.setProd_image2(singleUpload(image2));
//			vo.setProd_image3(singleUpload(image3));
//			vo.setProd_image4(singleUpload(image4));
//			vo.setProd_image5(singleUpload(image5));
//			vo.setProd_image6(singleUpload(image6));
//			vo.setProd_image7(singleUpload(image7));
//			vo.setProd_image8(singleUpload(image8));
//			vo.setProd_image9(singleUpload(image9));
//			vo.setProd_image10(singleUpload(image10));
			
			String prod_code = vo.getProd_code(); //상품코드 받아서 카테고리분류하는 작업
			sortCategory(vo, prod_code);
			System.out.println("insert======================="+vo.getProd_title_image());
			dao.insertProduct(vo);
	}
	
	@Override
	public void updateProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8,
			MultipartFile image9, MultipartFile image10) throws IOException {
		
		vo.setProd_title_image(thumbUpload(vo, prod_thumb));
//		vo.setProd_image1(singleUpload(image1));
//		vo.setProd_image2(singleUpload(image2));
//		vo.setProd_image3(singleUpload(image3));
//		vo.setProd_image4(singleUpload(image4));
//		vo.setProd_image5(singleUpload(image5));
//		vo.setProd_image6(singleUpload(image6));
//		vo.setProd_image7(singleUpload(image7));
//		vo.setProd_image8(singleUpload(image8));
//		vo.setProd_image9(singleUpload(image9));
//		vo.setProd_image10(singleUpload(image10));
		
		String prod_code = vo.getProd_code(); //상품코드 받아서 카테고리분류하는 작업
		sortCategory(vo, prod_code);
		System.out.println("update======================="+vo.getProd_title_image());
		dao.updateProduct(vo);
	}
	
	public String thumbUpload(ProductVO vo, MultipartFile file) throws IOException {				
		
			InputStream ism = file.getInputStream();
			String fileName = file.getOriginalFilename();
			String contentType = file.getContentType();
			long contentLength = file.getSize();
			
			awsS3.uploadProduct(ism, fileName, contentType, contentLength); //상품이미지 업로드
			if(fileName == "") {
				System.out.println("if======================="+vo.getProd_title_image());				
				return vo.getProd_title_image();
			}else {
				System.out.println("else======================="+vo.getProd_title_image());
				return "https://imageup.s3.ap-northeast-2.amazonaws.com/product/" + fileName;
			}		
		
	}
	
	public void sortCategory(ProductVO vo, String prod_code) { //카테고리분류작업
		String[] category = prod_code.split("-");
		
		for(int i=0; i<category.length; i++) {			
			vo.setProd_category1(category[i]);			
		}		
	}

}

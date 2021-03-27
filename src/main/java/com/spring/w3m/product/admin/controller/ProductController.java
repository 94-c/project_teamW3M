package com.spring.w3m.product.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.product.admin.service.ProductService;
import com.spring.w3m.product.admin.vo.ProductVO;
import com.spring.w3m.upload.common.AwsS3;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping("/getProductList.mdo") //등록상품 목록보기
	public String getProductList(ProductVO vo, Model model) {
		List<ProductVO> productList = service.getProductList(vo);
		model.addAttribute("productList", productList);
		return "page/product/getProductList";
	}
	
	@RequestMapping("/getProduct.mdo") //등록상품 상세보기
	public String getProduct(ProductVO vo, Model model) {
		ProductVO product = service.getProduct(vo);
		model.addAttribute("product", product);
		return "page/product/getProduct";
	}
	
	@RequestMapping("/insertProductForm.mdo") //상품등록하기 폼
	public String insertProductForm() {
		System.out.println("상품등록 폼으로 이동...");
		return "page/product/insertProduct";
	}
	
	@RequestMapping("/insertProduct.mdo") //상품등록하기
	public String insertProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8, MultipartFile image9, 
			MultipartFile image10) throws IOException{
		
		service.insertProduct(vo, prod_thumb, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10);
		
		return "redirect:/getProductList.mdo";
	}
	
	@RequestMapping("/deleteProduct.mdo") //등록상품 삭제하기
	public String deleteProduct(ProductVO vo) {
		service.deleteProduct(vo);
		return "redirect:/getProductList.mdo";
	}
	
	@RequestMapping("/updateProductForm.mdo") //등록상품 수정폼
	public String updateProductForm(ProductVO vo, Model model) {
		System.out.println("등록상품 수정폼으로 이동...");
		model.addAttribute("product", vo);
		return "page/product/updateProduct";
	}
	
	@RequestMapping("/updateProduct.mdo") //등록상품 수정하기
	public String updateProduct(ProductVO vo, MultipartFile prod_thumb, MultipartFile image1, MultipartFile image2, MultipartFile image3, 
			MultipartFile image4, MultipartFile image5, MultipartFile image6, MultipartFile image7, MultipartFile image8, MultipartFile image9, 
			MultipartFile image10) throws IOException {
//		System.out.println(prod_thumb);
//		InputStream ism = prod_thumb.getInputStream();
//		String fileName = prod_thumb.getOriginalFilename();
//		String contentType = prod_thumb.getContentType();
//		long contentLength = prod_thumb.getSize();
//		
//		awsS3.uploadProduct(ism, fileName, contentType, contentLength); //상품이미지 업로드
//		String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/product/" + fileName;
//		vo.setProd_title_image(path);
//		System.out.println(vo.getProd_title_image());
		
		service.updateProduct(vo, prod_thumb, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10);
		return "redirect:/getProductList.mdo";
	}
	
}

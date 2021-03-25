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
import com.spring.w3m.upload.user.AwsS3;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	public AwsS3 awsS3 = AwsS3.getInstance();
	
	@RequestMapping("/getProductList.mdo")
	public String getProductList(ProductVO vo, Model model) {
		List<ProductVO> productList = service.getProductList(vo);
		model.addAttribute("productList", productList);
		return "page/product/getProductList";
	}
	
	@RequestMapping("/getProduct.mdo")
	public String getProduct(ProductVO vo, Model model) {
		ProductVO product = service.getProduct(vo);
		model.addAttribute("product", product);
		return "page/product/getProduct";
	}
	
	@RequestMapping("/insertProductForm.mdo")
	public String insertProductForm() {
		
		return "page/product/insertProduct";
	}
	
	@RequestMapping("/insertProduct.mdo")
	public String insertProduct(ProductVO vo, MultipartFile prod_thumb) throws IOException{
		InputStream ism = prod_thumb.getInputStream();
		String fileName = prod_thumb.getOriginalFilename();
		String contentType = prod_thumb.getContentType();
		long contentLength = prod_thumb.getSize();
		
		String path = "https://imageup.s3.ap-northeast-2.amazonaws.com/" + fileName; 
		
		vo.setProd_title_image(path);
		System.out.println(vo.getProd_title_image());
		awsS3.upload(ism, fileName, contentType, contentLength);
		service.insertProduct(vo);
		return "redirect:/getProductList.mdo";
	}
	
	@RequestMapping("/deleteProduct.mdo")
	public String deleteProduct(ProductVO vo) {
		service.deleteProduct(vo);
		return "redirect:/getProductList.mdo";
	}
	
	@RequestMapping("/updateProductForm.mdo")
	public String updateProductForm(ProductVO vo, Model model) {
		model.addAttribute("product", vo);
		return "page/product/updateProduct";
	}
	
	@RequestMapping("/updateProduct.mdo")
	public String updateProductForm(ProductVO vo) {
		service.updateProduct(vo);
		return "redirect:/getProductList.mdo";
	}
}

package com.spring.w3m.product.admin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.product.admin.service.ProductService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
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
	public String insertProduct(ProductVO vo, @RequestParam("prod_title_image") MultipartFile img) throws IOException {
		service.insertProduct(vo, img);
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

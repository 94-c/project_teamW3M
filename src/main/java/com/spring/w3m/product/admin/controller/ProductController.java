package com.spring.w3m.product.admin.controller;

import java.io.IOException;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;
import com.spring.w3m.product.admin.service.ProductService;
import com.spring.w3m.product.admin.vo.ProductVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping("/getProductList.mdo") //등록상품 목록보기
	public String getProductList(ProductVO vo, Model model, @RequestParam(required = false, defaultValue = "1")int page,
														   @RequestParam(required = false, defaultValue = "1")int range,
														   @RequestParam(required = false, defaultValue = "title") String searchType,
														   @RequestParam(required = false)String keyword) throws PSQLException, IOException {
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int cnt = service.getProductListCnt(search);

		search.pageInfo(page, range, cnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, cnt);
		
		
		List<ProductVO> productList = service.getPageList(search);
		
		model.addAttribute("pagination", search);
		model.addAttribute("productList", productList);
		model.addAttribute("cnt", cnt);
		
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
		
		service.updateProduct(vo, prod_thumb, image1, image2, image3, image4, image5, image6, image7, image8, image9, image10);
		
		return "redirect:/getProductList.mdo";
	}
	
	@RequestMapping("/addStock.mdo") //재고추가하기
	public String addStock(ProductVO vo) {
		System.out.println("재고추가 버튼 클릭");
		service.addStock(vo);
		return "redirect:/getProductList.mdo";
	}
	
}

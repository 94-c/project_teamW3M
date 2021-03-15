<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/slider.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/main.js" ></script> 

	<!-- 메인 배너 슬라이드 -->
	<div id="wrap">
	<div id="contentWrapper">
		<div class="cboth main_img">
			<div class="sliderkit contentslider-main" style="display: block;">
				<div class="main_img_arrow">
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev">
						<a href="#"></a>
					</div>
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next">
						<a href="#"></a>
					</div>
				</div>
				<div class="sliderkit-nav">
					<div class="sliderkit-nav-clip" style="width: 42px; height: 8px;">
						<ul style="width: 42px;">
							<li class="" style="width: 14px; height: 8px;"><a></a></li>
							<li style="width: 14px; height: 8px;" class="sliderkit-selected"><a></a></li>
							<li style="width: 14px; height: 8px;" class=""><a></a></li>
						</ul>
					</div>
				</div>
				<div class="sliderkit-panels">
					<!-- 메인 배너 스크립트 링크 수정하는곳 -->

					<div class="sliderkit-panel sliderkit-panel-old"
						style="display: block;">
						<a href="/shop/shopbrand.html?type=X&amp;xcode=023">
						<div style="background-image: url(resources/images/m_mask/main_visual_mask.jpg)"></div></a>
					</div>
					<div class="sliderkit-panel sliderkit-panel-active"
						style="display: block; opacity: 0.00640887;">
						<a href="/shop/shopbrand.html?type=X&amp;xcode=026">
						<div style="background-image: url(resources/images/m_mask/main_visual_purell.jpg)"></div></a>
					</div>
					<div class="sliderkit-panel" style="display: block;">
						<a href="http://www.welkeepsmall.com/shop/shopdetail.html?branduid=1007223&amp;xcode=026&amp;mcode=001&amp;scode=&amp;type=X&amp;sort=manual&amp;cur_code=026&amp;GfDT=bm9%2FW1k%3D">
						<div style="background-image: url(resources/images/m_mask/main_visual_wondercheck.jpg)"></div></a>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

	
	<!-- 좌측 2단 배너 -->
	<div class="cboth main_section02">
		<div class="fleft main_ban01">
			<div class="cboth"><a href="notice.do"><IMG SRC="resources/images/m_mask/center_left1.jpg"></a></div>
			<div class="cboth"><a href="#"><IMG SRC="resources/images/m_mask/center_left2.jpg"></a></div>
		</div>
		
	<!-- 중앙 배너 슬라이드  -->
	<div class="fleft">
			<div class="sliderkit contentslider-look">
				<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#none"></a></div>
				<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#none"></a></div>
				<div class="sliderkit-panels">
                        <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center1.jpg"></a></div>
                        <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center2.jpg"></a></div>
                        <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center3.jpg"></a></div>
                    </div>
			</div>
	</div>
	
	<!-- 우측 2단 배너 -->
		<div class="fright main_ban02">
			<div class="cboth"><a href="#"><img src="resources/images/m_mask/center_right1.jpg"></a></div>
	        <div class="cboth"><a href="#"><img src="resources/images/m_mask/center_right2.jpg"></a></div>
		</div>
	</div>
	<!-- //main_section02 -->
	
	
	<div class="cboth main_section03">
		<div class="cboth main_title">웰킵스 마스크 BEST</div>
		<div class="cboth prd-list">
		<table summary="상품이미지, 상품 설명, 가격">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
		<tbody>
				<tr class="nopadding"><td></td><td></td><td></td><td></td></tr>
				<tr>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="list/shopdetail.jsp"><img class="MS_prod_img_m" src="resources/images/m_mask/mask1.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="52400"/>
								<input type="hidden" name="product_price" value="42000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-대형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">52,400원</li>									
								<li class="price">42,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask2.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="51400"/>
								<input type="hidden" name="product_price" value="40000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-소형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">51,400원</li>
								<li class="price">40,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
						<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask3.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="53000"/>
								<input type="hidden" name="product_price" value="42000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-초소형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">53,000원</li>									
								<li class="price">42,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask4.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="53000"/>
								<input type="hidden" name="product_price" value="45000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙황사방역마스크<br>KF94-대형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">53,000원</li>									
								<li class="price">45,000원</li>															
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					</tr>
					
					<tr>
						<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask5.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26200"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,200원</li>
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask6.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26200"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 중형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,200원</li>									
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask7.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="25700"/>
								<input type="hidden" name="product_price" value="21300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 소형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">25,700원</li>									
								<li class="price">21,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask8.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26500"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 초소형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,500원</li>									
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					</tr><tr>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask9.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="24500"/>
								<input type="hidden" name="product_price" value="20000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 미세먼지황사마스크<br>KF80 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">24,500원</li>									
								<li class="price">20,000원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask10.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="24000"/>
								<input type="hidden" name="product_price" value="20000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 미세먼지황사마스크<br>KF80 소형 25개입</li>
								<li class="subname"></li>
								<li class="soldout">SOLD OUT</li>	
								<li class="price">입고 대기중</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask11.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="28700"/>
								<input type="hidden" name="product_price" value="23800"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙 황사마스크 <br>KF94 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">28,700원</li>									
								<li class="price">23,800원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask12.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="28700"/>
								<input type="hidden" name="product_price" value="23800"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙 황사마스크 <br>KF94 중형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">28,700원</li>									
								<li class="price">23,800원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td></tr><tr></tr>
			</tbody>
			</table>
		</div><!-- //prd-list -->
	</div>	
	<!-- //main_section03 -->	

<%@include file="/WEB-INF/views/include/footer.jsp"%>
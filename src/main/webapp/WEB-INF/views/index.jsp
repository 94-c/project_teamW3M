<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>[Well3Mask] W3M 공식쇼핑물</title>

	<!-- 메인 배너 슬라이드 -->
	<div id="wrap">
	<div id="contentWrapper">
		<div class="cboth main_img">
			<div class="sliderkit contentslider-main" style="display: block;">
				<div class="main_img_arrow">
				
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
			<div class="cboth"><a href="getUserNoticeList.do"><IMG SRC="resources/images/m_mask/center_left1.jpg"></a></div>
			<div class="cboth"><a href="https://corona-live.com/"><IMG SRC="resources/images/m_mask/center_left2.jpg"></a></div>
		</div>
		
	<!-- 중앙 배너 슬라이드  -->
	<div class="fleft">
			<div class="sliderkit contentslider-look">
				
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
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach var="product" items="${product }">
				<c:if test="${i%j==0}">
					<tr>
				</c:if>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="/getProduct?prod_code=${product.prod_code }"><img class="MS_prod_img_m" src="${product.prod_title_image }" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="52400"/>
								<input type="hidden" name="product_price" value="42000"/>
							</div>
							<ul class="info">
								<li class="dsc">${product.prod_title }</li>
								<li class="subname"></li>
								<li class="consumer"><fmt:formatNumber value="${product.prod_price}" pattern="#,###" /></li>									
								<li class="price"><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" /></li>
							</ul>
						</div>
						</div>
					</td>
				
				<c:if test="${i%j==j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
				<c:if test="${i == 4 }">
					<c:set var="i" value="0" />
				</c:if>
				</c:forEach>
					
					<tr></tr>
			</tbody>
			</table>
		</div><!-- //prd-list -->
	</div>	
	<!-- //main_section03 -->	

<%@include file="/WEB-INF/views/include/footer.jsp"%>
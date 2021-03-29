<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<title>${msg }</title>

<div id="productClass">
	
	<div class="prd-class-hd">
		<dl class="loc-navi">
			<dt class="blind">현재 위치</dt>
			<dd>
				<a href="/">홈</a> &gt; 
				<a href="category.do?prod_category1=MM">W3M 미세먼지마스크</a>
			</dd>
		</dl>
	</div>
	<!-- .prd-class-hd -->

	<h2 class="cboth bcate">W3M 미세먼지마스크</h2>

	<div class="class-list">
		<ul class="cboth">
			<li><a href="category.do?prod_category1=MM&prod_category2=P">프리미엄(4)</a></li>
			<li><a href="category.do?prod_category1=MM&prod_category2=N">일반(9)</a></li>
			<li><a href="category.do?prod_category1=MM&prod_category2=B">블랙(3)</a></li>
		</ul>
	</div>
	<!-- .class-list -->

	<div class="page-body">

		<h3 class="blind">상품 정보, 정렬</h3>
		<div class="cboth total-sort">
			<dl class="total">
				<dd>16</dd>
				개의 상품이 있습니다.
			</dl>
			<dl class="sort">
				<dt class="blind">검색결과 정렬</dt>
				<dd>
					<ul>
						<!-- 
						<li><a href="javascript:sendsort('regdate')">최신순</a></li> 
						<li><a href="javascript:sendsort('brandname')">이름순</a></li>
						<li><a href="javascript:sendsort('product')">등록순</a></li>
						 -->
						<li><a href="javascript:sendsort('price')">낮은가격순</a></li>
						<li><a href="javascript:sendsort('price2')">높은가격순</a></li>
						<li><a href="javascript:sendsort('sellcnt')">판매순</a></li>
						<li><a href="javascript:sendsort('viewcnt')">인기순</a></li>
					</ul>
				</dd>
			</dl>
		</div>
		<!-- .total-sort -->

		<div class="prd-list pdt30">
			<table summary="상품이미지, 상품 설명, 가격">
				<caption>상품 리스트</caption>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr class="nopadding">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<!-- c태그 시작 -->
					<c:set var="i" value="0" />
					<c:set var="j" value="4" />
					<c:forEach var="product" items="${productList }">
						<c:if test="${i%j==0}">
							<tr>
						</c:if>
						<td>
							<div class="tb-center">
								<div class="box">
									<div class="thumb salebox">
										<a href="/getProduct?prod_code=${product.prod_code }">
										<img class="MS_prod_img_m" src="${product.prod_title_image }" alt="상품 섬네일" /></a>
										<input type="hidden" name="custom_price" value="52400" />
										<input type="hidden" name="product_price" value="42000" />
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
					<!-- c태그 끝 -->
					
					<!-- sold out 예시(td) 
					<td>
							<div class="tb-center">
								<div class="box">
									<div class="thumb salebox">
										<a
											href="/shop/shopdetail.html?branduid=1007205&amp;xcode=023&amp;mcode=001&amp;scode=&amp;type=X&amp;sort=manual&amp;cur_code=023&amp;GfDT=bmt8W11H"><img
											class="MS_prod_img_m"
											src="/shopimages/pgreen1364/0230010000142.jpg?1607654657"
											alt="상품 섬네일"></a> <input type="hidden" name="custom_price"
											value="29500"> <input type="hidden"
											name="product_price" value="24800"> <span
											class="sale_text" style="display: block;">16%</span>
									</div>
									<ul class="info">
										<li class="dsc">웰킵스 프리미엄 미세먼지황사마스크 KF94 소형 25개입</li>
										<li class="subname"></li>
										<li class="soldout">SOLD OUT</li>
										<li class="icon"><span class="MK-product-icons"></span></li>
										<li class="cboth icon_option"></li>
									</ul>
								</div>
							</div>
						</td>
					 	-->
				</tbody>
			</table>
			<ol class="paging">
				<li class="now"><a href="/shop/shopbrand.html?type=X&amp;xcode=023&amp;sort=&amp;page=1">1</a></li>
			</ol>
		</div>
	</div>
	<!-- .page-body -->
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
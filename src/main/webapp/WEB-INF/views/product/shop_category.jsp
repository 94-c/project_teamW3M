<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<title>${productName}</title>

<div id="productClass">
	
	<div class="prd-class-hd">
		<dl class="loc-navi">
			<dt class="blind">현재 위치</dt>
			<dd>
				<a href="/">홈</a> &gt; 
				<a href="#">${productName}</a>
			</dd>
		</dl>
	</div>
	<!-- .prd-class-hd -->

	<h2 class="cboth bcate">${productName}</h2>

	<div class="class-list">
		<ul class="cboth">
		
		<c:if test="${productName eq 'W3M 미세먼지마스크' || productName eq '프리미엄 미세먼지마스크' || productName eq '일반 미세먼지마스크' || productName eq '블랙 미세먼지마스크'}">
			<li><a href="category.do?prod_category1=MM&prod_category2=P">프리미엄(${MMP_cnt})</a></li>
			<li><a href="category.do?prod_category1=MM&prod_category2=N">일반(${MMN_cnt})</a></li>
			<li><a href="category.do?prod_category1=MM&prod_category2=B">블랙(${MMB_cnt})</a></li>
		</c:if>
		<c:if test="${productName eq 'W3M 비말차단마스크' || productName eq '일반 비말차단마스크'}">
			<li><a href="category.do?prod_category1=BB&prod_category2=N">일반(${BBN_cnt})</a></li>
		</c:if>
		<c:if test="${productName eq 'W3M 손소독제' || productName eq '일반 손소독제'}">
			<li><a href="category.do?prod_category1=SS&prod_category2=N">일반(${SSN_cnt})</a></li>
		</c:if>
		<c:if test="${productName eq 'W3M 쿨패치' || productName eq '일반 쿨패치'}">
			<li><a href="category.do?prod_category1=CC&prod_category2=N">일반(${CCN_cnt})</a></li>
		</c:if>
		<c:if test="${productName eq 'W3M 핫팩' || productName eq '일반 핫팩'}">
			<li><a href="category.do?prod_category1=HH&prod_category2=N">일반(${HHN_cnt})</a></li>
		</c:if>
		<c:if test="${productName eq 'W3M 체온계' || productName eq '일반 체온계'}">
			<li><a href="category.do?prod_category1=TT&prod_category2=N">일반(${TTN_cnt})</a></li>
		</c:if>
		
		</ul>
	</div>
	<!-- .class-list -->

	<div class="page-body">

		<h3 class="blind">상품 정보, 정렬</h3>
		<div class="cboth total-sort">
			<dl class="total">
				<dd>${productCount}개의 상품이 있습니다.</dd>
			</dl>
			<dl class="sort">
				<dt class="blind">검색결과 정렬</dt>
				<dd>
					<ul>
						<c:if test="${productName eq 'W3M 미세먼지마스크'}">
							<li><a href="category.do?prod_category1=MM&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=MM&searchCondition=sales_rate">판매량순</a></li>							
						</c:if>	
						<c:if test="${productName eq '프리미엄 미세먼지마스크' }">
							<li><a href="category.do?prod_category1=MM&prod_category2=P&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=P&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=P&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=P&searchCondition=sales_rate">판매량순</a></li>
							</c:if>							
						<c:if test="${productName eq '일반 미세먼지마스크' }">
							<li><a href="category.do?prod_category1=MM&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>
						</c:if>							
						<c:if test="${productName eq '블랙 미세먼지마스크' }">
							<li><a href="category.do?prod_category1=MM&prod_category2=B&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=B&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=B&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=MM&prod_category2=B&searchCondition=sales_rate">판매량순</a></li>
						</c:if>										
						
						<c:if test="${productName eq 'W3M 비말차단마스크'}">
							<li><a href="category.do?prod_category1=BB&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=BB&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=BB&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=BB&searchCondition=sales_rate">판매량순</a></li>
						</c:if>
						<c:if test="${productName eq '일반 비말차단마스크' }">
							<li><a href="category.do?prod_category1=BB&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=BB&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=BB&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=BB&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>
						</c:if>										
						
						<c:if test="${productName eq 'W3M 손소독제'}">
							<li><a href="category.do?prod_category1=SS&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=SS&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=SS&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=SS&searchCondition=sales_rate">판매량순</a></li>
						</c:if>
						<c:if test="${productName eq '일반 손소독제' }">
							<li><a href="category.do?prod_category1=SS&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=SS&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=SS&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>							
							<li><a href="category.do?prod_category1=SS&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>							
						</c:if>
						
						<c:if test="${productName eq 'W3M 쿨패치'}">
							<li><a href="category.do?prod_category1=CC&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=CC&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=CC&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=CC&searchCondition=sales_rate">판매량순</a></li>
						</c:if>
						<c:if test="${productName eq '일반 쿨패치'}">
							<li><a href="category.do?prod_category1=CC&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=CC&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=CC&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>							
							<li><a href="category.do?prod_category1=CC&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>							
						</c:if>
						
						<c:if test="${productName eq 'W3M 핫팩'}">
							<li><a href="category.do?prod_category1=HH&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=HH&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=HH&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=HH&searchCondition=sales_rate">판매량순</a></li>
						</c:if>
						<c:if test="${productName eq '일반 핫팩'}">
							<li><a href="category.do?prod_category1=HH&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=HH&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=HH&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>							
							<li><a href="category.do?prod_category1=HH&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>							
						</c:if>
						
						<c:if test="${productName eq 'W3M 체온계'}">
							<li><a href="category.do?prod_category1=TT&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=TT&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=TT&searchCondition=hit_cnt">인기순</a></li>
							<li><a href="category.do?prod_category1=TT&searchCondition=sales_rate">판매량순</a></li>
						</c:if>
						<c:if test="${productName eq '일반 체온계'}">
							<li><a href="category.do?prod_category1=TT&prod_category2=N&searchCondition=low_price">낮은가격순</a></li>
							<li><a href="category.do?prod_category1=TT&prod_category2=N&searchCondition=high_price">높은가격순</a></li>
							<li><a href="category.do?prod_category1=TT&prod_category2=N&searchCondition=hit_cnt">인기순</a></li>							
							<li><a href="category.do?prod_category1=TT&prod_category2=N&searchCondition=sales_rate">판매량순</a></li>							
						</c:if>
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
										<a href="/getProduct?prod_code=${product.prod_code}">
										<img class="MS_prod_img_m" src="${product.prod_title_image}" alt="상품 섬네일" /></a>
										<input type="hidden" name="custom_price" value="${product.prod_price}" />
										<input type="hidden" name="product_price" value="${product.prod_price_sale}" />
										<span class="sale_text" style="display: block;"></span>
									</div>
									<ul class="info">
										<li class="dsc">${product.prod_title}</li>
										<li class="subname"></li>
										<c:if test="${product.prod_amount gt 0}">
											<li class="consumer"><fmt:formatNumber value="${product.prod_price}" pattern="#,###" />원</li>
											<li class="price"><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" />원</li>
										</c:if>
										<c:if test="${product.prod_amount eq 0}">
											<li class="soldout">SOLD OUT</li>
										</c:if>
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
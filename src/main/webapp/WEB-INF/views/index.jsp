<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>[Well3Mask] W3M 공식쇼핑물</title>

<!-- bxSlider 관련 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="resources/js/bxSlider.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 
<div id="wrap">
	<!-- 메인 배너 슬라이드 -->
	<div id="contentWrapper">
		<div class="cboth main_img">
			<div class="sliderkit contentslider-main" style="display: block;">
			
				<!-- 슬라이더1 -->				
				<div class="sliderkit-panel1">
					<div class="sliderkit-panel sliderkit-panel-old" style="display: block;">
						<a href="http://localhost:8080/category.do?prod_category1=MM">
							<div style="background-image: url(resources/images/m_mask/main_visual_mask.jpg)"></div>							
						</a>
					</div>
					<div class="sliderkit-panel sliderkit-panel-active" style="display: block;">
						<a href="http://localhost:8080/category.do?prod_category1=SS">
							<div style="background-image: url(resources/images/m_mask/main_visual_purell.jpg)"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 좌측 2단 배너 -->
	<div class="cboth main_section02">
		<div class="fleft main_ban01">
			<div class="cboth">
				<a href="getUserNoticeList.do"><IMG
					SRC="resources/images/m_mask/Notice.jpg"></a>
			</div>
			<div class="cboth">
				<a href="https://corona-live.com/"><IMG
					SRC="resources/images/m_mask/center_left2.jpg"></a>
			</div>
		</div>

		<!-- 중앙 배너 슬라이드  -->
		<div class="fleft">
			<div class="sliderkit contentslider-look">
				<!-- 슬라이더2 -->
				<div class="sliderkit-panel2">
					<div class="sliderkit-panel">
						<a href="#">
						<img src="resources/images/m_mask/center_center1.jpg"></a>
					</div>
					<div class="sliderkit-panel">
						<a href="#">
						<img src="resources/images/m_mask/center_center2.jpg"></a>
					</div>
					<div class="sliderkit-panel">
						<a href="#">
						<img src="resources/images/m_mask/center_center3.jpg"></a>
					</div>
				</div>
			</div>
		</div>

		<!-- 우측 2단 배너 -->
		<div class="fright main_ban02">
			<div class="cboth">
				<a href="inquiry.do"><img
					src="resources/images/m_mask/Questions.jpg"></a>
			</div>
			<div class="cboth">
				<a href="http://fba.kcforum.co.kr/2021/winner.php"><img
					src="resources/images/m_mask/center_right2.jpg"></a>
			</div>
		</div>
	</div>
	<!-- //main_section02 -->

	<div class="cboth main_section03">
		<div class="cboth main_title"><span style="color:#ff08a0; font-weight: bold; ">W3M</span> TOP8</div>
		<div class="cboth prd-list">
			<table summary="상품이미지, 상품 설명, 가격">
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<tbody>
					<tr class="nopadding">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
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
										<a href="/getProduct?prod_code=${product.prod_code }"><img
											class="MS_prod_img_m" src="${product.prod_title_image }"
											alt="상품 섬네일" /></a> <input type="hidden" name="custom_price"
											value="${product.prod_price}" /> <input type="hidden"
											name="product_price" value="${product.prod_price_sale}" /> <span
											class="sale_text" style="display: block;"></span>
									</div>
									<ul class="info">
										<li class="dsc">${product.prod_title }</li>
										<li class="subname"></li>
										<c:if test="${product.prod_amount gt 0}">
											<li class="consumer"><fmt:formatNumber
													value="${product.prod_price}" pattern="#,###" />원</li>
											<li class="price"><fmt:formatNumber
													value="${product.prod_price_sale}" pattern="#,###" />원</li>
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
					<tr></tr>
				</tbody>
			</table>
		</div>
		<!-- //prd-list -->
	</div>
	<!-- //main_section03 -->

	<div class="cboth main_section04">
		<div class="sliderkit contentslider-tab" style="display: block;">
			<!-- 슬라이더3 -->
			<div class="sliderkit-panel3">
				<div class="sliderkit-panel sliderkit-panel-active" style="display: block;">
					<div class="movie_area cboth">
						<div class="fleft">
							<!-- 메인 유튜브 동영상 영역 수정하는곳 -->
							<div class="movie_txt01">01</div>
							<div class="movie_txt02">Welkeeps TV광고 Series.</div>
							<div class="movie_txt03">
								누구도 피할 수 없는 미세먼지<br>웰킵스로 지키세요!
							</div>
							<div class="movie_txt04">
								소녀가 미끄럼틀을 타기 위해 다가옵니다.<br> 신나게 그네를 타고 있는 소녀의 모습과 함께<br>
								왼쪽에 15분이라는 시간이 나타납니다.<br> <br> 그네 한번 타는 15분. 미세먼지가
								심장까지 도달하기 충분한 시간입니다.
							</div>
						</div>
						<div class="fright">
							<iframe id="video1" frameborder="0" allowfullscreen="1"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								title="YouTube video player" width="710" height="400"
								src="https://www.youtube.com/embed/KmCJCZHE1eY?controls=2&amp;enablejsapi=1&amp;origin=http%3A%2F%2Fwww.welkeepsmall.com&amp;widgetid=1"></iframe>
						</div>
					</div>
				</div>
				<div class="sliderkit-panel" style="display: none;">
					<div class="movie_area cboth">
						<div class="fleft">
							<div class="movie_txt01">02</div>
							<div class="movie_txt02">Welkeeps TV광고 Series.</div>
							<div class="movie_txt03">
								누구도 피할 수 없는 미세먼지<br>웰킵스로 지키세요!
							</div>
							<div class="movie_txt04">
								소년이 미끄럼틀을 타기 위해 준비하고 있습니다.<br> 즐겁게 미끄럼틀을 타고 있는 소년의 모습과 함께<br>
								왼쪽에 15분이라는 시간이 표시됩니다.<br> <br> 미끄럼틀 타는 15분. 미세먼지가 심장까지
								도달하기 충분한 시간입니다.
							</div>
						</div>
						<div class="fright">
							<iframe id="video2" frameborder="0" allowfullscreen="1"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								title="YouTube video player" width="710" height="400"
								src="https://www.youtube.com/embed/yVIwI8Iosto?controls=2&amp;enablejsapi=1&amp;origin=http%3A%2F%2Fwww.welkeepsmall.com&amp;widgetid=2"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //contentslider-tab -->
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
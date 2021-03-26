<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>${product.prod_title }</title>
<body>
	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="content">
				<div id="productDetail">
					<!-- 배너 -->
					<dl class="loc-navi">
						
						
					</dl>
					
					<!-- 메인 이미지 -->
					<div class="page-body">
						<div class="thumb-info">
							<div class="thumb-wrap">
								<div class="thumb">
									<img src="${product.prod_title_image}" class="detail_image">
								</div>
							</div>
							
							<!-- .thumb-wrap -->
							<form name="form1" method="post" id="form1" action="/shop/basket.html">
								<input type="hidden" name="brandcode" value="023002000050">
								<input type="hidden" name="branduid" value="1007246"> 
								<input type="hidden" name="xcode" value="023"> 
								<input type="hidden" name="mcode" value="002"> 
								<input type="hidden" name="typep" value="X"> 
								<input type="hidden" name="ordertype"> 
								<input type="hidden" name="opts"> 
								<input type="hidden" name="mode">
								<input type="hidden" name="optioncode"> 
								<input type="hidden" name="optiontype"> 
								<input type="hidden" name="optslist"> 
								<input type="hidden" id="price" name="price" value="42,000"> 
								<input type="hidden" id="disprice" name="disprice" value=""> 
								<input type="hidden" id="price_wh" name="price_wh" value="42,000">
								<input type="hidden" id="disprice_wh" name="disprice_wh" value=""> 
								<input type="hidden" id="option_type_wh" name="option_type_wh" value="NO"> 
								<input type="hidden" id="prd_hybrid_min" name="prd_hybrid_min" value="1"> 
								<input type="hidden" name="MOBILE_USE" value="NO"> 
								<input type="hidden" name="product_type" id="product_type" value="NORMAL"> 
								<input type="hidden" name="multiopt_direct" value=""> 
								<input type="hidden" name="collbasket_type" value="Y"> 
								<input type="hidden" name="package_chk_val" value="0"> 
								<input type="hidden" name="miniq" id="miniq" value="1"> 
								<input type="hidden" name="maxq" id="maxq" value="2147483647"> 
								<input type="hidden" name="cart_free" value=""> 
								<input type="hidden" name="opt_type" value="NO"> 
								<input type="hidden" name="hybrid_op_price" id="hybrid_op_price" value=""> 
								<input type="hidden" name="basket_use" id="basket_use" value="Y"> 
								<input type="hidden" name="spcode">
								<input type="hidden" name="spcode2">
								<div class="info">

									<p class="prd-icon">
										<span class="MK-product-icons">
										<!-- new 이미지 <img src="/images/common/prod_icons/3" class="MK-product-icon-1"> --></span>
									</p>
									
									<!-- 제품명 -->
									<h3 class="tit-prd">
										${product.prod_title }
									</h3>
									
									<div class="table-opt">
										<table summary="판매가격, 적립금, 주문수량, 옵션, 사이즈, 상품조르기, sns">
											<caption>상품 옵션</caption>
											<colgroup>
												<col width="100">
												<col width="*">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="tb-left">판매가격</div></th>
													<td class="price sell_price">
														<div class="tb-left">
															<span id="pricevalue" class="price"><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" /></span>원
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="tb-left">소비자가격</div></th>
													<td class="price">
														<div class="tb-left">
															<strike><fmt:formatNumber value="${product.prod_price}" pattern="#,###" /></strike>
														</div>
													</td>
												</tr>

												<tr>
													<td colspan="2" style="padding-top: 0;">
														<div class="MK_optAddWrap">
															<div id="MK_innerOptWrap">
																<div id="MK_innerOptScroll" class="line"
																	style="padding-top: 0;">
																	<ul id="MK_innerOpt_01" class="MK_inner-opt-cm">
																		<li id="basic_0"><input type="hidden"
																			id="MS_keys_basic_0" value="0:0" class="basic_option"><span
																			class="MK_p-name"><!-- 상품명 --></span>
																		<div class="MK_qty-ctrl">
																				<input type="text" id="MS_amount_basic_0" name="amount[]" value="1" onfocusout="set_amount(this, 'basic');" size="4" style="text-align: right; float: left;"
																					class="basic_option" maxlength="">
																					<a href="javascript:set_amount('MS_amount_basic_0', 'basic', 'up');" class="MK_btn-up">
																					<img src="/images/common/basket_up.gif" alt="수량증가" border="0"></a>
																					<a href="javascript:set_amount('MS_amount_basic_0', 'basic', 'down');" class="MK_btn-dw">
																					<img src="/images/common/basket_down.gif" alt="수량감소" ㄴborder="0"></a>
																			</div>
																			<strong class="MK_price">
																				<span id="MK_p_price_basic_0"><!-- 42,000 --></span>원</strong></li>
																	</ul>
																	<ul id="MK_innerOpt_02" class="MK_inner-opt-cm"></ul>
																</div>
																<div id="MK_innerOptTotal">
																	<p class="totalLeft">
																		<span class="MK_txt-total">총 상품 금액</span>
																	</p>
																	<!-- 총 상품금액 -->
																	<p class="totalRight">
																		<strong class="MK_total" id="MK_p_total"><!-- 42,000 --></strong>
																		<span class="MK_txt-won">원</span>
																	</p>
																</div>
																<div id="MK_innerOptPrice">
																	(상품금액 <span id="MK_txt-prd"></span> 원 + 기본옵션 <span
																		id="MK_txt-opt"></span> 원 )
																</div>

															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="2" class="nopd">
														<div class="opt-wrap"></div>
													</td>
												</tr>

												<tr>
													<td colspan="2" class="area-btn-size-chart"></td>
												</tr>

											</tbody>
										</table>
									</div>
									<!-- .table-opt -->
									<div class="prd-btns">
										<a href="javascript:send_multi('', 'baro', '');"
											class="btn_buy fe">바로 구매하기</a> 
											<a href="javascript:send_multi('', '');" class="btn_cart fe">장바구니 담기</a>
									</div>

									<div class="barotalk"></div>

								</div>
								<!-- .info -->
							</form>
						</div>
						<!-- .thumb-info -->

						<a id="detailGoodsInfo"></a>
						<div class="detailTab">
							<ul>
								<li class="first"><a href="#detailGoodsInfo" class="active">상세정보</a></li>
								<li><a href="#detailRelation" >관련상품</a></li>
								<li><a href="#detailReview">구매후기</a></li>
								<li><a href="#detailQna" >문의</a></li>
							</ul>
						</div>

						<div class="prd-detail">
							<div>
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="videotalk_area"></div>
							<!-- [OPENEDITOR] -->
							<center>
							<img src="${product.prod_image1}">
							<img src="${product.prod_image2}">
							<img src="${product.prod_image3}">
							<img src="${product.prod_image4}">
							<img src="${product.prod_image5}">
							<img src="${product.prod_image6}">
							<img src="${product.prod_image7}">
							<img src="${product.prod_image8}">
							<img src="${product.prod_image9}">
							<img src="${product.prod_image10}">

							</center>


							<!-- s: 상품 일반정보(상품정보제공 고시) -->
							<div id="productWrap">
								<table>
									<colgroup>
										<col width="210">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><span>품명 및 모델명</span></th>
											<td><span>${product.prod_title }</span></td>
										</tr>
										<tr>
											<th><span>인증.허가 사항</span></th>
											<td><span>해당없음</span></td>
										</tr>
										<tr>
											<th><span>제조국 또는 원산지</span></th>
											<td><span>대한민국</span></td>
										</tr>
										<tr>
											<th><span>제조자</span></th>
											<td><span>(주)피앤티디</span></td>
										</tr>
										<tr>
											<th><span>A/S 책임자와 전화번호</span></th>
											<td><span>웰킵스 / 02-443-0999</span></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- e: 상품 일반정보(상품정보제공 고시) -->
							<!-- 쿠폰 관련 부분 -->
							<!-- 쿠폰관련 부분 끝 -->
							<!-- 몰티비 플레이어 노출 위치 -->
							<div id="malltb_video_player" style="margin-top: 10px; margin-bottom: 10px; text-align: center; display: none;"></div>
						</div>

						<a id="detailRelation"></a>
						<div class="detailTab">
							<ul>
								<li class="first"><a href="#detailGoodsInfo">상세정보</a></li>
								<li><a href="#detailRelation" class="active">관련상품</a></li>
								<li><a href="#detailReview">구매후기</a></li>
								<li><a href="#detailQna">문의</a></li>
							</ul>
						</div>

						<!-- 구매 후기 -->
						<a id="detailReview"></a> <a name="reviewboard"></a>
						<div class="tit-detail">
							<h3 class="fe">구매후기</h3>
							<p class="more fe">
								<a href="/board/board.html?code=pgreen1364_board2">+ 더보기</a>
							</p>
						</div>
						<div class="table-slide review-list">
							<table summary="번호, 제목, 작성자, 작성일, 조회">
								<caption>review 리스트</caption>
								<colgroup>
									<col width="70">
									<col width="30">
									<col width="*">
									<col width="100">
									<col width="100">
									<col width="80">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO</div></th>
										<th scope="col"></th>
										<th scope="col"><div class="tb-center">제목</div></th>
										<th scope="col"><div class="tb-center">작성자</div></th>
										<th scope="col"><div class="tb-center">날짜</div></th>
										<th scope="col"><div class="tb-center">HITS</div></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<div class="detailTab">
							<ul>
								<li class="first"><a href="#detailGoodsInfo">상세정보</a></li>
								<li><a href="#detailRelation" >관련상품</a></li>
								<li><a href="#detailReview" class="active">구매후기</a></li>
								<li><a href="#detailQna">문의</a></li>
							</ul>
						</div>
							
							
							<div class="list-btm">
								<div class="paging-wrap">
									<div class="paging"> <!-- 페이징 -->
									</div>
								</div>
								<div class="btm_write">
									<a href="JavaScript:alert('배송완료&nbsp;후&nbsp;작성&nbsp;가능합니다.')">후기쓰기</a>
								</div>

							</div>
						</div>
						<!-- .review-list -->


						<!-- product list -->
						<a id="detailQna"></a> <a name="brandqna_list"></a>
						<div class="tit-detail">
							<h3 class="fe">제품문의</h3>
							<p class="more fe">
								<a href="#">+ 더보기</a>
							</p>
						</div>
						<div class="table-slide qna-list">
							<table summary="번호, 제목, 작성자, 작성일, 조회">
								<caption>QnA 리스트</caption>
								<colgroup>
									<col width="80">
									<col width="30">
									<col width="*">
									<col width="100">
									<col width="100">
									<col width="80">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO</div></th>
										<th scope="col"></th>
										<th scope="col"><div class="tb-center">제목</div></th>
										<th scope="col"><div class="tb-center">작성자</div></th>
										<th scope="col"><div class="tb-center">날짜</div></th>
										<th scope="col"><div class="tb-center">HITS</div></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
							<div class="list-btm">
								<div class="paging-wrap">
									<div class="paging">
									</div>
								</div>
								<div class="btm_write">
									<a href="#">문의하기</a>
								</div>

							</div>
							<div class="detailTab">
							<ul>
								<li class="first"><a href="#detailGoodsInfo">상세정보</a></li>
								<li><a href="#detailRelation" >관련상품</a></li>
								<li><a href="#detailReview" >구매후기</a></li>
								<li><a href="#detailQna" class="active">문의</a></li>
							</ul>
						</div>
						</div>
						<!-- .qna-list -->

					</div>
					<!-- .page-body -->
				</div>
				<!-- #productDetail -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>

</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
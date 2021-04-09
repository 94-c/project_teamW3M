<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>${product.prod_title }</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script type="text/javascript">
function cnt_amount(button){
	var title=$("#prod_title").val();
	var amount=$("#prod_amount").val();
	var count=$("#amount_val").val();
	var totalprice = $("#prod_price_sale").val();
	if(button =='text'){
		if(count-amount > 0 ){
			alert("1("+title+ ") 상품의 재고가 현재"+amount+"개 입니다.\n수량/상품 체크를 다시하시기 바랍니다.\n\n감사합니다.");
			count = amount;
			$("#amount_val").val(count);
			return;
		}
		$("#amount_val").val(count);
	}
	if(button =='up'){
		count++;
		if(count > amount){
			alert("2("+title+ ") 상품의 재고가 현재"+amount+"개 입니다.\n수량/상품 체크를 다시하시기 바랍니다.\n\n감사합니다.");
			count--;
			return;
		}
		$("#amount_val").val(count);
	}
	if(button =='down'){
		count--;
		if(count <= 0){
			alert("해당 상품은 최소구매 수량이 1개 입니다.");
			count++;
			return;
		}
		$("#amount_val").val(count);
	} 
	
	var aaa = count*totalprice;
	var bbb = aaa.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#totalPlace1").text(bbb);
	$("#totalPlace2").text(bbb);
}

function send_cart(code){
	var prod_code = code;
	var prod_amount = $("#amount_val").val();
	alldata={prod_code:prod_code , prod_amount: prod_amount};
	$.ajax({
		url : "/send_cart.do",
		type : "POST",
		data : JSON.stringify(alldata),
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success:function(aa){
			if (aa==1){//실패 중복 물품
			}		
		},
		error:function(data){
		}
	});
}
function send_oder(code){
	var prod_code=code;
	var prod_amount=$("#amount_val").val();
	alldata={prod_code:prod_code , prod_amount: prod_amount};
	$.ajax({
		async : true,
		url : "send_order.do",
		type : "POST",
		data : JSON.stringify(alldata),
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		success:function(aa){
			console.log("aa ="+aa);
			if(aa==1){
				location.href= "send_order_go.do"
				return true;
			}else{
				return false;
			}

		},
		error:function(aa){
			return false;
		}
	});
}
//이전 버튼 이벤트
function fn_prev(prod_seq,page, range, rangSize, searchKeyword) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "${pagContext.request.contextPath}/getProduct";
	url = url + "?prod_seq=" + prod_seq;
	url = url + "&page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchKeyword" + searchKeyword;
	url = url + "#detailQna";
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(prod_seq,page, range, rangSize, searchKeyword) {
	var url = "${pagContext.request.contextPath}/getProduct";
	url = url + "?prod_seq=" + prod_seq;
	url = url + "&page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchKeyword" + searchKeyword;
	url = url + "#detailQna";
	location.href = url;
}

//다음 버튼 이벤트
function fn_next(prod_seq,page, range, rangSize, searchKeyword) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "${pagContext.request.contextPath}/getProduct";
	url = url + "?prod_seq=" + prod_seq;
	url = url + "&page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchKeyword" + searchKeyword;
	url = url + "#detailQna";
	location.href = url;
}

$(document).on('click', '#btnSearch', function(e) {
	e.preventDefault();
	var url = "${pageContext.request.contextPath}/getProduct";
	url = url + "&searchType=" + $('#searchType').val();
	url = url + "&keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});
</script>

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
									<c:if test="${product.prod_amount ne 0}">
										<img src="${product.prod_title_image}" class="detail_image" alt="">
									</c:if>
									<c:if test="${product.prod_amount eq 0}">
										<img src="https://imageup.s3.ap-northeast-2.amazonaws.com/product/maskcat_thumb.jpg" alt="상품준비중">
									</c:if>
								</div>
							</div>
							
							<!-- .thumb-wrap -->
							<form name="form1" method="post" id="form1" action="/shop/basket.html">
								<input type="hidden" name="prod_amount" id="prod_amount" value="${product.prod_amount }">
								<input type="hidden" name="prod_title" id="prod_title" value="${product.prod_title }">
								<input type="hidden" name="prod_price_sale" id="prod_price_sale" value="${product.prod_price_sale}">
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
															<del><fmt:formatNumber value="${product.prod_price}" pattern="#,###"/>원</del>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="tb-left">적립금</div></th>
													<td class="price">
														<div class="tb-left">
															${product.prod_point_rate}%
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
																			class="MK_p-name">${product.prod_title }</span>
																		<div class="MK_qty-ctrl">
																			<input type="text" name="amount" id="amount_val" value="1" onfocusout="cnt_amount('text');" size="4" style="text-align: right; float: left;"
																				class="basic_option" maxlength="">
																				<a href="javascript:cnt_amount('up');" class="MK_btn-up">
																					<img src="/images/common/basket_up.gif" alt="수량증가" border="0">
																				</a>
																				<a href="javascript:cnt_amount('down');" class="MK_btn-dw">
																					<img src="/images/common/basket_down.gif" alt="수량감소" border="0">
																				</a>
																		</div>
																			<strong class="MK_price"><span id="totalPlace1"><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" /></span>원</strong>
																		</li>
																	</ul>
																	<ul id="MK_innerOpt_02" class="MK_inner-opt-cm"></ul>
																</div>
																<div id="MK_innerOptTotal">
																	<p class="totalLeft">
																		<span class="MK_txt-total">총 상품 금액</span>
																	</p>
																	<!-- 총 상품금액 -->
																	<p class="totalRight">
																		<strong class="MK_total" id="totalPlace2" ><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" /></strong>
																		<span class="MK_txt-won" >원</span>
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
											<c:if test="${login_state eq 'login' }">
												<c:if test="${product.prod_amount ne 0}">
													<a href="#cart_modal" rel ="modal:open" onclick="send_cart('${product.prod_code}');" class="btn_cart fe">장바구니 담기</a>
													<a href="#" onclick="return send_oder('${product.prod_code}');" class="btn_buy fe">바로 구매하기</a>
												</c:if>
												<c:if test="${product.prod_amount eq 0}">
													<div class="soldout" style="color:red">품절 / SOLD OUT</div>
												</c:if>	
											</c:if>
											<c:if test="${login_state ne 'login' }">
												<c:if test="${product.prod_amount ne 0}">
							                  		<a href="loginForm.do?returnURL=cart" onClick="alert('로그인이 필요합니다.')" class="btn_cart fe">장바구니 담기</a>
							                  		<a href="loginForm.do?returnURL=order" onClick="alert('로그인이 필요합니다.')" class="btn_buy fe">바로 구매하기</a>
						                  		</c:if>
						                  		<c:if test="${product.prod_amount eq 0}">
													<div class="soldout" style="color:red">품절 / SOLD OUT</div>
												</c:if>	
					              		    </c:if>
									</div>
									
									<div id="cart_modal" class="modal">
									<p align="center"><br><br><br><br><br><br><br>(${product.prod_title})<br> 물품이 장바구니에 담겼습니다.<br>같은 상품을 중복선택 하는 경우에는 적용되지 않습니다.<br><br><b>지금 확인하시겠습니까?</b><br><br>  
									</p>
									<a href="GoCart.do" rel=""><button>이동</button></a>&nbsp;&nbsp;&nbsp;
									<a href="#" rel="modal:close"><button>계속쇼핑하기</button> </a>
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
							<div align="center">
								<c:if test="${product.prod_amount ne 0}">
									<img src="${product.prod_image1}" alt="">
									<img src="${product.prod_image2}" alt="">
									<img src="${product.prod_image3}" alt="">
									<img src="${product.prod_image4}" alt="">
									<img src="${product.prod_image5}" alt="">
									<img src="${product.prod_image6}" alt="">
									<img src="${product.prod_image7}" alt="">
									<img src="${product.prod_image8}" alt="">
									<img src="${product.prod_image9}" alt="">
									<img src="${product.prod_image10}" alt="">
								</c:if>
								<c:if test="${product.prod_amount eq 0}">
									<img src="https://imageup.s3.ap-northeast-2.amazonaws.com/product/maskcat.jpg" alt="상품준비중">
								</c:if>
							</div>

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
									<c:forEach var="re" items="${review}">
										<tr>
											<td scope="col"><div class="tb-center">${re.review_seq}</div></td>
											<td scope="col"><div class="tb-center">&nbsp;</div></td>
											<td scope="col"><div class="tb-center">
													<a
														href='<c:url value='/reviewContent.do?review_seq=${re.review_seq}&prod_title=${re.prod_title }'/>'
														class="text-dark">${re.review_title}</a>
												</div></td>
											<td scope="col"><div class="tb-center">
													<c:if
														test="${re.review_writer ne null && re.review_writer!=''}">${fn:substring(re.review_writer,0,fn:length(re.review_writer)-1)}*</c:if>
												</div></td>
											<td scope="col"><div class="tb-center">
													<fmt:formatDate value="${re.review_date}"
														pattern="yyyy-MM-dd" />
												</div></td>
											<td scope="col"><div class="tb-center">${re.review_cnt}</div></td>
										</tr>
									</c:forEach>
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
										<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination1.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${product.prod_seq }','${pagination1.page}', '${pagination1.range}', '${pagination1.rangeSize}')">Previous</a></li>
									</c:if>

									<c:forEach begin="${pagination1.startPage}"
										end="${pagination1.endPage}" var="idx">
										<li
											class="page-item <c:out value="${pagination1.page == idx ? 'active' : ''}"/> "><a
											class="page-link" href="#"
											onClick="fn_pagination('${product.prod_seq }','${idx}', '${pagination1.range}', '${pagination1.rangeSize}')">
												${idx} </a></li>
									</c:forEach>

									<c:if test="${pagination1.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${product.prod_seq }','${pagination1.range}', '${pagination1.range}', '${pagination1.rangeSize}')">Next</a></li>
									</c:if>
								</ul>
							</div>
									</div>
								</div>

							</div>
						</div>
						<!-- .review-list -->


						<!-- product list -->
						<a id="detailQna"></a> <a name="brandqna_list"></a>
						<div class="tit-detail">
							<h3 class="fe">제품문의</h3>
							<p class="more fe">
								<a href="inquiry.do">+ 더보기</a>
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
									<c:forEach var="inquiryVO" items="${inquiry}">
										<tr>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_seq}</div></td>
											<td scope="col"><div class="tb-center">&nbsp;</div></td>
											<td scope="col"><div class="tb-center">
													<a
														href='<c:url value='/inquiryContent.do?inq_seq=${inquiryVO.inq_seq}'/>'
														class="text-dark">${inquiryVO.inq_title}</a>
												</div></td>
											<td scope="col"><div class="tb-center">
													<c:if
														test="${inquiryVO.inq_writer ne null && inquiryVO.inq_writer!=''}">${fn:substring(inquiryVO.inq_writer,0,fn:length(inquiryVO.inq_writer)-1)}*</c:if>
												</div></td>
											<td scope="col"><div class="tb-center">
													<fmt:formatDate value="${inquiryVO.inq_date}"
														pattern="yyyy-MM-dd" />
												</div></td>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_cnt}</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="list-btm">
								<div class="paging-wrap">
									<div class="paging">
										<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${product.prod_seq }','${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
									</c:if>

									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="idx">
										<li
											class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
											class="page-link" href="#"
											onClick="fn_pagination('${product.prod_seq }','${idx}', '${pagination.range}', '${pagination.rangeSize}')">
												${idx} </a></li>
									</c:forEach>

									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${product.prod_seq }','${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
									</c:if>
								</ul>
							</div>
									</div>
								</div>
								<div class="btm_write">
									 <c:if test="${login_state eq 'login' }">
                    					 <li><a href="inquiry_write_view.do?prod_code=${product.prod_code }">문의하기</a></li>
                    				 </c:if>
                   					 <c:if test="${login_state ne 'login' }">
                    					 <li><a href="loginForm.do" onClick="alert('로그인이 필요합니다.')">문의하기</a></li>
                     				</c:if> 
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
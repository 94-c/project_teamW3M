<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>주문 상세</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">
<link href="resources/css/orderDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js" ></script>

<div id="contentWrapper">
	<div id="contentWrap">
		<%@include file="/WEB-INF/views/mypage/myPageCommon.jsp"%>
		<hr>
		<div id="content">
			<div id="orderSt">
				<div class="tit-pop">
					<h1>주문정보</h1>
					<span class="txt"><em class="order_name">${userVO.user_name}</em>님께서 
					<em class="order_date"><fmt:formatDate value="${receiverInfo.order_date}" pattern="yyyy년 MM월 dd일 a h시 mm분"/></em>에 주문하신 내역입니다.</span>
				</div>
				<ul class="tab">
					<li><a href="#">주문상세</a></li>
				</ul>
				<div id="orderInfo">
					<h2>주문자정보</h2>
					<div class="table-w table-orderinfo">
						<table summary="">
							<caption>주문자정보</caption>
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><div class="tb-left">주문번호</div></th>
									<td><div class="tb-left">${receiverInfo.order_seq}</div></td>
									<th scope="row"><div class="tb-left">주문일자</div></th>
									<td><div class="tb-left"><fmt:formatDate value="${receiverInfo.order_date}" pattern="yyyy년 MM월 dd일"/></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주문자</div></th>
									<td><div class="tb-left">${receiverInfo.user_name}</div></td>
									<th scope="row"><div class="tb-left">주문서 입금현황</div></th>
									<td><div class="tb-left"><!-- 입금 완료, 배송 완료 --></div></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<h2>배송지정보</h2>
					<div class="table-w table-region">
						<table summary="">
							<caption>배송지정보</caption>
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><div class="tb-left">배송번호</div></th>
									<td>
										<div class="tb-left">${deliveryInfo.delivery_seq}</div>
									</td>

									<th scope="row"><div class="tb-left">송장번호</div></th>
									<td>
										<div class="tb-left">롯데택배 ${lotteRandomNum}</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">수취인</div></th>
									<td><div class="tb-left">${deliveryInfo.receiver_name}</div></td>

									<th scope="row"><div class="tb-left">연락처</div></th>
									<td><div class="tb-left">${deliveryInfo.receiver_phone1}
											/ ${deliveryInfo.receiver_phone2}</div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주소</div></th>
									<td colspan="3"><div class="tb-left">(${deliveryInfo.receiver_zipcode})
											${deliveryInfo.receiver_address1}
											${deliveryInfo.receiver_address2}</div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">배송메세지</div></th>
									<td colspan="3"><div class="tb-left">${deliveryInfo.receiver_memo}</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2>주문상품</h2>
					<div class="table-w table-prdinfo">
						<table summary="">
							<caption>주문상품정보</caption>
							<colgroup>
								<col width="84">
								<col width="*">
								<col width="150">
								<col width="70">
								<col width="100">
								<col width="80">
								<col width="100">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th scope="row" colspan="2"><div class="tb-center">주문상품정보</div></th>
									<th scope="row"><div class="tb-center">상품별주문번호</div></th>
									<th scope="row"><div class="tb-center">수량</div></th>
									<th scope="row"><div class="tb-center">가격</div></th>
									<th scope="row"><div class="tb-center">적립금</div></th>
									<th scope="row"><div class="tb-center">처리상태</div></th>
									<th scope="row"><div class="tb-center">배송번호</div></th>
									<th scope="row"><div class="tb-center">후기작성</div></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="9">
										<div class="tb-right"><!-- 주문 결제 금액  -->42,200(상품구매금액) (할인/추가금액) = 42,200원
										</div>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${orderProductInfo}" var="opi">
								<tr>
									<td>
										<div class="tb-center">
											<img src="${opi.prod_title_image}" style="width: 82px; height: 82px">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<a href="javascript:go_brand('510581');">${opi.prod_title}</a>
										</div>
									</td>
									<td><div class="tb-center">${opi.order_seq}</div></td>
									<td><div class="tb-center">${opi.prod_amount}</div></td>
									<td><div class="tb-center tb-price">
											<strong>${opi.prod_price_sale }</strong>
										</div></td>
									<td><div class="tb-center">
											<span class="style4">${opi.prod_point }</span>
										</div></td>
									<td><div class="tb-center">${opi.delivery_state }</div></td>
									<td><div class="tb-center">${opi.delivery_seq }</div></td>
									<td><div class="tb-center"><a href="#" style="color:pink">후기작성</a></div></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<h2>결제정보</h2>
					<div class="table-w table-payinfo">
						<table summary="">
							<caption>결제정보</caption>
							<colgroup>
								<col width="180">
								<col width="250">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">결제방법</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
									<th scope="row"><div class="tb-center">세부내역</div></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td><div class="tb-center tb-nbold"><!-- 결제방법 -->카드</div></td>
									<td><div class="tb-center"><!-- 결제금액 -->42,200원 (입금완료)</div></td>
									<td><div class="tb-center tb-nbold">
											WDA:XMEED2021040210012651128 
											<a href="javascript:receipt('NEW', 'WDA');">
											<img src="/images/common/print_cardtax.gif"></a>
										</div></td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td><div class="tb-center">사용한 적립금</div></td>
									<td><div class="tb-center">원</div></td>
									<td><div class="tb-center"></div></td>
								</tr>
								<tr>
									<td><div class="tb-center">사용한 예치금</div></td>
									<td><div class="tb-center">원</div></td>
									<td><div class="tb-center"></div></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="pop_order_btn_group">
						<a href="JavaScript:alert('주문취소가 되지 않습니다.\n쇼핑몰에 문의하세요.')" class="CSSbuttonWhite">주문취소</a>

					</div>
					<div class="pop_order_btn_close">
						<a href="/shop/mypage.html?mypage_type=myorder" class="CSSbuttonWhite">목록보기</a>
					</div>
				</div>
				<!-- #orderInfo-->
			</div>
			<!-- #orderSt -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
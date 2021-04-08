<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>주문 내역</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">
<link href="resources/css/orderSuccess.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js"></script>

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="order">
				<dl class="loc-navi">
					<dt class="blind">현재 위치</dt>
					<dd>
						<a href="/">HOME</a> &gt; 주문완료
					</dd>
				</dl>
				<div class="page-body">
					<h2 class="tit-page">주문상품</h2>
					<div class="table-cart table-order-prd">
						<table summary="구입 상품명, 수량, 가격, 적립">
							<caption>주문 상품</caption>
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="100">
								<col width="110">
								<col width="120">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><div class="tb-center">사진</div></th>
									<th scope="col"><div class="tb-center">상품명</div></th>
									<th scope="col"><div class="tb-center">수량</div></th>
									<th scope="col"><div class="tb-center">적립</div></th>
									<th scope="col"><div class="tb-center">금액</div></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderVO" items="${OrderVO }" varStatus="status">
								<tr class="nbg">
									<td>
										<div class="tb-center">
											<img src="${orderVO.prod_title_image }" width="70">
										</div>
									</td>
									<td>
										<div class="tb-left">
											<a href="/getProduct?prod_code=${orderVO.prod_code }" class="tb-bold">${orderVO.prod_title}<!-- 상품명 --><br></a>
											<div class="tb-opt">
												<li style="margin-left: 15px;"></li>
											</div>
										</div>
									</td>
									<td>
										<div class="tb-center">${orderVO.prod_amount}<!-- 수량 --></div>
									</td>
									<td>
										<div class="tb-center"><fmt:formatNumber value="${orderVO.prod_total_point}" pattern="#,###"/><!-- 적립금 --></div>
									</td>
									<td>
										<div class="tb-center tb-bold"><fmt:formatNumber value="${orderVO.prod_total_price}" pattern="#,###"/>원<!-- 금액 --></div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td><div class="tb-left tb-totalTit">총 결제금액</div></td>
									<td colspan="4">
										<div class="tb-right tb-totalPrice">
											<strong><fmt:formatNumber value="${PayVO.pay_total_money}" pattern="#,###"></fmt:formatNumber>원 + 배송료 <fmt:formatNumber value="${PayVO.pay_Shipping_cost}" pattern="#,###"></fmt:formatNumber>원 = <strong
												id="mk_totalprice" style="color:;"><fmt:formatNumber value="${PayVO.pay_total_money}" pattern="#,###"></fmt:formatNumber>원 <!-- 총 합계금액 --></strong> 
												<span id="mk_order_save_reserve">(배송 후<fmt:formatNumber value="${PayVO.pay_total_point}" pattern="#,###"></fmt:formatNumber>원 적립)<!--  (배송 후 410원 적립)--> </span></strong>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- .table-order-prd -->

					<div class="cnt-box">
						<div class="left-cnt">
							<h3 class="stit">결제방법</h3>
							<div class="table-order-info pay-info">
								<table summary="">
									<caption>결제방법</caption>
									<colgroup>
										<col width="130">
										<col width="*">
									</colgroup>
									<tbody>
										<tr class="nbg">
											<th scope="row"><div class="tb-center">결제내역</div></th>
											<td>
												<div class="tb-left">
													<p>
														${PayVO.pay_tool}<!-- 신용카드&nbsp; 결제성공 - 승인번호 : 00263784 &nbsp;&nbsp;<a
															href="JavaScript:receipt(3)"><img
															src="/images/common/print_cardtax.gif" align="absmiddle"
															border="0"></a><br> -->
													</p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="right-cnt">
							<h3 class="stit">주문자 정보</h3>
							<div class="table-order-info">
								<table summary="">
									<caption>주문자 정보</caption>
									<colgroup>
										<col width="130">
										<col width="*">
									</colgroup>
									<tbody>
										<tr class="nbg">
											<th scope="row"><div class="tb-left">이 름</div></th>
											<td>
												<div class="tb-left">${userVO.user_name }</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><div class="tb-left">이메일</div></th>
											<td>
												<div class="tb-left">${userVO.user_email }</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><div class="tb-left">연락처</div></th>
											<td>
												<div class="tb-left">${userVO.user_phone }<!-- 연락처 --></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //cnt-box -->

					<div class="cnt-box">
						<h3 class="stit">배송지 정보</h3>
						<div class="table-order-info">
							<table summary="이름, 연락처1, 연락처2, 주소, 주문메세지">
								<caption>배송지 정보</caption>
								<colgroup>
									<col width="130">
									<col width="*">
									<col width="130">
									<col width="*">
									<col width="130">
									<col width="*">
								</colgroup>
								<tbody>
									<tr class="nbg">
										<th scope="row"><div class="tb-left">이 름</div></th>
										<td>
											<div class="tb-left">${OrderVO1.receiver_name}<!-- 이름 --></div>
										</td>
										<th scope="row"><div class="tb-left">연락처1</div></th>
										<td>
											<div class="tb-left">
												${OrderVO1.receiver_phone1}<!-- 연락처1 --><br>
											</div>
										</td>
										<th scope="row"><div class="tb-left">연락처2</div></th>
										<td>
											<div class="tb-left">${OrderVO1.receiver_phone2}<!-- 연락처2 --></div>
										</td>
									</tr>
									<tr>
										<th scope="row"><div class="tb-left">주소</div></th>
										<td colspan="5">
											<div class="tb-left">${OrderVO1.receiver_zipcode}:${OrderVO1.receiver_address1}-${OrderVO1.receiver_address2}<!-- 주소 --></div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="tb-left">
												주문메시지 <em class="d-block">(100자내외)</em>
											</div>
										</th>
										<td colspan="5">
											<div class="tb-left">${OrderVO1.receiver_memo}<!-- 주문 메시지 --></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //cnt-box -->

					<div class="admin-msg">
						<label id="hname2">${userVO.user_name}<!-- 수취인 --></label>님의 주문이 완료되었습니다.<br>
						<br> 귀하의 주문확인 번호는 <span style="color: #0000a0; font-weight: bold;">${OrderVO1.order_seq}<!-- 주문번호 --></span>입니다.<br>
						귀하의 제품 구입에 따른 적립금 <span style="color: #0000a0;"><fmt:formatNumber value="${PayVO.pay_total_point}" pattern="#,###"></fmt:formatNumber><!-- 적립금액 --></span>은 배송과
						함께 바로 적립됩니다. <br> 저희가 확인 후 바로 보내드립니다.<br>
						<br>
					</div>
					<div class="btn-foot">
						<a href="/myOrderList.do" class="CSSbuttonWhite">주문확인</a>
					</div>

				</div>
				<!-- .page-body -->
			</div>
			<!-- #order -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>


<%@include file="/WEB-INF/views/include/footer.jsp"%>
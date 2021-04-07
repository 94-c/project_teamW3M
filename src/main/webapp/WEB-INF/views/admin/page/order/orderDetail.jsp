<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>주문 상세</title>

<link href="resources/css/menu.css" rel="stylesheet" type="text/css">
<link href="resources/css/orderDetail.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/css/adminOrderDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js" ></script>

</head>
<body>
<div id="contentWrapper">
	<div id="contentWrap">
		<hr>
		<div id="content">
			<div id="orderSt">
				<div class="tit-pop">
					<h1>주문정보</h1>
					<span class="txt"><em class="order_name">${userInfo.user_name}</em>님께서 
					<em class="order_date"><fmt:formatDate value="${deliveryInfo.order_date}" pattern="yyyy년 MM월 dd일 a h시 mm분"/></em>에 주문하신 내역입니다.</span>
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
									<td><div class="tb-left">${deliveryInfo.order_seq}</div></td>
									<th scope="row"><div class="tb-left">주문일자</div></th>
									<td><div class="tb-left"><fmt:formatDate value="${deliveryInfo.order_date}" pattern="yyyy년 MM월 dd일"/></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주문자</div></th>
									<td><div class="tb-left">${userInfo.user_name}</div></td>
									<th scope="row"><div class="tb-left">진행현황</div></th>
									<td><div class="tb-left">${deliveryInfo.delivery_state}</div></td>
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
								<col width="90">
								<col width="350">
								<col width="90">
								<col width="50">
								<col width="90">
								<col width="50">
								<col width="80">
								<col width="50">
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
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="8">
										<div class="tb-right">(총 상품구매금액 + 배송비) - (사용한 적립금(${payInfo.pay_use_point} point) + 멤버십 추가할인(${salePercent}%)) = <fmt:formatNumber value="${payInfo.pay_total_money}" pattern="#,###"/>원
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
											<a href="/getProduct?prod_code=${opi.prod_code}">${opi.prod_title}</a>
										</div>
									</td>
									<td><div class="tb-center">${opi.order_seq}</div></td>
									<td><div class="tb-center">${opi.prod_amount}</div></td>
									<td><div class="tb-center tb-price">
											<strong><fmt:formatNumber value="${opi.prod_price_sale * opi.prod_amount}" pattern="#,###"/></strong>
										</div></td>
									<td><div class="tb-center">
											<span class="style4"><fmt:formatNumber value="${opi.prod_point * opi.prod_amount}" pattern="#,###"/></span>
										</div></td>
									<td><div class="tb-center">${opi.delivery_state}</div></td>
									<td><div class="tb-center">${opi.delivery_seq}</div></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<h2>결제정보</h2>
					<div class="table-w table-payinfo">
						<table class="table_purchase">
							<caption>결제정보</caption>
							<colgroup>
								<col width="180">
								<col width="250">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">결제수단</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td><div class="tb-center tb-nbold">${payInfo.pay_tool}</div></td>
									<td><div class="tb-center"><fmt:formatNumber value="${payInfo.pay_total_money}" pattern="#,###"/>원 (${payInfo.pay_status})</div></td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td><div class="tb-center">사용한 적립금</div></td>
									<td><div class="tb-center">${payInfo.pay_use_point} point</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">회원 등급별 할인(%)</div></td>
									<td><div class="tb-center">${salePercent}%</div></td>
								</tr>
							</tbody>
						</table>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>주문 내역</title>

<div id="contentWrapper">
	<div id="contentWrap">
		<%@include file="/WEB-INF/views/mypage/myPageCommon.jsp"%>
		<div id="content">
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>주문내역</h2>
					<p class="dsc">
						<span class="fc-blue">${userVO.user_name }</span>님께서 주문하신 내역입니다.
					</p>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="70">
								<col width="100">
								<col width="*">
								<col width="100">
								<col width="90">
								<col width="90">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">번호</div></th>
									<th scope="row"><div class="tb-center">주문일</div></th>
									<th scope="row"><div class="tb-center">상품명</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
									<th scope="row"><div class="tb-center">주문상세</div></th>
									<th scope="row"><div class="tb-center">배송현황</div></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="myOrder" items="${myOrderList}"
									varStatus="index">
									<tr>
										<td><div class="tb-center">${index.count }</div></td>
										<td><div class="tb-center">
												<fmt:formatDate value="${myOrder.order_date }"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</div></td>
										<td><div class="tb-center">${myOrder.prod_title }</div></td>
										<td><div class="tb-center">
												<fmt:formatNumber value="${myOrder.total_cost}"
													pattern="#,###" />
												원
											</div></td>
										<td><div class="tb-center">
												<i><a href="myOrderDetail.do?order_seq=${myOrder.order_seq }"
													style="color: #ff08a0; font-family: '나눔고딕'; font-size: 13px; font-weight: bold;">상세보기</a></i>
											</div></td>
										<td><div class="tb-center">
												<i><a href="deliveryState.do?order_seq=${myOrder.order_seq }"
													style="color: #ff08a0; font-family: '나눔고딕'; font-size: 13px; font-weight: bold;">상세보기</a></i>
											</div></td>
									</tr>
								</c:forEach>
								<c:if test="${empty myOrderList}">
									<tr>
										<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- //주문 내역 리스트 -->

					<!-- 주문 내역 페이징 -->
					<div class="paging"></div>
					<!-- //주문 내역 페이징 -->

					<!-- 주문 내역 info -->
					<ul class="foot-dsc">
						<li>- 상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
						<br>
						<br>
						<li>- 배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
					</ul>
					<!-- //주문 내역 info -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>마이페이지 메인</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css"> 
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<div id="contentWrapper">
	<div id="contentWrap">
		<%@include file="/WEB-INF/views/mypage/myPageCommon.jsp"%>
		<hr>
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<!-- 회원 정보 -->
					<div class="info">
						<div class="user">
							<div class="user-img"></div>
							<div class="user-info">
								<p>
									<label>${userVO.user_name }[${userVO.user_id}]님</label>
									<a href="memberInfoUpdate.do" class="CSSbuttonWhite CSSbuttonMin">수정</a>
								</p>
								<div class="box">
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd>${userVO.user_phone }</dd>
									</dl>
									<dl>
										<!-- 이메일 -->
										<dt>이 메 일</dt>
										<dd>${userVO.user_email }</dd>
									</dl>
									<dl>
										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
										<dd>[${userVO.user_zipcode }] ${userVO.user_address1 }
											${userVO.user_address2 }</dd>
									</dl>
								</div>
							</div>
						</div>
						<dl class="order">
							<dt class="tot">총 주문금액</dt>
							<dd class="tot">
								<strong>0</strong>원
							</dd>
							<dt>적 립 금</dt>
							<dd>
								<strong><fmt:formatNumber value="${userVO.user_point}"
										pattern="#,###" /></strong>원
							</dd>
							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt>
							<dd>
								<a href="#"><strong>0</strong>개</a>
							</dd>
						</dl>
					</div>
					<!-- //회원 정보 -->

					<!-- 회원 그룹 정보 -->
					<!-- //회원 그룹 정보 -->

					<!-- 최근 주문 정보 -->
					<div class="hd">
						<h3>최근 주문 정보</h3>
						<p class="view fe">
								<span class="fc-blue">[${userVO.user_name }]</span>님께서 주문하신 내역 입니다.
						</p>
					</div>
					<div class="tbl">
						<table summary="주문일자, 상품명, 결제금액, 주문상세">
							<caption>최근 주문 정보 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="140">
								<col width="140">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">제품</div></th>
									<th><div class="tb-center">금액</div></th>
									<th><div class="tb-center">상세</div></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="myOrder" items="${myOrderList}"
									varStatus="index">
									<tr>
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
									</tr>
								</c:forEach>
								<c:if test="${empty myOrderList}">
									<tr>
										<td colspan="4"><div class="tb-center">주문내역이 없습니다.</div></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- //최근 주문 정보 -->

					<!-- 최근 등록 게시글 -->
					<div class="hd">
						<h3>최근 등록 게시글</h3>
						<p class="view fe">
								<span class="fc-blue">[${userVO.user_name }]</span>님께서 작성하신 게시글 입니다.
						</p>
					</div>
					<div class="tbl">
						<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">게시글</div></th>
									<th><div class="tb-center">위치</div></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="recent" items="${myRecent}">
												<tr>
													<td scope="col"><div class="tb-center"> <fmt:formatDate value="${recent.inq_date}" pattern="yyyy-MM-dd" /></div></td>
													<c:if test="${recent.table_name eq '문의사항'}">
													<td scope="col"><div class="tb-center"><a
																href='<c:url value='/inquiryContent.do?inq_seq=${recent.inq_seq}'/>'
																class="text-dark">${recent.inq_title}</a></div></td>
													</c:if>
													<c:if test="${recent.table_name eq '후기'}">
													<td scope="col"><div class="tb-center"><a
																href='<c:url value='/reviewContent.do?review_seq=${recent.inq_seq}'/>'
																class="text-dark">${recent.inq_title}</a></div></td>
													</c:if>
													<td scope="col"><div class="tb-center">${recent.table_name}</div></td>
												</tr>
											</c:forEach>
											<c:if test="${empty myRecent}">
										<tr>
										<td colspan="3"><div class="tb-center">등록된 게시글이 없습니다.</div></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- //최근 등록 게시글 -->
				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
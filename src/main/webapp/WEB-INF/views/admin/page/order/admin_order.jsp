<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>주문 관리</title>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">주문 현황 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">Order LIST</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 주문 목록
			</div>
			<form action="changeDeliveryState.mdo" name="deliveryForm">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<colgroup>
									<col width="1px">
								</colgroup>
							<thead>
								<tr>
									<th class="text-center">주문번호</th>
									<th class="text-center">주문상품명</th>
									<th class="text-center">회원ID</th>
									<th class="text-center">회원명</th>
									<th class="text-center">주문날짜</th>
									<th class="text-center">주문금액</th>
									<th class="text-center">구매상태</th>
								</tr>
							</thead>

							<tbody>
							<c:forEach var="purch" items="${purchase}">
								<tr>
									<td class="text-center">${purch.order_seq }</td>
									<td class="text-center">${purch.prod_title }</td>
									<td class="text-center">${purch.user_id }</td>
									<td class="text-center">${purch.user_name }</td>
									<td class="text-center"><fmt:formatDate value="${purch.order_date }" pattern="yyyy-MM-dd" /></td>
									<td class="text-center"><fmt:formatNumber value="${purch.pay_total_money }" pattern="#,###" />원</td>
									<c:if test="${purch.delivery_state eq '배송전' or purch.delivery_state eq '배송중'}">
										<td class="text-center" style="color:black">${purch.delivery_state }</td>
									</c:if>
									<c:if test="${purch.delivery_state eq '배송완료'}">
										<td class="text-center" style="color:black"><b>${purch.delivery_state }</b></td>
									</c:if>
									<c:if test="${purch.delivery_state eq '구매확정' }">
										<td class="text-center" style="color:blue"><b>${purch.delivery_state }</b></td>
									</c:if>
									<c:if test="${purch.delivery_state eq '주문취소' }">
										<td class="text-center" style="color:red"><b>${purch.delivery_state }</b></td>
									</c:if>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						
						
						<div class="searchText">
							<div class="w100" style="padding-right: 10px">
								<select class="form-control form-control-sm" name="searchType"
									id="searchType">
									<option value="nt_title">제목</option>
									<option value="nt_content">내용</option>
								</select>

							</div>
							<div class="w300" style="padding-right: 10px">
								<input type="text" class="form-control form-control-sm"
									name="keyword" id="keyword">
							</div>

							<div>
								<button class="btn btn-sm btn-primary" name="btnSearch"
									id="btnSearch">검색</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

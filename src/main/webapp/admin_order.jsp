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
									<th class="text-center">송장번호</th>
									<th class="text-center">주문번호</th>
									<th class="text-center">주문상품명</th>
									<th class="text-center">회원ID</th>
									<th class="text-center">수령인</th>
									<th class="text-center">주소</th>
									<th class="text-center">연락처1/연락처2</th>
									<th class="text-center">배송메모</th>
									<th class="text-center">주문날짜</th>
									<th class="text-center">구매</th>
									<th class="text-center">구매확정</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td class="text-center">송장번호</td>
									<td class="text-center">주문번호</td>
									<td class="text-center">주문상품명</td>
									<td class="text-center">회원ID</td>
									<td class="text-center">수령인</td>
									<td class="text-center">주소</td>
									<td class="text-center">연락처1/연락처2</td>
									<td class="text-center">배송메모</td>
									<td class="text-center">주문날짜</td>
									<td class="text-center">구매</td>
									<td class="text-center">
									<select name="" id="">
												<option selected="selected" value="before">배송전</option>
												<option value="ing">배송중</option>
												<option value="after">배송완료</option>
												<option value="after">구매확정</option>
												<option value="cancel">주문취소</option>
											</select>
									<%-- <input type="hidden" id="delivery_seq" name="delivery_seq" value="${del.delivery_seq}"> --%>
									<button class="changeState" id="changeState" name="changeState">상태변경</button>
									</td>
								</tr>
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

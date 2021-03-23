<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품 등록</title>

<style type="text/css">
table {
	margin: auto;
}

table, td, th {
	border-collapse: collapse;
	border: 1px solid black;
}
</style>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">관리자 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">코로나 탈출!!!</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 공지사항
			</div>
			<form action="admin_search_notice_list.mdo">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th class="text-center">NO.</th>
									<th class="text-center">상품코드</th>
									<th class="text-center">상품명</th>
									<th class="text-center">섬네일 이미지</th>
									<th class="text-center">원가</th>
									<th class="text-center">할인률</th>
									<th class="text-center">수량</th>
									<th class="text-center">등록일</th>
									<th class="text-center">삭제</th>
									
								</tr>
							</thead>

							<tbody>
								<c:forEach var="prod" items="${getProductList}">
									<tr>
										<td class="text-center">${prod.prod_seq}</td>
										<td class="text-center">${prod.prod_code}</td>
										<td class="text-center"><a
											href='<c:url value='/getProduct.mdo?prod_seq=${prod.prod_seq }'/>'
											class="text-dark">${prod.prod_title }</a></td>
											<td>&nbsp;</td>
										<td class="text-center">${prod.prod_price}</td>
										<td class="text-center">${prod.prod_price_sale}</td>
										<td class="text-center">${prod.prod_amount}</td>
										<td class="text-center"><fmt:formatDate
												value="${prod.prod_regdate}" pattern="yyyy-MM-dd" /></td>
										<td class="text-center"><a class="deleteProduct" href="deleteProduct.mdo?prod_seq=${prod.prod_seq }">삭제</a></td>
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
					<a class="insertProduct" href="insertProductForm.mdo">상품 등록</a>
				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

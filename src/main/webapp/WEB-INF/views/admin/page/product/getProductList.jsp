<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>등록된 상품 목록</title>

<style type="text/css">
table {
	margin: auto;
}

table, td, th {
	border-collapse: collapse;
	border: 1px solid black;
}
#submitbutton {
	margin: 10px;
	float: right;
	margin-left: 3px;
	width: 108px;
	height: 38px;
	font-size: 13px;
	line-height: 38px
}
</style>
<script type="text/javascript">
	//이전 버튼 이벤트
	function fn_prev(page, range, rangSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pagContext.request.contextPath}/getProductList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangSize, searchKeyword) {
		var url = "${pagContext.request.contextPath}/getProductList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pagContext.request.contextPath}/getProductList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/getProductList.mdo";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
</script>
<c:url var="getProductList" value="getProductList.mdo">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 관리 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">상품 관리 페이지</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 상품 목록
				
			</div>
			<form action="#">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th class="text-center">NO.</th>
									<th class="text-center">상품코드</th>
									<th class="text-center">상품명</th>
									<th class="text-center">상품 대표 이미지</th>
									<th class="text-center">원가</th>
									<th class="text-center">할인가</th>
									<th class="text-center">적립금</th>
									<th class="text-center">수량</th>
									<th class="text-center">등록일</th>
									<th class="text-center"></th>
									
								</tr>
							</thead>

							<tbody>
								<c:forEach var="prod" items="${productList}">
									<tr>
										<td class="text-center">${prod.prod_seq}</td>
										<td class="text-center"><b>${prod.prod_code}</b></td>
										<td class="text-center">
											<a href="/getProduct.mdo?prod_seq=${prod.prod_seq }" class="text-dark">${prod.prod_title }</a>
										</td>
										<td>						
											<img src="${prod.prod_title_image}" width="50" height="50">
										</td>
										<td class="text-center">${prod.prod_price}</td>
										<td class="text-center">${prod.prod_price_sale}</td>
										<td class="text-center">${prod.prod_point}</td>
										<c:if test="${prod.prod_amount gt 10}">
											<td class="text-center" style="color:blue">${prod.prod_amount}</td>
										</c:if>
										<c:if test="${prod.prod_amount le 10 and prod.prod_amount gt 0}">
											<td class="text-center" style="color:red">${prod.prod_amount}</td>
										</c:if>
										<c:if test="${prod.prod_amount eq 0}">
											<td class="text-center" style="color:red">SOLD OUT</td>
										</c:if>
										<td class="text-center"><fmt:formatDate value="${prod.prod_regdate}" pattern="yyyy-MM-dd" /></td>
										<td class="text-center"><a class="deleteProduct" href="deleteProduct.mdo?prod_seq=${prod.prod_seq}" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<!-- pagination -->
							<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
									</c:if>

									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="idx">
										<li
											class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
											class="page-link" href="#"
											onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
												${idx} </a></li>
									</c:forEach>

									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- search{s} -->
							<div class="searchText">
								<div class="w100" style="padding-right: 10px">
									<select class="form-control form-control-sm" name="searchType" id="searchType">
										<option value="prod_title">상품명</option>
										<option value="prod_code">상품코드</option>
									</select>

								</div>
								<div class="w300" style="padding-right: 10px">
									<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
								</div>

								<div>
									<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
								</div>
							</div>
							<!-- search{e} -->
					</div>
					<a class="insertProduct" href="insertProductForm.mdo">상품 등록</a>
				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

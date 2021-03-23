<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<table>
		<tr>
			<th>상품코드</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>상품설명</th>
			<th>원가</th>
			<th>할인가</th>
			<th>수량</th>
			<th>등록일</th>
			<th>상품삭제</th>
		</tr>
		<c:forEach var="product" items="${productList }">
			<tr>
				<td>${product.prod_code }</td>
				<td>${product.prod_image }</td>
				<td>${product.prod_title }</td>
				<td>${product.prod_price }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a class="insertProduct" href="insertProductForm.mdo">상품등록</a>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

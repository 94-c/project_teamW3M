<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품 등록</title>

<main>
	<table>
		<tr>
			<th>상품코드</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
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
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

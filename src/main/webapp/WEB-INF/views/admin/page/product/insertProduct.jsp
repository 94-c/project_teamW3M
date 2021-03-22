<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<h1 class="mt-4">상품 등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active"></li>
		</ol>

		<h2 align="center">상품 등록</h2>
		<form id="productForm" name="productForm"
			enctype="multipart/form-date" method="post" align="center">
			<table border="1">
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="prod_code" id="prod_code"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="prod_title" id="prod_title"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="productPrice" id="productPrice"></td>
				</tr>
				<tr>
					<td>할인 가격</td>
					<td><input type="text" name="prod_price_sale"
						id=" prod_price_sale"></td>
				</tr>
				<tr>
					<td>등록 날짜</td>
					<td><input type="text" name="prod_regdate" id="prod_regdate"></td>
				</tr>
				<tr>
					<td>상품 상세 설명</td>
					<td><textarea rows="10" cols="60" name="prod_content"
							id="prod_content"></textarea></td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="prod_title_image"
						id="prod_title_image"></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" value="등록"
						id="addButton"> <input type="button" value="수정"
						id="updateButton"> <input type="button" value="삭제"
						id="deleteButton"> <input type="button" value="목록보기"
						id="listButton"></td>
				</tr>
			</table>
		</form>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

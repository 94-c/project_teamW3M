<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품 등록</title>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 등록</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<form role="form" method="post" name="writeform" action="updateProduct.mdo" >
	<div class="card-body">
	
		<div class="form-group">
			<label for="exampleFormControlInput1">상품코드</label>
			<input type="text" class="form-control" id="prod_code" name="prod_code" value="${getProduct.prod_code }">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">상품명</label> <input type="text"
				class="form-control" id="prod_title" name="prod_title" value="${getProduct.prod_title}">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">원가</label> <input type="text" 
			class="form-control" id="prod_price" name="prod_price" value="${getProduct.prod_price }">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">할인률</label> <input type="text"
				class="form-control" id="prod_price_sale" name="prod_price_sale" value="${getProduct.prod_price_sale }">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">수량</label> <input type="text"
				class="form-control" id="prod_amount" name="prod_amount" value="${getProduct.prod_amount }">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">섬네일 이미지</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="file" id="prod_title_image" name="prod_title_image">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">상품 상세 설명</label>
			<pre><textarea class="form-control" id="prod_comment" name="prod_comment" rows="10" >${getProduct.prod_comment }</textarea></pre>
		</div>		
		<div class="form-group">
			<label for="exampleFormControlInput1">상세 이미지</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="file" id="prod_image" name="prod_image">
		</div>

		<button type="submit" class="btn btn-info">수정하기</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href = 'getProductList.mdo'">목록으로</button>

	</div>
</form>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품 등록</title>


<script>
function emptyCheck(){
	
	if($("#nt_title").val() == ""){
		alert("제목을 입력하세요");
		$("##nt_title").focus();
		return;
	}
	else if($("#nt_content").val() == ""){
		alert("내용을 입력하세요");
		$("#nt_content").focus();
		return;
	}else{
		return "finish";
	}
};
</script>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 등록</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<form role="form" method="post" name="writeform" action="insertProduct.mdo" >
	<div class="card-body">
	
		<div class="form-group">
			<label for="exampleFormControlInput1">상품코드</label>
			<input type="text" class="form-control" id="prod_code" name="prod_code" placeholder="(예시: MM-P-L-94-50 / 미세먼지마스크-프리미엄-사이즈-등급-수량)">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">상품명</label> <input type="text"
				class="form-control" id="prod_title" name="prod_title" placeholder="상품명을 작성해주세요.">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">원가</label> <input type="text" 
			class="form-control" id="prod_price" name="prod_price" placeholder="원가를 작성해주세요.">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">할인률</label> <input type="text"
				class="form-control" id="prod_price_sale" name="prod_price_sale" placeholder="할인률(단위 : %) - 숫자만 입력">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">수량</label> <input type="text"
				class="form-control" id="prod_amount" name="prod_amount" placeholder="수량을 작성해주세요.">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">섬네일 이미지</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="file" id="prod_title_image" name="prod_title_image">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">상품 상세 설명</label>
			<pre><textarea class="form-control" id="prod_comment" name="prod_comment" rows="10"></textarea></pre>
		</div>		
		<div class="form-group">
			<label for="exampleFormControlInput1">상세 이미지</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="file" id="prod_image" name="prod_image">
		</div>

		<button type="submit" class="btn btn-info" onclick="javascript:emptyCheck();">등록하기</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href = 'getProductList.mdo'">목록으로</button>

	</div>
</form>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

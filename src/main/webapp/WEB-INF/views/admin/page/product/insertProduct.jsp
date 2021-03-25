<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품 등록</title>

<script>
function emptyCheck(){
	
	if(document.writeform.prod_code.value == ""){
		alert("상품코드를 입력하세요");
		document.writeform.prod_code.focus();
		return false;
	}
	if(document.writeform.prod_title.value == ""){
		alert("상품명을 입력하세요");
		document.writeform.prod_title.focus();
		return false;
	}
	if(document.writeform.prod_price.value == ""){
		alert("원가를 입력하세요");
		document.writeform.prod_price.focus();
		return false;
	}
	if(document.writeform.prod_price_sale.value == ""){
		alert("할인가를 입력하세요");
		document.writeform.prod_price_sale.focus();
		return false;
	}
	if(document.writeform.prod_point.value == ""){
		alert("적립금을 입력하세요");
		document.writeform.prod_point.focus();
		return false;
	}
	if(document.writeform.prod_amount.value == ""){
		alert("수량을 입력하세요");
		document.writeform.prod_amount.focus();
		return false;
	}
	
};
$(document).ready(function(){
	$("#prod_price_sale").click(function(){
		var discount = (100-$("#discount_rate").val())/100;
		var salePrice = $("#prod_price").val() * discount;
		$("#prod_price_sale").val(salePrice);
	});
	$("#prod_point").click(function(){
		var pointRate = $("#point_rate").val()/100;
		var point = $("#prod_price").val() * pointRate;
		$("#prod_point").val(point); 
	});
});
</script>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 관리 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li>상품코드/상품명 작성법 들어갈 곳</li>
		</ol>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 상품 등록
			</div>
			<form role="form" method="post" name="writeform" enctype="multipart/form-data"
				action="insertProduct.mdo" onsubmit="return emptyCheck()">
				<div class="card-body">

					<div class="form-group">
						<label for="exampleFormControlInput1">상품코드</label> <input
							type="text" class="form-control" id="prod_code" name="prod_code"
							placeholder="(상품코드 예시: MM-P-L-94-50 / 미세먼지마스크-프리미엄-사이즈-등급-몇개입)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">상품명</label> <input
							type="text" class="form-control" id="prod_title"
							name="prod_title"
							placeholder="(상품명 예시: W3M 프리미엄 미세먼지마스크 KF94 대형 25개입)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">상품 이미지</label><br> <input
							type="file" id="prod_title_image" name="prod_title_image">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">원가(단위 :원)</label> <input
							type="text" class="form-control" id="prod_price"
							name="prod_price" placeholder="원가를 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">할인율(단위 :%)</label> <input
							type="text" class="form-control" id="discount_rate"
							name="discount_rate" placeholder="할인율을 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">적립률(단위 :%)</label> <input
							type="text" class="form-control" id="point_rate"
							name="point_rate" placeholder="적립률을 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">할인가</label> <input
							type="text" class="form-control" id="prod_price_sale"
							name="prod_price_sale" placeholder="원가와 할인율을 입력후 클릭해주세요."
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">적립금</label> <input
							type="text" class="form-control" id="prod_point"
							name="prod_point" placeholder="원가와 적립률을 입력후 클릭해주세요."
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">수량</label> <input
							type="text" class="form-control" id="prod_amount"
							name="prod_amount" placeholder="수량을 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">상품 상세 설명</label>
						<pre>
							<textarea class="form-control" id="prod_comment"
								name="prod_comment" rows="10"
								placeholder="※상품코드/상품명 입력시 참고용※
(상품코드 예시: MM-P-L-94-50 / 미세먼지마스크-프리미엄-사이즈-등급-몇개입)
(상품명 예시: W3M 프리미엄 미세먼지마스크 KF94 대형 25개입)"></textarea>
						</pre>
					</div>
					<button id="addImage_btn">이미지 추가</button>
					<div class="form-group">
						<label for="exampleFormControlInput1">상세 이미지</label><br>
						<input type="file" id="prod_image" name="prod_image">
					</div>
					<br>
					<button type="submit" class="btn btn-info">등록하기</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href = 'getProductList.mdo'">목록으로</button>

				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

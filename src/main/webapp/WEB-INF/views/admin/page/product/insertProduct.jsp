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
<script>
$(document).ready(function(){
	$("#addButton").click(function(){
		if($("#sel1").val() == "1"){
			alert("상품군을 선택해주세요");
			$("#sel1").focus();
			return;
		}
		if($("#sel2").val() == "2"){
			alert("사이즈를 선택해주세요");
			$("#sel2").focus();
			return;
		}
		if($("#sel3").val() == "3"){
			alert("등급을 선택해주세요");
			$("#sel3").focus();
			return;
		}
		if($("#sel4").val() == "4"){
			alert("개수를 선택해주세요");
			$("#sel4").focus();
			return;
		}
		if($("#prod_code").val() == ""){
			alert("상품코드를 입력해주세요");
			$("#prod_code").focus();
			return;
		}
		if($("#prod_title").val() == ""){
			alert("상품명을 입력해주세요");
			$("#prod_title").focus();
			return;
		}
		if($("#prod_price").val() == ""){
			alert("원가를 입력해주세요");
			$("#prod_pricee").focus();
			return;
		}
		if($("#prod_price_sale").val() == ""){
			alert("할인가를 입력해주세요");
			$("#prod_price_sale").focus();
			return;
		}
		if($("#prod_code").val() == ""){
			alert("상품코드를 입력해주세요");
			$("#prod_code").focus();
			return;
		}
		if($("#prod_amount").val() == ""){
			alert("상품수량을 입력해주세요");
			$("#prod_amount").focus();
			return;
		}
		if($("#prod_content").val() == ""){
			alert("상품상세설명을 입력해주세요");
			$("#prod_content").focus();
			return;
		}
		
		document.productForm.submit();
	});
});

$(document).ready(function(){
	$("#prod_code").click(function(){
		var code = $("#sel1").val() +"-"+ $("#sel2").val() +"-"+ $("#sel3").val()+"-"+ $("#sel4").val();
		$("#prod_code").val(code);
	});
});
</script>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active"></li>
		</ol>

		<h2 align="center">상품 등록</h2><br>
		
		<form id="productForm" name="productForm" enctype="multipart/form-date" method="post" align="center" action="insertProduct.mdo">
			
			<div id="category">
				<select id="sel1">
					<option value="1">===상품군===</option>
					<optgroup label="미세먼지마스크">
						<option value="MM-P">프리미엄</option>
						<option value="MM-N">일반</option>
						<option value="MM-B">블랙</option>
					</optgroup>
					<optgroup label="비말차단마스크">
						<option value="BB-N">일반</option>
					</optgroup>
					<optgroup label="손소독제">
						<option value="SS-N">일반</option>
					</optgroup>
				</select> 
				<select id="sel2">
					<option value="2">===사이즈===</option>
					<optgroup label="미세먼지마스크">
						<option value="L">대형</option>
						<option value="M">중형</option>
						<option value="S">소형</option>
					</optgroup>
					<optgroup label="비말차단마스크">
						<option value="L">대형</option>
						<option value="S">소형</option>
					</optgroup>
					<optgroup label="손소독제">
						<option value="L">대형(591ml)</option>
						<option value="M">중형(354ml)</option>
						<option value="S">소형(236ml)</option>
						<option value="XS">초소형(59ml)</option>
					</optgroup>
				</select>
				<select id="sel3">
					<option value="3">===등급===</option>
					<optgroup label="미세먼지마스크">
						<option value="94">KF-94</option>
						<option value="80">KF-80</option>
					</optgroup>
					<optgroup label="비말차단마스크">
						<option value="AD">KF-AD</option>
					</optgroup>
					<optgroup label="손소독제">
						<option value="ETH">ETH</option>
					</optgroup>
				</select> 
				<select id="sel4">
					<option value="4">===개수===</option>
					<optgroup label="미세먼지마스크">
						<option value="25">25개입</option>
						<option value="50">50개입</option>
					</optgroup>
					<optgroup label="비말차단마스크">
						<option value="30">30개입</option>
					</optgroup>
					<optgroup label="손소독제">
						<option value="1">1개</option>
					</optgroup>
				</select>
			</div>
			<br>
			
			<table border="1">
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="prod_code" id="prod_code" readonly="readonly"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="prod_title" id="prod_title"></td>
				</tr>
				<tr>
					<td>원가</td>
					<td><input type="text" name="productPrice" id="prod_price"></td>
				</tr>
				<tr>
					<td>할인 가격</td>
					<td><input type="text" name="prod_price_sale" id=" prod_price_sale"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="productPrice" id="prod_amount"></td>
				</tr>
				<tr>
					<td>상품 상세 설명</td>
					<td><textarea rows="10" cols="60" name="prod_content" id="prod_comment"></textarea></td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="prod_title_image" id="prod_title_image"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="button" value="등록" id="addButton">
					<input type="button" value="수정" id="updateButton">
					<input type="button" value="삭제" id="deleteButton">
					<input type="button" value="목록보기" id="listButton">
					</td>
				</tr>
			</table>
		</form>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품등록정보 수정</title>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품 관리 페이지</h1>
			<p>※ 상품코드 작성법<p>
				<p>1단계 : MM:미세먼지마스크 / BB:비말차단마스크 / SS:손소독제 / CC:쿨패치 / HH:핫팩 / TT:체온계</p>
				<p>2단계 : P:프리미엄 / N:일반 / B:블랙</p>
				<p>3단계 : L:대형 / M:중형 / S:소형 / XS:초소형 / X:구분없음</p>
				<p>4단계 : 94:KF-94 / 80:KF-80 / AD:KF-AD(비말차단) / ETH:손소독제 / X:구분없음</p>
				<p>5단계 : 50:50개입 / 25:25개입 / 30:30개입(비말차단) / 1:손소독제 / 기타:1box,3box,20,30,1...</p>
			<p>※ 상품명 작성법</p>
				<p>W3M -> 2 -> 1 -> 4 -> 3 -> 5 순으로 작성 / 예시: W3M 일반 비말차단마스크 KF-AD 대형 30개입</p>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 상품등록정보 수정
			</div>
			<form role="form" method="post" name="writeform" action="updateProduct.mdo?prod_seq=${product.prod_seq }" enctype="multipart/form-data">
				<div class="card-body">

					<div class="form-group">
						<label for="exampleFormControlInput1">상품코드</label> <input value="${product.prod_code}"
							type="text" class="form-control" id="prod_code" name="prod_code"
							placeholder="(상품코드 예시: MM-P-L-94-50 / 미세먼지마스크-프리미엄-사이즈-등급-몇개입)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">상품명</label> <input value="${product.prod_title}"
							type="text" class="form-control" id="prod_title" name="prod_title"
							placeholder="(상품명 예시: W3M 프리미엄 미세먼지마스크 KF94 대형 25개입)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">상품 대표 이미지</label><br>
						<input type="file" id="prod_thumb" name="prod_thumb">
						<input type="button" value="취소" onclick="removeFile();">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">원가(단위 :원)</label> <input value="${product.prod_price}"
							type="text" class="form-control" id="prod_price"
							name="prod_price" placeholder="원가를 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">할인율(단위 :%)</label> <input value="${product.prod_discount_rate}"
							type="text" class="form-control" id="prod_discount_rate"
							name="prod_discount_rate" placeholder="할인율을 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">적립률(단위 :%)</label> <input value="${product.prod_point_rate}"
							type="text" class="form-control" id="prod_point_rate"
							name="prod_point_rate" placeholder="적립률을 입력해주세요. (숫자만 입력)">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">할인가</label> <input value="${product.prod_price_sale}"
							type="text" class="form-control" id="prod_price_sale"
							name="prod_price_sale" placeholder="원가와 할인율을 입력후 클릭해주세요."
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">적립금</label> <input value="${product.prod_point}"
							type="text" class="form-control" id="prod_point"
							name="prod_point" placeholder="원가와 적립률을 입력후 클릭해주세요."
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">수량</label> <input value="${product.prod_amount}"
							type="text" class="form-control" id="prod_amount"
							name="prod_amount" placeholder="수량을 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">상품 상세 설명</label> 
						<pre><textarea class="form-control" id="prod_comment" name="prod_comment" rows="3"
								placeholder="※상품코드/상품명 입력시 참고용※
(상품코드 예시: MM-P-L-94-50 / 미세먼지마스크-프리미엄-사이즈-등급-몇개입)
(상품명 예시: W3M 프리미엄 미세먼지마스크 KF94 대형 25개입)">${product.prod_comment}</textarea></pre>
					</div>
					<table id="example">
						<tr>
							<td><input type="button" value="업로드 추가" id="addItemBtn"></td>
							<td><input type="button" value="업로드 삭제" id="deleteItemBtn"></td>
						</tr>
						<tr id="item1" style="display: none">
							<td><input type="file" name="image1"/></td>
						</tr>
					</table>
					<br>
					<button type="submit" class="btn btn-info">수정하기</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='getProductList.mdo'">목록으로</button>
				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
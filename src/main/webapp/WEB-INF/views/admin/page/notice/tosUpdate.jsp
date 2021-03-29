<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항 수정</title>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지 사항</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<input name="nt_seq" type="hidden" value="${getNotice.nt_seq}" />
<form role="form" method="post" name="writeform"
		action="tosUpdate.mdo?tos_writer=${tos.tos_writer }" onsubmit="return emptyCheck()">
	<div class="card-body">
		
		<div class="form-group">
			<label for="exampleFormControlInput1">작성자</label> <input type="text"
				class="form-control" id="tos_writer" name="tos_writer"
				value="${tos.tos_writer }" readonly>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<pre><textarea class="form-control" id="tos_content" name="tos_content" rows="10">${tos.tos_content }</textarea></pre>
		</div>

		<button type="submit" class="btn btn-info ">수정하기</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href = 'tos_content.mdo' ">목록으로</button>
	</div>
</form>

<script>
function emptyCheck(){
	if(document.writeform.tos_content.value==""){
		alert("내용을 입력하세요");
		document.writeform.tos_content.focus();
		return false;
	}
};
</script>




<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

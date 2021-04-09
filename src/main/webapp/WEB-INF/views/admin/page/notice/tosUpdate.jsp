<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<script type="text/javascript" src="resources/js/tos.js" ></script>

<title>공지사항 수정</title>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지 사항</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<form role="form" method="post" name="writeform"
		action="tosUpdate.mdo" onsubmit="return emptyCheck()">
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

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

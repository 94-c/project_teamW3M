<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지 사항</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<input name="nt_seq" type="hidden" value="${getNotice.nt_seq}" />
<div class="card-body">
	<form role="form" method="post"
		action="admin_notice_update.mdo?nt_seq=${getNotice.nt_seq}">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="nt_title" name="nt_title"
				value="${getNotice.nt_title }">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">작성자</label> <input type="text"
				class="form-control" id="nt_writer" name="nt_writer"
				value="${getNotice.nt_writer }" readonly>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<pre><textarea class="form-control" id="nt_content" name="nt_content" rows="10">${getNotice.nt_content }</textarea></pre>
		</div>

		<button type="submit" class="btn btn-info ">수정하기</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href = 'admin_notice_list.mdo' ">목록으로</button>
	</form>
</div>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

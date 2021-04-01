<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항 수정</title>
<script type="text/javascript" src="resources/js/notice.js" ></script>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지 사항</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<input name="nt_seq" type="hidden" value="${getNotice.nt_seq}" />
<form role="form" method="post" name="writeform"
		action="admin_notice_update.mdo?nt_seq=${getNotice.nt_seq}" onsubmit="return emptyCheck()">
	<div class="card-body">
		<c:if test="${getNotice.nt_imp eq '1'}">
			<div class="form-group">
				<label for="checked">중요 <input type="checkbox" id="nt_imp"
					name="nt_imp" value="1" checked="checked" />
				</label>
				<select id="nt_color" name="nt_color">
				<optgroup label="색상을 선택하세요">
					<option value="#000000">Black</option>
					<option value="#FF0000">Red</option>
					<option value="#FFA500">Orange</option>
					<option value="#FFFF00">Yellow</option>
					<option value="#008000">Green</option>
					<option value="#0000FF">Blue</option>
					<option value="#A52A2A">Brown</option>
					<option value="#FF08A0">Pink</option>
					<option value="#EE82EE">Violet</option>
				</optgroup>
			</select>

			</div>
		</c:if>
		<c:if test="${getNotice.nt_imp ne '1'}">
			<div class="form-group">
				<label for="checked">중요 <input type="checkbox" id="nt_imp"
					name="nt_imp" value="1"/>
				</label>
				<select id="nt_color" name="nt_color">
					<optgroup label="색상을 선택하세요">
						<option value="#000000">Black</option>
						<option value="#FF0000">Red</option>
						<option value="#FFA500">Orange</option>
						<option value="#FFFF00">Yellow</option>
						<option value="#008000">Green</option>
						<option value="#0000FF">Blue</option>
						<option value="#A52A2A">Brown</option>
						<option value="#FF08A0">Pink</option>
						<option value="#EE82EE">Violet</option>
					</optgroup>
				</select>
			</div>
		</c:if>
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
	</div>
</form>






<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

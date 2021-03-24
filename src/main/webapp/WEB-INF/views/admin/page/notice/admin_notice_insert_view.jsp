<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항 등록</title>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지 사항</h1>
		<ol class="breadcrumb mb-4">
		</ol>
	</div>
</main>
<form role="form" method="post" name="writeform" action="admin_notice_insert.mdo" onsubmit="return emptyCheck()" >
	<div class="card-body">
		<div class="form-group">
			<label for="checked">중요 <input type="checkbox" id="nt_imp"
				name="nt_imp" value="1" />
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
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="nt_title" name="nt_title"
				placeholder="제목을 작성해주세요.">
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">작성자</label> <input type="text"
				class="form-control" id="nt_writer" name="nt_writer" value="관리자"
				readonly>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<pre><textarea class="form-control" id="nt_content" name="nt_content" rows="10"></textarea></pre>
		</div>

		<button type="submit" class="btn btn-info">등록하기</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href = 'admin_notice_list.mdo'">목록으로</button>

	</div>
</form>
<script>
		window.onload = function(){
		    console.log('checkedBox is ' + document.getElementById('checked').checked);
		    console.log('uncheckedBox is ' + document.getElementById('unchecked').checked);
		};
		
		function emptyCheck(){
			
			if(document.writeform.nt_title.value==""){
				alert("제목을 입력하세요");
				document.writeform.nt_title.focus();
				return false;
			}
			if(document.writeform.nt_content.value==""){
				alert("내용을 입력하세요");
				document.writeform.nt_content.focus();
				return false;
			}
		};
</script>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

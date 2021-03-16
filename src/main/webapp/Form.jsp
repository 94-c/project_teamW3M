<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<form role="form" method="post" action="insertNotice.do">
		<div class="card-body">
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> 
						<input type="text" class="form-control" id="nt_title" name="nt_title" placeholder="제목을 작성해주세요.">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">작성자</label> 
						<input type="text" class="form-control" id="nt_writer" name="nt_writer" value="관리자" readonly>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<textarea class="form-control" id="nt_content" name="nt_content" rows="10"></textarea>
					</div>
					 
					<button type="submit" class="btn btn-info " onclick = "location.href = 'insertNotice.do' ">등록하기</button>
					<button type="button" class="btn btn-secondary" onclick = "location.href = 'getNoticeList.do' ">목록으로</button>
   					 
   		</div>
		</form>
</body>
</html>
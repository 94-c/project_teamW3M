<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" method="post" action="getNoticeList.do">
<table border="1">
	<tbody>
		<tr>
			<td>
				<label for="title">제목</label><input type="text" id="title" name="nt_title"/>
			</td>
		</tr>
		<tr>
			<td>
				<label for="writer">작성자</label><input type="text" id="writer" name="nt_writer"/>
			</td>
		</tr>
		<tr>
			<td>
				<label for="content">내용</label><textarea id="content" name="nt_content"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit">등록하기</button>
			</td>
		</tr>
	</tbody>
</table>
</form>
</body>
</html>
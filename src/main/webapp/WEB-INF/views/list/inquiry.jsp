<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
</head>
<body>
<form role="form" method="post" action="inquiry_write_view.do">
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>직성자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${inquiryList}" var="list">
			<tr>
				<td>${list.inq_seq }</td>
				<td>${list.inq_title }</td>
				<td>${list.inq_content }</td>
				<td>${inquiry.inq_cnt }</td>
				<td><button type="submit">글쓰기</button></td>
			</tr>
		</c:forEach>
		
	</tbody>
</table>
</form>
</body>
</html>
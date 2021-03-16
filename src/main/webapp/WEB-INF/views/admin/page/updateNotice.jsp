<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.notice.admin.dao.NoticeDAO"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
	
</head>
<body>
		
		<input name="nt_seq" type="hidden" value="${getNotice.nt_seq}" />
		<div class="card-body">
		<form role="form" method="post" action="updateNotice.do?nt_seq=${getNotice.nt_seq}">
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> 
						<input type="text" class="form-control" id="nt_title" name="nt_title" value="${getNotice.nt_title }">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">작성자</label> 
						<input type="text" class="form-control" id="nt_writer" name="nt_writer" value="${getNotice.nt_writer }" readonly>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<textarea class="form-control" id="nt_content" name="nt_content" rows="10">${getNotice.nt_content }</textarea>
					</div>
					 
					<button type="submit" class="btn btn-info ">수정하기</button>
					<input type="button" value="삭제하기" class="btn btn-info" id="submitbutton" onclick="location.href='deleteNotice.do?nt_seq=${getNotice.nt_seq}'" />
					<button type="button" class="btn btn-secondary" onclick = "location.href = 'getNoticeList.do' ">목록으로</button>
					</form>
   		</div>
   		
</body>
</html>
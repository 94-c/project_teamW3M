<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/user.js"></script>
 
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form action="insert_success.do" method="post" id="signform">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" id="user_name"/></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" id="user_id"/></td>
				<td><a href= "#">중복확인</a></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_password" id="user_password"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="user_password2" id="user_password2"/></td>
			</tr>
			<tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="user_address" id="user_address"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="user_birthday" id="user_birthday" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="user_sex" id="user_sex"/></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" name="user_email" id="user_email"/></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td><input type="text" name="user_phone" id="user_phone"/></td>
			</tr>
				<td colspan="2"><input type="button" value="회원가입" onclick="User_Check()"/>
				<input type="reset" value="다시입력"/></td>
				
			</tr>
		</table>
	</form>
</body>
</html>
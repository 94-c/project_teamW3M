<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form action="insert_success.do" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" /></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" /></td>
				<td><a href= "#">중복확인</a></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_password" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="user_password2" /></td>
			</tr>
			<tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="user_address" /></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="user_birthday" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="user_sex" /></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" name="user_email" /></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td><input type="text" name="user_phone" /></td>
			</tr>
				<td colspan="2"><input type="submit" value="회원가입" /></td>
				
			</tr>
		</table>
	</form>
</body>
</html>
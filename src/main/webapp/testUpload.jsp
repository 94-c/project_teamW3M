<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form name="fileForm" action="testUpload.do" method="post" enctype="multipart/form-data">
        <input type="file" name="mask_image" />
        <input type="text" name="src" />
        <input type="submit" value="전송" />
    </form>
</body>
</html>

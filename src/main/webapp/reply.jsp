<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.comment-edit,
.comment-edit-enabled .comment-show {
  display:none;
}

.comment-edit-enabled .comment-edit {
  display:inherit;
}
</style>

</head>
<body>
<div id="comment-111" class=""> <!-- 첫번째 댓글 -->
  <div class="comment-show">
    <!-- comment-show 코드 ... -->
    <a onclick="$('#comment-111').addClass('comment-edit-enabled')">Edit</a>
  </div>
  <div class="comment-edit">
    <!-- comment-edit 코드 ... -->
    <a onclick="$('#comment-111').removeClass('comment-edit-enabled')">Cancel</a>
  </div>
</div>
</body>
</html>
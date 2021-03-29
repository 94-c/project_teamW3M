<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form name="updateform" action="updateReply.mdo?inq_seq=${inquiryVO.inq_seq}" method="post">
<input type="hidden" id="re_seq" name="re_seq" value="${replyList.re_seq}" />
<input type="hidden" id="inq_seq" name="inq_seq" value="${inquiryVO.inq_seq}" />
<textarea id="reply_text" name="re_content_up" style="font-family: 굴림체;">${replyList.re_content}</textarea>
<input type="button" value="수정" class="CSSbuttonBlack" id="replybutton" onclick="update()"/>
</form>
<script type="text/javascript">
function update()
{
	var updateform = document.updateform;

	updateform.submit();

	}
</script>
</body>
</html>
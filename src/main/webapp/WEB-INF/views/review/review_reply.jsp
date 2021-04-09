<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<title>댓글</title>
<head>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico"
	type="image/x-icon">
<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
<link type="text/css" rel="stylesheet" href="resources/css/reply.css">
<style type="text/css">
.popup_bbs {
	display: block;
	overflow: hidden;
	position: relative;
	padding: 32px 0 16px;
	font-size: 18px;
	font-weight: 500;
	color: #000;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.comment_view {
	display: table;
	width: 100%;
	position: relative;
	padding: 19px 0 16px;
	table-layout: fixed;
	box-sizing: border-box;
}
</style>
</head>

<body>
	<div id="reply">
		<div class="tab-area">
			<div class="title-box">댓글</div>
		</div>
		<div class="comment_view">
			<table id="re_table">
				<c:forEach items="${reviewReplyList}" var="reviewList">
					<input type="hidden" id="review_seq" name="review_seq"
						value="${reviewList.review_seq}" />
					<input type="hidden" id="review_re_seq" name="review_re_seq"
						value="${reviewList.review_re_seq}" />
					<label><i>${reviewList.review_re_writer}</i></label>
					<font id="commentDate"><fmt:formatDate
							value="${reviewList.review_re_date}" pattern="yyyy-MM-dd HH:mm" /></font>
					<c:set var="user_member_id" value="${userVO.user_id }" />
					<c:set var="user_review_id" value="${reviewList.review_re_writer }" />
					<c:if test="${user_member_id eq user_review_id}">
						<a
							href="javascript:void(window.open('replyUpdate_view.do?review_re_seq=${reviewList.review_re_seq}', '_blank','width=430px, height=340px, status=no, menubar=no, toolbar=no, resizable=no'))">
							수정</a>
						<a
							href="deleteReviewReply.do?review_re_seq=${reviewList.review_re_seq}&review_seq=${reviewVO.review_seq}">
							삭제</a>
						<br>
					</c:if>
					<pre>${reviewList.review_re_content}</pre>
					<br>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
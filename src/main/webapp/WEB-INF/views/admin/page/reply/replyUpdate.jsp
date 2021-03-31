<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/menu.css">
<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
<link type="text/css" rel="stylesheet" href="resources/css/notification.css">
<link type="text/css" rel="stylesheet" href="resources/css/comment.css">
</head>
<body>
<form id="comment_form" name="comment" action="replyUpdate.do" method="post">
				<input type="hidden" name="review_re_seq" class="MS_input_txt input-style input-style2" value="${replyVO.review_re_seq }">
						<table>
							<colgroup>
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<td class="com-wrt-box">
										<div>
											<div class="wrt">
												<label>아이디</label>
												<span>
												<input type="text" name="review_re_writer" class="MS_input_txt input-style input-style2" value="${userVO.user_id }" onclick="CheckLogin()"
													onkeypress="CheckLogin()" placeholder="아이디"></span>
												<label>비밀번호</label>
												<span>
												<input type="password" name="review_re_pass" class="MS_input_txt input-style input-style2" value="" onclick="CheckLogin()" onkeypress="CheckLogin()" placeholder="패스워드">
												</span>
											</div>
											<div class="wrt wrt_write">
												<textarea name="review_re_content" onchange="Checklength(this);" onkeyup="Checklength(this);" onclick="CheckLogin()" placeholder="내용">${replyVO.review_re_content }</textarea><br>
											</div>
										</div>
										<input type="submit" class="CSSbuttonBlack" id="contentbutton" value="수정">
									</td>
								</tr>
							</tbody>
						</table>
				</form>
</body>
</html>
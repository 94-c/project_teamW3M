<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form id="comment_form" name="comment" action="insertReviewReply.do" method="post">
				<input type="hidden" name="review_seq" class="MS_input_txt input-style input-style2" value="${reviewVO.review_seq }">
					<fieldset>
						<legend>코멘트 쓰기</legend>
						<table summary="코멘트 쓰기" class="comment-box comment-write">
							<caption>코멘트 쓰기</caption>
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
												<input type="password" name="review_re_pass" class="MS_input_txt input-style input-style2" value=""
													onclick="CheckLogin()" onkeypress="CheckLogin()" placeholder="패스워드">
												</span>
											</div>
											<div class="wrt wrt_write">
												<textarea name="review_re_content" onchange="Checklength(this);" onkeyup="Checklength(this);" onclick="CheckLogin()" placeholder="내용"></textarea>
												<a href="javascript:submitForm()" class="CSSbuttonBlack">댓글쓰기</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>후기 게시판</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<div class="bbs-tit">
						<h3>후기게시판</h3>
					</div>
					<div class="bbs-table-write">
						<form role="form" method="post" action="updateReview.do">
						<input name="review_seq" type="hidden" value="${getReview.review_seq}" />
							<fieldset>
								<legend>일반게시판 쓰기</legend>
								<table summary="">
									<caption>게시판 글쓰기</caption>
									<colgroup>
										<col width="135">
										<col width="395">
										<col width="155">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><div>이름</div></th>
											<td><div>
													<input id="bw_input_writer" type="text" name="review_writer" class="MS_input_txt input_style1" value="${getReview.review_writer}" readonly="readonly">
												</div></td>
										</tr>
										<tr>
											<th><div>제목</div></th>
											<td colspan="3"><div>
												<input id="bw_input_title" type="text" class="MS_input_txt input_style1" name="review_title" value="${getReview.review_title}">
												</div></td>
										</tr>
										<tr>
											<th><div>내용</div></th>
											<td colspan="3" class="text_content">
												<div>
													<textarea id="MS_text_content" name="review_content" onfocus="clear_content()" class="MS_input_txt" style="font-family: 굴림체;">${getReview.review_content}</textarea>
													<input type="hidden" name="mobile_content_type" value="">
												</div>
											</td>
										</tr>
										<tr>
											<th><div>파일</div></th>
											<td colspan="3">
												<div>
													<input type="file" name="inq_mask" value="파일추가">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</fieldset>
							<!-- //게시판 글쓰기 -->

							<!-- 하단 버튼 -->
							<dl class="bbs-link bbs-link-btm">
								<dt></dt>
								<dd>
									<button type="submit" class="CSSbuttonBlack" id="contentbutton">수정하기</button>
								</dd>
							</dl>
							<!-- //하단 버튼 -->
						</form>
					</div>
				</div>
				<!-- .page-body -->
			</div>
			<!-- #bbsData -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
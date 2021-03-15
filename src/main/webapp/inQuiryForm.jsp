<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<title>문의 게시판</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link type="text/css" rel="stylesheet" href="resources/css/main.css">
<link type="text/css" rel="stylesheet" href="resources/css/border.css">
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<!-- 게시판 리스트 -->
					<div class="bbs-hd">
						<ul class="link">
							<li class="last"><a href="#">공지사항</a>
							</li>
							<li><a href="#">문의게시판</a></li>
							<li><a href="#">상품후기</a></li>
							<li><a href="#">이벤트</a></li>
							<li><a href="#">웰콤의 드림랜드</a>
							</li>
							<li><a href="#">웰키의 다이어리</a>
							</li>
							<li><a href="#">미디어룸</a></li>
						</ul>
					</div>
					<!-- .bbs-hd -->
					<!-- //게시판 리스트 -->
					<div class="bbs-tit">
						<h3>문의게시판</h3>
					</div>
					<div class="bbs-table-write">
						<form name="form1" action="board.html" method="post" enctype="multipart/form-data" style="position: relative;" autocomplete="off">
							<div id="passimg" name="passimg"
								style="position: absolute; visibility: hidden; z-index: 999;"></div>
							<input type="hidden" name="attach1" value=""> <input
								type="hidden" name="type" value="i"> <input
								type="hidden" name="data" value="yes"> <input
								type="hidden" name="code" value="pgreen1364"> <input
								type="hidden" name="num1" value=""> <input type="hidden"
								name="num2" value=""> <input type="hidden" name="page"
								value="1"> <input type="hidden" name="ok" value="N">
							<input type="hidden" name="board_cate" value=""> <input
								type="hidden" name="b_score[1]" value=""> <input
								type="hidden" name="b_score[2]" value=""> <input
								type="hidden" name="b_score[3]" value=""> <input
								type="hidden" name="b_score[4]" value=""> <input
								type="hidden" name="b_score[5]" value=""> <input
								type="hidden" name="branduid" value=""> <input
								type="hidden" name="BRO_CHK_KEY"
								value="3751e42000cd232016e584bc98828683331862241006295dd87e0fed6a92417d">
							<input type="hidden" name="lock" value="Y">
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
													<input id="bw_input_writer" type="text" name="hname"
														class="MS_input_txt input_style1" readonly="readonly"
														>
												</div></td>
											<th><div>비밀번호</div></th>
											<td>
												<div>
													<input id="bw_input_passwd" type="password" name="passwd" class="MS_input_txt input_style"> 
													<font color="red">자동 잠금 기능</font>
												</div>
											</td>
										</tr>
										<tr>
											<th><div>이메일</div></th>
											<td colspan="3"><div>
													<input id="bw_input_email" type="text" class="MS_input_txt input_style1" name="email">
												</div></td>
										</tr>
										<tr>
											<th><div>제목</div></th>
											<td colspan="3"><div>
												<input id="bw_input_title" type="text" class="MS_input_txt input_style1" name="title">
												</div></td>
										</tr>
										<tr>
											<th><div>내용</div></th>
											<td colspan="3" class="text_content">
												<div>
													<textarea id="MS_text_content" name="content" wrap="off" onfocus="clear_content()" class="MS_input_txt" style="font-family: 굴림체;">
													</textarea>
													<input type="hidden" name="mobile_content_type" value="">
												</div>
											</td>
										</tr>
										<tr>
											<th><div>파일</div></th>
											<td colspan="3">
												<div>
													<input id="bw_input_file" type="text" class="MS_input_txt input_style2" name="file_name1" value="" onfocus="this.blur();upalert()"> 
													<a href="javascript:upload('file_name1');" class="btn_file">첨부</a>
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
									<a href="JavaScript:send();" class="CSSbuttonBlack">등록하기</a> 
									<a href= "#" class="CSSbuttonWhite">목록보기</a>
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
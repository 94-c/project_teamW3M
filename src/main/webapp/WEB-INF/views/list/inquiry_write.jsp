<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<title>문의 게시판</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link type="text/css" rel="stylesheet" href="resources/css/main.css">
<link type="text/css" rel="stylesheet" href="resources/css/border.css">
<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<div class="bbs-tit">
						<h3>문의게시판</h3>
					</div>
                     <c:if test="${product.prod_code != null}">
                     <dl class="prd-tinfo">
                            <dt>
                                <a href="#qwer"><img src="${product.prod_title_image }"></a>
                            </dt>
                            <dd>
                                <ul>
                                    <li class="name"><span class="tit">상품명 : </span> <a href="#qwer">${product.prod_title }</a> <span class="MK-product-icons"></span></li>
                                    <li class="price"><span class="tit">상품가 : &nbsp;</span><fmt:formatNumber value="${product.prod_price_sale}" pattern="#,###" /></li>
                                </ul>
                            </dd>
                      	</dl>
                      </c:if>
					<div class="bbs-table-write">
<!-- 				<form role="form" method="post" action="inquiry_write.do">  -->		
						    <form name="writeform" action="inquiry_write.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="lock" value="Y">
							<input type="hidden" name="prod_code" value="${product.prod_code }">
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
													<input id="writer_check" type="text" name="inq_writer" class="MS_input_txt input_style1" value="${userVO.user_name}">
												</div></td>
											<th><div>비밀번호</div></th>
											<td>
												<div>
													<input id="pass_check" type="password" name="inq_pass" class="MS_input_txt input_style"> 
												</div>
											</td>
										</tr>
										<tr>
											<th><div>이메일</div></th>
											<td colspan="3"><div>
													<input id="email_check" type="text" class="MS_input_txt input_style1" name="inq_email" value="${userVO.user_email}">
												</div></td>
										</tr>
										<tr>
											<th><div>제목</div></th>
											<td colspan="3"><div>
												<input id="title_check" type="text" class="MS_input_txt input_style1" name="inq_title">
												</div></td>
										</tr>
										<tr>
											<th><div>내용</div></th>
											<td colspan="3" class="text_content">
												<div>
												<textarea id="content_check" name="inq_content" wrap="off" onfocus="clear_content()" class="MS_input_txt" style="font-family: 굴림체;"></textarea>
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
									<button type="button" class="CSSbuttonBlack" id="contentbutton" onclick="blankCheck()">등록하기</button>
								<!-- 	<a href= "#" class="CSSbuttonWhite">목록보기</a> -->
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
<script type="text/javascript">

function blankCheck()
{
	var writeform = document.writeform;
	var pass = writeform.pass_check.value;
	var title = writeform.title_check.value;
	
	if(!pass){
		alert("비밀번호를 입력해주세요.")
		document.getElementById('pass_check').focus();
		} else if(!title){
			document.getElementById('title_check').value = '제목없음';
			writeform.submit();
		}
		else{
			writeform.submit();

	}
}


</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
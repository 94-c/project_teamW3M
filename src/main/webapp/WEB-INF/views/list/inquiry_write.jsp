<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.inquiry.user.dao.InquiryDAO"%>
<%@page import="com.spring.w3m.inquiry.user.vo.InquiryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<div id="contentWrapper">
	<div id="contentWrap">
		<link href="resources/css/notification.css" rel="stylesheet"
			type="text/css">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<!-- //게시판 리스트 -->
					<div class="bbs-tit">
						<h3>문의게시판</h3>
					</div>
					<div class="bbs-table-write">
						<form role="form" method="post" action="inquiry_write.do">
							<table border="1">
								<tbody>
									<tr>
										<div class="title">
											<td><label for="title">제목</label><input type="text"
												id="bw_input_writer" name="inq_title"
												class="MS_input_txt input_style1" /></td>
									</tr>
									<tr>
										<td><label for="writer">작성자</label><input type="text"
											id="bw_input_writer" name="inq_writer"
											class="MS_input_txt input_style1" /></td>
									</tr>

									<tr>
										<td><label for="content">내용</label> <textarea
												id="content" name="inq_content"></textarea></td>
									</tr>
									<tr>
										<td>
											<button type="submit">등록하기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
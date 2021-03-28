<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.review.user.dao.ReviewDAO"%>
<%@page import="com.spring.w3m.review.user.vo.ReviewVO"%>
<title>후기 게시판</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
<link href="resources/css/notification.css" rel="stylesheet" type="text/css">

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<a href="getUserNoticeList.do"> <img
						src="resources/images/title/review_title.jpg"></a>
					<form role="form" method="post" action="review_write_view.do">
						<div class="bbs-tit">
							<h3>후기게시판</h3>
							
								<button type="submit" class="CSSbuttonBlack" id="submitbutton">글쓰기</button>
							
						</div>

						<!-- 게시판 목록 -->
						<div class="bbs-table-list">

							<table border="1" summary="No, content,Name,Date,Hits">
								<caption>일반게시판 게시글</caption>
								<colgroup>
									<col width="70">
									<col width="35">
									<col width="*">
									<col width="110">
									<col width="110">
									<col width="75">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO.</div></th>
										<th scope="col"><div class="tb-center">&nbsp;</div></th>
										<th scope="col"><div class="tb-center">후기</div></th>
										<th scope="col"><div class="tb-center">작성자</div></th>
										<th scope="col"><div class="tb-center">날짜</div></th>
										<th scope="col"><div class="tb-center">조회수</div></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="inquiryVO" items="${inquiryList}">
										<tr>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_seq}</div></td>
											<td scope="col"><div class="tb-center">&nbsp;</div></td>
											<td scope="col"><div class="tb-center">
													<a
														href='<c:url value='/inquiryContent.do?inq_seq=${inquiryVO.inq_seq}'/>'
														class="text-dark">${inquiryVO.inq_title}</a>
												</div></td>
											<td scope="col"><div class="tb-center">
													<c:if
														test="${inquiryVO.inq_writer ne null && inquiryVO.inq_writer!=''}"></c:if>
												</div></td>
											<td scope="col"><div class="tb-center">
													<fmt:formatDate value="${inquiryVO.inq_date}"
														pattern="yyyy-MM-dd" />
												</div></td>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_cnt}</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<br>
							<!-- pagination -->
							<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
									</c:if>

									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="idx">
										<li
											class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
											class="page-link" href="#"
											onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
												${idx} </a></li>
									</c:forEach>

									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- search{s} -->

							<div class="searchText">
								<div class="w100" style="padding-right: 10px">
									<select class="form-control form-control-sm" name="searchType"
										id="searchType">
										<option value="inq_title">제목</option>
										<option value="inq_content">내용</option>
									</select>

								</div>
								<div class="w300" style="padding-right: 10px">
									<input type="text" class="form-control form-control-sm"
										name="keyword" id="keyword">
								</div>

								<div>
									<button class="btn btn-sm btn-primary" name="btnSearch"
										id="btnSearch">검색</button>
								</div>

							</div>
							<!-- search{e} -->
						</div>
					</form>
				</div>
				<!-- //게시판 목록 -->
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<script type="text/javascript">
	//이전 버튼 이벤트
	function fn_prev(page, range, rangSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pagContext.request.contextPath}/inquiry.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangSize, searchKeyword) {
		var url = "${pagContext.request.contextPath}/inquiry.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pagContext.request.contextPath}/inquiry.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/inquiry.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
	});
</script>

<c:url var="getInquirylist" value="inquiry.do">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>

<title>문의 게시판</title>

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<a href="getUserNoticeList.do"> <img
						src="resources/images/title/inquiry_titie.jpg"></a>
					<form role="form" method="post" action="inquiry_write_view.do">
						<div class="bbs-tit">
							<h3>문의게시판</h3>
								<button type="submit" class="CSSbuttonBlack" id="submitbutton">글쓰기</button>
						</div>
						<!-- 게시판 목록 -->
						<div class="bbs-table-list">

							<table border="1" summary="No, content,Name,Date,Hits">
								<caption>일반게시판 게시글</caption>
								<colgroup>
									<col width="100">
									<col width="180">
									<col width="*">
									<col width="110">
									<col width="110">
									<col width="75">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO.</div></th>
										<th scope="col"><div class="tb-center">&nbsp;</div></th>
										<th scope="col"><div class="tb-center">문의</div></th>
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
														test="${inquiryVO.inq_writer ne null && inquiryVO.inq_writer!=''}">${fn:substring(inquiryVO.inq_writer,0,fn:length(inquiryVO.inq_writer)-1)}*</c:if>
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
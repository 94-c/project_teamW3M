<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
<title>내 후기 보기</title>
<script type="text/javascript">
	function fn_prev(page, range, rangSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pagContext.request.contextPath}/myReviewList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangSize, searchKeyword) {
		var url = "${pagContext.request.contextPath}/myReviewList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pagContext.request.contextPath}/myReviewList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}
</script>

<div id="contentWrapper">
	<div id="contentWrap">
		<%@include file="/WEB-INF/views/mypage/myPageCommon.jsp"%>
		<hr>
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<div id="content">
						<div id="myHistory">
							<div class="page-body">
								<!-- 내가 쓴 게시판 목록 -->
								<div class="tit-page-2">
									<h2>후기 게시판</h2>
									<p class="dsc">
										<span class="fc-blue">${userVO.user_name}</span>님께서 작성하신 게시글
										내역입니다.
									</p>
								</div>

								<div class="table-d2-list">
									<table summary="번호, 게시판, 제목, 날짜, hit수">
										<caption>내 후기 리스트</caption>
										<colgroup>
											<col width="75">
											<col width="125">
											<col width="*">
											<col width="115">
											<col width="105">
										</colgroup>
										<thead>
											<tr>
												<th scope="row"><div class="tb-center">NO.</div></th>
												<th scope="row"><div class="tb-center">BOARD</div></th>
												<th scope="row"><div class="tb-center">SUBJECT</div></th>
												<th scope="row"><div class="tb-center">DATE</div></th>
												<th scope="row"><div class="tb-center">HITS</div></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="review" items="${ReviewList}">
												<tr>
													<td scope="col"><div class="tb-center">${review.review_seq}</div></td>
													<td scope="col"><div class="tb-center">문의사항</div></td>
													<td scope="col"><div class="tb-center">
															<a href='<c:url value='/reviewContent.do?review_seq=${review.review_seq}&prod_title=${review.prod_title }'/>'
																class="text-dark">${review.review_title}</a>
														</div></td>
													<td scope="col"><div class="tb-center">
															<fmt:formatDate value="${review.review_date}"
																pattern="yyyy-MM-dd" />
														</div></td>
													<td scope="col"><div class="tb-center">${review.review_cnt}</div></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
								</div>
							</div>
						</div>
					</div>
					<!-- #myHistory -->
				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
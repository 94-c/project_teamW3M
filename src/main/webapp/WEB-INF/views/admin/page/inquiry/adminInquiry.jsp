<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<c:url var="getInquirylist" value="adminInquiry.mdo">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>

<head>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico"
	type="image/x-icon">
<title>문의사항</title>
<script type="text/javascript">
	//이전 버튼 이벤트
	function fn_prev(page, range, rangSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pagContext.request.contextPath}/adminInquiry.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangSize, searchKeyword) {
		var url = "${pagContext.request.contextPath}/adminInquiry.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pagContext.request.contextPath}/adminInquiry.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/adminInquiry.mdo";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
	});
</script>
</head>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">문의 사항</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">문의사항 리스트</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 문의사항
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th class="text-center">NO.</th>
								<th class="text-center">문의</th>
								<th class="text-center">작성자</th>
								<th class="text-center">날짜</th>
								<th class="text-center">조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="list" items="${inquiryList}">
								<tr>
									<td class="text-center">${list.inq_seq}</td>
									<td class="text-center"><a
										href='<c:url value='/admin_inquiry_content.mdo?inq_seq=${list.inq_seq}'/>'
										class="text-dark">${list.inq_title}</a></td>
									<td class="text-center">${list.inq_writer}</td>
									<td class="text-center"><fmt:formatDate
											value="${list.inq_date}" pattern="yyyy-MM-dd" /></td>
									<td class="text-center">${list.inq_cnt}</td>
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
			</div>
		</div>
	</div>
</main>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

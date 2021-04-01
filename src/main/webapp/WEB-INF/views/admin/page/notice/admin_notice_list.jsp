<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항</title>
<c:url var="Noticelist" value="admin_notice_List.mdo">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>
<script type="text/javascript" src="resources/js/notice.js" ></script>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">관리자 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">코로나 탈출!!!</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 공지사항
			</div>
			<form action="admin_search_notice_list.mdo">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th class="text-center">NO.</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성자</th>
									<th class="text-center">날짜</th>
									<th class="text-center">조회수</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="Notice" items="${NoticeList}">
									<tr>
										<td class="text-center">${Notice.nt_seq}</td>
										<td class="text-center"><a
											href='<c:url value='/admin_notice_content.mdo?nt_seq=${Notice.nt_seq}'/>'
											class="text-dark"><strong><font size=2 ><font color="${Notice.nt_color }">${Notice.nt_title }</font></font></strong></a></td>
										<td class="text-center">${Notice.nt_writer}</td>
										<td class="text-center"><fmt:formatDate
												value="${Notice.nt_date}" pattern="yyyy-MM-dd" /></td>
										<td class="text-center">${Notice.nt_count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
									<option value="nt_title">제목</option>
									<option value="nt_content">내용</option>
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
					</div>
				</div>
			</form>
		</div>
	</div>
</main>
<script type="text/javascript">

function fn_prev(page, range, rangSize, searchKeyword){
        		var page = ((range - 2) * rangeSize) + 1;
        		var range = range - 1;
        		var url = "${pagContext.request.contextPath}/admin_notice_list.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/admin_notice_list.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/admin_notice_list.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	$(document).on('click', '#btnSearch', function(e){
        		e.preventDefault();
        		var url = "${pageContext.request.contextPath}/admin_search_notice_list.mdo";
        		url = url + "?searchType=" + $('#searchType').val();
        		url = url + "&keyword=" + $('#keyword').val();
        		location.href = url;
        		console.log(url);
        	});
        	</script>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


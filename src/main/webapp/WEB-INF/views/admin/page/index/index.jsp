<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<c:url var = "getUserlist" value = "loginIndex.mdo">
	<c:param name = "page" value = "${pagination.page }"/>
	<c:param name = "range" value = "${pagination.range }"/>
	<c:param name = "rangeSize" value = "${pagination.rangeSize}"/>
	<c:param name = "searchKeyword" value = "${pagination.searchKeyword}"/>
</c:url>

<script type="text/javascript">
        	//이전 버튼 이벤트
        	function fn_prev(page, range, rangSize, searchKeyword){
        		var page = ((range - 2) * rangeSize) + 1;
        		var range = range - 1;
        		var url = "${pagContext.request.contextPath}/loginIndex.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/loginIndex.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/loginIndex.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	$(document).on('click', '#btnSearch', function(e){
        		e.preventDefault();
        		var url = "${pageContext.request.contextPath}/loginIndex.mdo";
        		url = url + "?searchType=" + $('#searchType').val();
        		url = url + "&keyword=" + $('#keyword').val();
        		location.href = url;
        		console.log(url);
        	});
</script>

<title>관리자 메인페이지</title>
<!-- 관리자 인덱스 페이지 입니다. -->

<main>
	<div class="container-fluid">
		<h1 class="mt-4">관리자 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">코로나 탈출!!!</li>
		</ol>
		<div class="row">
			<div class="col-xl-3 col-md-6">
				<div class="card bg-primary text-white mb-4">
					<div class="card-body"><fmt:formatNumber value="${todaySales}" pattern="#,###"></fmt:formatNumber>원</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="purchase.mdo">금일 매출</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-warning text-white mb-4">
					<div class="card-body">30개</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="purchase.mdo">금일 판매 수</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-success text-white mb-4">
					<div class="card-body">40명</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="purchase.mdo">금일 회원가입 수</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-danger text-white mb-4">
					<div class="card-body">3건</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="purchase.mdo">금일 주문취소 건</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> Area Chart Example
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar mr-1"></i> Bar Chart Example
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 고객 현황
			</div>
			<div class="card-body">
				<div class="table-responsive">

				<div class="searchText" style = "float: right">
					<div class="w100" style="padding-right: 10px" >
							<select class="form-control form-control-sm" name="searchType" id="searchType">
									<option value="user_id">아이디</option>
									<option value="user_name">이름</option>
							</select>
					</div>
					<div class="w300" style="padding-right: 10px">
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				 </div>	<!-- search{e} -->
							
					<br><br>
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th class="text-center">아이디</th>
								<th class="text-center">이름</th>
								<th class="text-center">생년월일</th>
								<th class="text-center">성별</th>
								<th class="text-center">주소(상세주소)</th>
								<th class="text-center">휴대폰번호</th>
								<!-- user_phone -->
								<th class="text-center">가입날짜</th>
								<!-- user_join_date -->
								<th class="text-center">회원상태</th>
								<!-- user_state -->
							</tr>
						</thead>

						<tbody>
							<c:forEach var="user" items="${userList}">
								<tr>
									<td class="text-center">${user.user_id }</td>
									<td class="text-center">${user.user_name }</td>
									<td class="text-center">${user.user_birthday }</td>
									<td class="text-center">${user.user_gender }</td>
									<td class="text-center">${user.user_address1 }</td>
									<td class="text-center">${user.user_phone }</td>
									<td class="text-center"><fmt:formatDate
											value="${user.user_join_date}" pattern="yyyy-MM-dd" /></td>
									<td class="text-center">${user.user_state }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					 <!-- pagination -->
								<div id="paginationBox" >
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
</main>


<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

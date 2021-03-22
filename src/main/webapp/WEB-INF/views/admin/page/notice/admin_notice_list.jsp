<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@page import="com.spring.w3m.login.admin.dao.AdminDAO"%>
<c:url var = "Noticelist" value = "admin_notice_List.mdo">
	<c:param name = "page" value = "${pagination.page }"/>
	<c:param name = "range" value = "${pagination.range }"/>
	<c:param name = "rangeSize" value = "${pagination.rangeSize}"/>
	<c:param name = "searchKeyword" value = "${pagination.searchKeyword}"/>
</c:url>
<head>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico"
	type="image/x-icon">
<title>관리자 페이지</title>
<link href="resources/admin_css/styles.css" rel="stylesheet"
	type="text/css">
	<link href="resources/admin_css/pagination.css" rel="stylesheet"
	type="text/css">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
        	//이전 버튼 이벤트
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
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="loginIndex.mdo"><img
			src="resources/images/h_design/top_w3m.gif"></a>

		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색창"
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="adminLogout.mdo">로그아웃</a> <a
						class="dropdown-item" href="/">홈으로 나가기</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">홈</div>
						<a class="nav-link" href="loginIndex.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 홈
						</a> <a class="nav-link" href="login.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 로그아웃
						</a>

						<div class="sb-sidenav-menu-heading">관리자</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="#">상품 관리</a> <a class="nav-link"
									href="#">상품 재고 관리</a> <a class="nav-link" href="#">상품평 관리</a> <a
									class="nav-link" href="#">상품 문의 관리</a>
							</nav>
						</div>


						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 주문
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="#">주문 관리</a> <a class="nav-link"
										href="#">배송 현황</a>
								</nav>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 공지사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingThree" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="notice">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="admin_notice_list.mdo">글 상세보기</a> <a
										class="nav-link" href="admin_notice_insert_view.mdo">글 등록</a>
								</nav>
							</nav>
						</div>
						<a class="nav-link" href="adminInquiry.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 문의사항
						</a> <a class="nav-link" href="userMemberList.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 고객관리
						</a> <a class="nav-link" href="adminInquiry.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매출통계
						</a> <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 상품통계
						</a>
					</div>
				</div>

				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<!-- admin 로그인 했다는 거 표시를 해야한다. -->
				</div>
			</nav>
		</div>
		<!-- 기본 버튼 -->

		<div id="layoutSidenav_content">
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
													class="text-dark">${Notice.nt_title }</a></td>
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
											id="btnSearch"  >검색</button>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</main>

			<!-- 푸터 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@page import="com.spring.w3m.login.admin.dao.AdminDAO"%>
<!-- 관리자 페이지 header파일입니다. -->

<head>
<!-- CSS -->
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="resources/css/menu.css?t=201912021906">
<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
<!-- JS -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/product_manage.js"></script>

<!-- Image -->
<link rel="shortcut icon" href="resources/images/icons/favicon.ico"	type="image/x-icon">

</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="loginIndex.mdo"><img
			src="resources/images/h_design/top_w3m.gif"></a>

		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색창" aria-label="Search" aria-describedby="basic-addon2" />
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
						class="dropdown-item" href="/">메인 홈으로 나가기</a>
				</div>
			</li>
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
						</a> <a class="nav-link" href="adminLogout.mdo">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 로그아웃
						</a>

						<div class="sb-sidenav-menu-heading">관리자</div>

						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="getProductList.mdo">상품 관리</a> <a class="nav-link"
									href="#">상품 재고 관리</a> <a class="nav-link" href="#">상품평 관리</a> <a
									class="nav-link" href="#">상품 문의 관리</a>
							</nav>
						</div>


						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
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
										<a class="nav-link" href="tos_content.mdo">이용약관</a>
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
						</a> <a class="nav-link" href="#">
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
		<!-- 메인 페이지 -->
		<div id="layoutSidenav_content">
		<!-- 여기까지 헤더 -->
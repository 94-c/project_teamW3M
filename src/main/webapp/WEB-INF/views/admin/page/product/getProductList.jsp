<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
        <title>상품 등록</title>
		<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
        <link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	table {
    				margin:auto; 
					}

			table, td, th {
				    border-collapse : collapse;
				    border : 1px solid black;
					};
        </style>
</head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="loginIndex.mdo"><img src="resources/images/h_design/top_w3m.gif"></a>
            
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="검색창" aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="adminLogout.mdo">로그아웃</a>
                        <a class="dropdown-item" href="/">메인 홈으로 나가기</a>	
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">홈</div>
                            <a class="nav-link" href="loginIndex.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                              	  홈
                            </a>
                            <a class="nav-link" href="adminLogout.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                              	  로그아웃
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">관리자</div>
                            
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	상품
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">상품 등록</a>
                                    <a class="nav-link" href="#">상품 재고 관리</a>
                                    <a class="nav-link" href="#">상품평 관리</a>
                                    <a class="nav-link" href="#">상품 문의 관리</a>
                                </nav>
                            </div>
                            
                            
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	주문
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                   <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">주문 관리</a>
                                    <a class="nav-link" href="#">배송 현황</a>
                                	</nav>
                                </nav>
                            </div>   
                            
                           <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                	공지사항
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingThree" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="notice">
                                   <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="admin_notice_list.mdo">글 상세보기</a>
                                    <a class="nav-link" href="admin_notice_insert_view.mdo">글 등록</a>
                                	</nav>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="adminInquiry.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	문의사항
                            </a>    
                                                        
                           	<a class="nav-link" href="userMemberList.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	고객관리
                            </a>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	매출통계
                            </a>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	상품통계
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
              <!-- 메인부분만 바꿔치기하면 됨 -->
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">상품 등록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                  	
                  	<h2 align = "center">상품 등록</h2>
                  	<form id = "productForm" name = "productForm" enctype = "multipart/form-date" method = "post" align = "center">
						<table border ="1">
							<tr>
								<td>상품코드</td>
								<td><input type = "text" name = "prod_code" id = "prod_code"></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type = "text" name = "prod_title" id = "prod_title"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type = "text" name = "productPrice" id = "productPrice"></td>
							</tr>
							<tr>
								<td>할인 가격</td>
								<td><input type = "text" name = "prod_price_sale" id = " prod_price_sale"></td>
							</tr>
							<tr>
								<td>등록 날짜</td>
								<td><input type = "text" name = "prod_regdate" id = "prod_regdate"></td>
							</tr>
							<tr>
								<td>상품 상세 설명</td>
								<td><textarea rows= "10" cols = "60" name = "prod_content" id = "prod_content" ></textarea></td>
							</tr>
							<tr>
								<td>상품 이미지</td>
								<td><input type = "file" name = "prod_title_image" id = "prod_title_image"></td>
							</tr>
							<tr>
								<td colspan="4" align="center">
									<input type = "button" value = "등록" id = "addButton">
									<input type = "button" value = "수정" id = "updateButton">
									<input type = "button" value = "삭제" id = "deleteButton">
									<input type = "button" value = "목록보기" id = "listButton">
								</td>
							</tr>
						</table>                  	
                  	  </form>
                      </div>
                     </main>
                    
            
           <!-- 푸터 -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>

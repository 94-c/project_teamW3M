<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
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
					<div class="card-body">Primary Card</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-warning text-white mb-4">
					<div class="card-body">Warning Card</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-success text-white mb-4">
					<div class="card-body">Success Card</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-danger text-white mb-4">
					<div class="card-body">Danger Card</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="#">View
							Details</a>
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
				</div>
			</div>
		</div>
	</div>
</main>


<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

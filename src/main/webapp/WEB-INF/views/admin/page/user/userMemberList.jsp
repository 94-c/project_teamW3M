<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>회원 관리 페이지</title>

<c:url var="getUserlist" value="userMemberList.mdo">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico"
	type="image/x-icon">

<script type="text/javascript">
        	//이전 버튼 이벤트
        	function fn_prev(page, range, rangSize, searchKeyword){
        		var page = ((range - 2) * rangeSize) + 1;
        		var range = range - 1;
        		var url = "${pagContext.request.contextPath}/userMemberList.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/userMemberList.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/userMemberList.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	$(document).on('click', '#btnSearch', function(e){
        		e.preventDefault();
        		var url = "${pageContext.request.contextPath}/userMemberList.mdo";
        		url = url + "?searchType=" + $('#searchType').val();
        		url = url + "&keyword=" + $('#keyword').val();
        		location.href = url;
        		console.log(url);
        	});
        	
        	$(document).ready(function aa(){ 
        		
        		var naver = $("#user_sns_naver").val();
        		var kakao = $("#user_sns_kakao").val();
        		if(naver == true ){
        			$("#usersns").val("네이버");
        		}else if(kakao == true){
        			$("#usersns").val("카카오");
        		}else{
        			$("#usersns").val("W3M")
        		}
        	});
</script>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">고객 관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.mdo">통계</a></li>
			<li class="breadcrumb-item active">고객 관리</li>
		</ol>
		<div class="card mb-4"></div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 고객 관리
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<form method="post">
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
									<th class="text-center">회원등급</th>
									<!-- user_state -->
									<th class="text-center">회원상태</th>
									<th class="text-center">가입사이트</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="user" items="${userList}">
									<input type="hidden" id="user_sns_naver"
										value="${user.user_sns_naver}">
									<input type="hidden" id="user_sns_kakao"
										value="${user.user_sns_kakao}">
									<input type="hidden" id="user_seq" value="${user.user_seq }">
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

										<c:if test="${user.user_state eq '일반' }">
											<td class="text-center"><input type="button" value="정지"
												onclick="location.href='updateUserPause.mdo?user_id=${user.user_id}&user_state=${user.user_state }'"
												style="color: red"></td>
										</c:if>
										<c:if test="${user.user_state eq '정지' }">
											<td class="text-center"><input type="button" value="일반"
												onclick="location.href='updateUserPause.mdo?user_id=${user.user_id}&user_state=${user.user_state }'"></td>
										</c:if>
										<c:if test="${user.user_state eq '탈퇴' }">
											<td class="text-center"><input type="button" value="x"></td>
										</c:if>

										<c:if test="${user.user_sns_naver eq 'NAVER'}">
											<td class="text-center"><strong><font
													color="#00ff00">${user.user_sns_naver}</font></strong></td>
										</c:if>
										<c:if test="${user.user_sns_naver eq 'KAKAO'}">
											<td class="text-center"><strong><font
													color="#ffd700">${user.user_sns_naver}</font></strong></td>
										</c:if>
										<c:if test="${user.user_sns_naver eq 'W3M'}">
											<td class="text-center"><strong><font
													color="#FF08A0">${user.user_sns_naver}</font></strong></td>
										</c:if>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
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
								<option value="user_id">아이디</option>
								<option value="user_name">이름</option>
							</select>

						</div>
						<div class="w300" style="padding-right: 10px">
							<input type="text" class="form-control -control-sm"
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

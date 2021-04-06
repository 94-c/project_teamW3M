<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>내 문의사항 보기</title>
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css"> 
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
	<div id="contentWrap">
		<%@include file="/WEB-INF/views/mypage/myPageCommon.jsp"%>
		<hr>
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<!-- 회원 정보 -->
					<div class="info">
						<div class="user">
							<div class="user-img"></div>
							<div class="user-info">
								<p>
									<!-- 이런식으로 나와야 한다. 최형우[hyeognwoo26]님  -->

									<label>${userVO.user_name }[${userVO.user_id}]님</label> <a
										href="memberInfoUpdate.do" class="CSSbuttonWhite CSSbuttonMin">수정</a>

								</p>
								<div class="box">
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd>${userVO.user_phone }</dd>
									</dl>
									<dl>
										<!-- 이메일 -->
										<dt>이 메 일</dt>
										<dd>${userVO.user_email }</dd>
									</dl>
									<dl>
										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
										<dd>${userVO.user_zipcode }${userVO.user_address1 }
											${userVO.user_address2 }</dd>
									</dl>
								</div>
							</div>
						</div>
						<dl class="order">
							<dt class="tot">총 주문금액</dt>
							<dd class="tot">
								<strong>0</strong>원
							</dd>
							<dt>적 립 금</dt>
							<dd>
								<strong><fmt:formatNumber value="${userVO.user_point}"
										pattern="#,###" /></strong>원
							</dd>
						</dl>
					</div>
					<!-- //회원 정보 -->
					<div id="content">
						<div id="myHistory">
							<div class="page-body">
								<!-- 내가 쓴 게시판 목록 -->
								<div class="tit-page-2">
									<h2>문의사항 게시판</h2>
									<p class="dsc">
										<span class="fc-blue">${userVO.user_name}</span>님께서 작성하신 게시글
										내역입니다.
									</p>
								</div>

								<div class="table-d2-list">
									<table summary="번호, 게시판, 제목, 날짜, hit수">
										<caption>내 문의사항 리스트</caption>
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
											<c:forEach var="inquiryVO" items="${inquiryList}">
												<tr>
													<td scope="col"><div class="tb-center">${inquiryVO.inq_seq}</div></td>
													<td scope="col"><div class="tb-center">문의사항</div></td>
													<td scope="col"><div class="tb-center">
															<a
																href='<c:url value='/inquiryContent.do?inq_seq=${inquiryVO.inq_seq}'/>'
																class="text-dark">${inquiryVO.inq_title}</a>
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
<script type="text/javascript">
function fn_prev(page, range, rangSize, searchKeyword){
        		var page = ((range - 2) * rangeSize) + 1;
        		var range = range - 1;
        		var url = "${pagContext.request.contextPath}/myinquryList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/myinquryList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/myinquryList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	$(document).on('click', '#btnSearch', function(e){
        		e.preventDefault();
        		var url = "${pageContext.request.contextPath}/myinquryList.do";
        		url = url + "?searchType=" + $('#searchType').val();
        		url = url + "&keyword=" + $('#keyword').val();
        		location.href = url;
        		console.log(url);
        	});

        	</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>적립금 내역</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
	<div id="contentWrap">
<%@include file="/WEB-INF/views/mypage/orderCommon.jsp"%>
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
									
									<label>${userVO.user_name }[${userVO.user_id}]님</label>
									<a href="memberInfoUpdate.do" class="CSSbuttonWhite CSSbuttonMin">수정</a>
									
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
										<dd>[${userVO.user_zipcode }] ${userVO.user_address1 } ${userVO.user_address2 }</dd>
									</dl>
								</div>
							</div>
						</div>
						<dl class="order">
							<dt class="tot">총 주문금액 </dt>
							<dd class="tot">
								<strong>0</strong>원
							</dd>
							<dt>적 립 금</dt>
							<dd>
								<strong><fmt:formatNumber value="${userVO.user_point}" pattern="#,###" /></strong>원
							</dd>
							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt>
							<dd>
								<a href="#"><strong>0</strong>개</a>
							</dd>
						</dl>
					</div>
					<!-- //회원 정보 -->
					<div id="myReserv">
                    <div class="tit-page-2">
                        <h2>보유중인 적립금</h2>
                        <p class="dsc"><span class="fc-blue">[${userVO.user_name }]</span>님께서 보유하신 적립금 내역입니다.</p>
                    </div>
                    <div class="page-body">
                        <!-- 사용 가능한 적립금액 정보 -->
                        <div class="table-att">
                            <table summary="보유 적립금, 출석체크 누적금">
                                <caption>적립금액</caption>
                                <colgroup>
                                    <col width="360">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><div class="tb-center">총 보유 적립금</div></th>
                                        <td><div class="tb-right"><fmt:formatNumber value="${userVO.user_point}" pattern="#,###" />원<!-- 총 보유 적립금 --></div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>   
                        <!-- //사용 가능한 적립금액 정보 -->
                        
                        <!-- 적립금내역 리스트 -->
                        <h3 class="tit-tb-list">적립금 내역</h3>
                                                <div class="table-d2-list">
                            <table summary="날짜, 적립내역, 적립금">
                                <caption>적립금내역</caption>
                                <colgroup>
                                    <col width="135">
                                    <col width="*">
                                    <col width="150">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="row"><div class="tb-center">날짜</div></th>
                                        <th scope="row"><div class="tb-center">내역</div></th>
                                        <th scope="row"><div class="tb-center">적립금</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="point" items="${pointList}">
                                    <tr>
                                    	<td scope="col"><div class="tb-center"><fmt:formatDate value="${point.use_date}" pattern="yyyy-MM-dd"/></div></td>
                                    	<td scope="col"><div class="tb-center">${point.point_content }</div></td>
                                    	<td scope="col"><div class="tb-center"><fmt:formatNumber value="${point.add_point}" pattern="#,###" /></div></td>
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
                        </div>         
                        <!-- //적립금내역 리스트 -->
                        <tr/><tr/>
                   
                        <!-- 적립금내역 유의사항 -->
                        <ul class="foot-dsc">
                            <li>- 적립된 금액이 1,000원 이상 누적되었을 때, 사용하실 수 있습니다.</li>
                            <li>- 결제 시 적립금 사용 여부를 확인할 수 있는 안내문이 나옵니다.</li>
                        </ul>
                        <!-- //적립금내역 유의사항 -->
                        
                    </div><!-- .page-body -->
                	</div>
					
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
        		var url = "${pagContext.request.contextPath}/getPointList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/getPointList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/getPointList.do";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}

        	</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
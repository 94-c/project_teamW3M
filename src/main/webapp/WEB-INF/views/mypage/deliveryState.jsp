<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>내 후기 보기</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/myPage.js" ></script>
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
<link href="resources/css/notification.css" rel="stylesheet" type="text/css">

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="aside">
			<h2 class="aside-tit">마이페이지</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">쇼핑정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="#">주문내역</a></li>
							<li><a href="#">쿠폰내역</a></li>
							<li><a href="getPointList.do?user_id=${userVO.user_id }">적립금내역</a></li>
							<li><a href="#">오늘본상품</a></li>
							<li><a href="GoCart.do">상품 보관함</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">쇼핑문의</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="myinquryList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내 문의사항 보기</a></li>
							<li><a href="myReviewList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내 후기 보기</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">개인정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="memberInfoUpdate.do">회원정보변경</a></li>
							<li><form action="memberInfoDelete.do" id = "deleteSuccess" method="POST">
							<input type="hidden" name ="user_id" value="${userVO.user_id }">
							<a href="javascript:userexit();" >회원정보탈퇴신청</a></form></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
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
										<dd>${userVO.user_zipcode } ${userVO.user_address1 } ${userVO.user_address2 }</dd>
									</dl>
								</div>
							</div>
						</div>
						<dl class="order">
							<dt class="tot">총 주문금액 :</dt>
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
					<div id="content">
                	<div id="myHistory">
                    <div class="page-body">
                        <!-- 내가 쓴 게시판 목록 -->
                        <div class="tit-page-2">
                            <h2>후기 게시판</h2>
                            <p class="dsc"><span class="fc-blue">${userVO.user_name}</span>님께서 주문하신 주문 내역입니다.</p>
                        </div>
                       
                        <div class="table-d2-list">
                            <table summary="번호, 게시판, 제목, 날짜, hit수">
                                <caption>배송 현황</caption>
                                <colgroup>
                                    <col width="125">
                                    <col width="75">
                                    <col width="115">
                                    <col width="*">
                                    <col width="105">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="row"><div class="tb-center">DATE</div></th>
                                        <th scope="row"><div class="tb-center">송장번호</div></th>
                                        <th scope="row"><div class="tb-center">주문번호</div></th>
                                        <th scope="row"><div class="tb-center">상품명</div></th>
                                        <th scope="row"><div class="tb-center">배송상태</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="d" items="${deliveryState}">
										<tr>
											<td scope="col"><div class="tb-center"><fmt:formatDate value="${d.state_date}"
														pattern="yyyy-MM-dd HH:mm" /></div></td>
											<td scope="col"><div class="tb-center">${d.delivery_seq}</div></td>
											<td scope="col"><div class="tb-center"> ${d.order_seq} </div></td>
											<td scope="col"><div class="tb-center"> ${d.prod_title} </div></td>
											<td scope="col"><div class="tb-center">${d.delivery_state}</div></td>
										</tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                        </div>
                		</div>
           			 </div><!-- #myHistory -->
				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>주문  내역</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>

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
							<li class="first">
							<a href="myinquryList.do?user_name=${userVO.user_name}&user_seq=${userVO.user_seq}">내 문의사항 보기</a></li>
							<li><a href="myReviewList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내 후기 보기</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">개인정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="memberInfoUpdate.do">회원정보변경</a></li>
							<li><form action="memberInfoDelete.do" id="deleteSuccess" method="POST">
							<input type="hidden" name="user_id" value="${userVO.user_id }">
							<a href="javascript:userexit();">회원정보탈퇴신청</a>
							</form></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		
		<div id="content">
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>주문내역</h2>
					<p class="dsc">
						<span class="fc-blue">${userVO.user_name }</span>님께서 주문하신 내역입니다.
					</p>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="70">
								<col width="100">
								<col width="*">
								<col width="100">
								<col width="90">
								<col width="90">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">번호</div></th>
									<th scope="row"><div class="tb-center">주문일</div></th>
									<th scope="row"><div class="tb-center">상품명</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
									<th scope="row"><div class="tb-center">주문상세</div></th>
									<th scope="row"><div class="tb-center">배송현황</div></th>
								</tr>
							</thead>
							<tbody>
								<!-- 여기 다가 주문 목록 넣어주시면 됩니다! -->
								<tr>
									<td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //주문 내역 리스트 -->

					<!-- 주문 내역 페이징 -->
					<div class="paging"></div>
					<!-- //주문 내역 페이징 -->

					<!-- 주문 내역 info -->
					<ul class="foot-dsc">
						<li>- 상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
						<br>
						<br>
						<li>- 배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
					</ul>
					<!-- //주문 내역 info -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
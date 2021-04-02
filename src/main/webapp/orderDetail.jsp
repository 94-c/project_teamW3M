<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>주문 상세</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">
<link href="resources/css/orderDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/myPage.js" ></script>

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
							<li><a href="GoCart.do">상품 보관함</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">쇼핑문의</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="myinquryList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내
									문의사항 보기</a></li>
							<li><a
								href="myReviewList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내
									후기 보기</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">개인정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="memberInfoUpdate.do">회원정보변경</a></li>
							<li><form action="memberInfoDelete.do" id="deleteSuccess"
									method="POST">
									<input type="hidden" name="user_id" value="${userVO.user_id }">
									<a href="javascript:userexit();">회원정보탈퇴신청</a>
								</form></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr>
		<div id="content">
			<div id="orderSt">
				<div class="tit-pop">
					<h1>주문정보</h1>
					<span class="txt"><em class="order_name"><!-- 유저 이름 --></em>님께서 
					<em class="order_date"><!-- 주문 날짜 --></em>에 주문하신 내역입니다.</span>
				</div>
				<!-- 후기등록 탭 -->
				<ul class="tab">
					<li></li>
					<li><a href="javascript:order_view('brdreview', '20210402100008-52455989704');">상품후기등록</a>
					</li>
				</ul>
				<!-- //후기등록 탭 -->
				<div id="orderInfo">
					<h2>주문자정보</h2>
					<div class="table-w table-orderinfo">
						<table summary="">
							<caption>주문자정보</caption>
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><div class="tb-left">주문번호</div></th>
									<td><div class="tb-left"><!-- 주문번호  데이터 --></div></td>
									<th scope="row"><div class="tb-left">주문일자</div></th>
									<td><div class="tb-left"><!-- 주문일자 데이터 --></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주문자</div></th>
									<td><div class="tb-left"><!-- 주문자 이름 --></div></td>
									<th scope="row"><div class="tb-left">주문서 입금현황</div></th>
									<td><div class="tb-left"><!-- 입금 완료, 배송 완료 --></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주문 메모</div></th>
									<td colspan="3"><div class="tb-left"><!-- 주문 메모 --></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2>배송지정보</h2>
					<div class="table-w table-region">
						<table summary="">
							<caption>배송지정보</caption>
							<colgroup>
								<col width="120">
								<col width="*">
								<col width="120">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><div class="tb-left">배송번호</div></th>
									<td>
										<div class="tb-left"><!-- 배송 번호 --></div>
									</td>
									<th scope="row"><div class="tb-left">송장번호</div></th>
									<td>
										<div class="tb-left"><!-- 송장 번호 --></div>
									</td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">수취인</div></th>
									<td><div class="tb-left"><!-- 수령인 --></div></td>
									<th scope="row"><div class="tb-left">연락처</div></th>
									<td><div class="tb-left"><!-- 수령인 번호 --></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">주소</div></th>
									<td colspan="3"><div class="tb-left"><!-- 주소지(zipcod, address1, address2) --></div></td>
								</tr>
								<tr>
									<th scope="row"><div class="tb-left">배송메세지</div></th>
									<td colspan="3"><div class="tb-left"><!-- 배송 메세지 --></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2>주문상품</h2>
					<div class="table-w table-prdinfo">
						<table summary="">
							<caption>주문상품정보</caption>
							<colgroup>
								<col width="84">
								<col width="*">
								<col width="150">
								<col width="70">
								<col width="100">
								<col width="80">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th scope="row" colspan="2"><div class="tb-center">주문상품정보</div></th>
									<th scope="row"><div class="tb-center">상품별주문번호</div></th>
									<th scope="row"><div class="tb-center">수량</div></th>
									<th scope="row"><div class="tb-center">가격</div></th>
									<th scope="row"><div class="tb-center">적립금</div></th>
									<th scope="row"><div class="tb-center">처리상태</div></th>
									<th scope="row"><div class="tb-center">배송번호</div></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="8">
										<div class="tb-right"><!-- 주문 결제 금액  -->42,200(상품구매금액) (할인/추가금액) = 42,200원
										</div>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>
										<div class="tb-center">
											<img src="" style="width: 82px; height: 82px">
										</div>
									</td>
									<td>
										<div class="tb-center">
											<a href="javascript:go_brand('510581');"><!-- 상품 상세보기 퓨렐 손소독제 236mL--><br>
											<br></a> <span class="quantity order_table_Td style4"></span>

										</div>
									</td>
									<td><div class="tb-center"><!-- 주문번호 --></div></td>
									<td><div class="tb-center">
											<input type="hidden" name="MK_sel_basket_num[]" id="MK_sel_basket_num_[]" value="1"> 
											<select name="MK_sel_basket_amount_1" id="MK_sel_basket_amount_1">
												<option value="1"><!-- 상품 수량 --></option>
											</select>
										</div></td>
									<td><div class="tb-center tb-price">
											<strong><!-- 상품 가격 --></strong>
										</div></td>
									<td><div class="tb-center">
											<span class="style4"><!-- 적립금 --></span>
										</div></td>
									<td><div class="tb-center"><!-- 배송현황 --></div></td>
									<td><div class="tb-center"><!-- 송장번호 --></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h2>결제정보</h2>
					<div class="table-w table-payinfo">
						<table summary="">
							<caption>결제정보</caption>
							<colgroup>
								<col width="180">
								<col width="250">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">결제방법</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
									<th scope="row"><div class="tb-center">세부내역</div></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td><div class="tb-center tb-nbold"><!-- 결제방법 -->카드</div></td>
									<td><div class="tb-center"><!-- 결제금액 -->42,200원 (입금완료)</div></td>
									<td><div class="tb-center tb-nbold">
											WDA:XMEED2021040210012651128 
											<a href="javascript:receipt('NEW', 'WDA');">
											<img src="/images/common/print_cardtax.gif"></a>
										</div></td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td><div class="tb-center">사용한 적립금</div></td>
									<td><div class="tb-center">원</div></td>
									<td><div class="tb-center"></div></td>
								</tr>
								<tr>
									<td><div class="tb-center">사용한 예치금</div></td>
									<td><div class="tb-center">원</div></td>
									<td><div class="tb-center"></div></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="pop_order_btn_group">
						<a href="JavaScript:alert('주문취소가 되지 않습니다.\n쇼핑몰에 문의하세요.')" class="CSSbuttonWhite">주문취소</a>

					</div>
					<div class="pop_order_btn_close">
						<a href="/shop/mypage.html?mypage_type=myorder" class="CSSbuttonWhite">목록보기</a>
					</div>
				</div>
				<!-- #orderInfo-->
			</div>
			<!-- #orderSt -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
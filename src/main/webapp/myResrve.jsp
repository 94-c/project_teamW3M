<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* BASIC css start */
/* »ç¿ë °¡´É Àû¸³±Ý */
#myReserv .table-att { margin-top:10px }
#myReserv .table-att table { border:1px solid #e9e9e9; border-top:1px solid #000 }
#myReserv .table-att table th { background:#f8f8f8 }
#myReserv .table-att table th,
#myReserv .table-att table td { padding:16px 0; font-weight:bold }
#myReserv .table-att td .tb-right { padding-right:35px }

/* Àû¸³±Ý ³»¿ª */
#myReserv .table-d2-list { margin-top:10px }

/* À¯ÀÇ»çÇ× */
#myReserv .foot-dsc{ margin-top:40px }
#myReserv .foot-dsc li { padding-bottom: 5px; color:#797979 }

/* Àû¸³±Ý °Ë»ö */
#myReserv .search_reserve { float: right; margin-top: 20px; }
#myReserv .search_reserve img { vertical-align: middle; }

/* BASIC css end */

</style>

<title>적립금 내역</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">
<body>
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
							<li><a href="#">적립금내역</a></li>
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
								href="myinquryList.do?user_name=${userVO.user_name}&user_seq=${userVO.user_seq}">내 문의사항 보기</a></li>
							<li><a href="#">내 후기 보기</a></li>
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
		<div id="content">
                <div id="myReserv">
                    <div class="tit-page-2">
                        <h2>보유중인 적립금</h2>
                        <p class="dsc"><span class="fc-blue">${userVO.user_name}</span>님께서 보유하신 적립금 내역입니다.</p>
                    </div>
                    <div class="page-body">
                        <!-- 사용 가능한 적립금액 정보 -->
                        <div class="table-att">
                            <table summary="보유 적립금, 출석체크 누적금">
                                <caption>적립금액</caption>
                                <colgroup>
                                    <col width="180">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><div class="tb-center">총 보유 적립금</div></th>
                                        <td><div class="tb-right">0원<!-- 총 보유 적립금 --></div></td>
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
                                    <tr>
                                        <td colspan="3"><div class="tb-center">적립금 내역이 없습니다.</div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging">
                                        <a href="/shop/mypage.html?mypage_type=myreserve&amp;page=1">1</a>
                                    </div>
                        <!-- //적립금내역 리스트 -->
                        
                        <!-- 적립금내역 유의사항 -->
                        <ul class="foot-dsc">
                            <li>- 적립된 금액이 1,000원 이상 누적되었을 때, 사용하실 수 있습니다.</li>
                            <li>- 결제 시 적립금 사용 여부를 확인할 수 있는 안내문이 나옵니다.</li>
                        </ul>
                        <!-- //적립금내역 유의사항 -->
                        
                    </div><!-- .page-body -->
                </div><!-- #myReserv -->
            </div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
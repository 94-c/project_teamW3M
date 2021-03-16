<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>마이페이지 메인</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript"> //회원탈퇴 js
function userexit(){
    
            if (confirm('회원탈퇴를 하시겠습니까?')) location.href = 'https://www.welkeepsmall.com/shop/mypage.html?mypage_type=myexituser';
        
}
</script>
<script type="text/javascript">

    banner_position_type = 'LEFT';
    BannerHandler('blk_scroll_wings//160||1187||G');
    if( window.addEventListener ) {
        window.addEventListener("load",function() {
                BannerHandler('blk_scroll_wings//160||1187||G');
        },false);
    } else if( document.addEventListener ) {
        document.addEventListener("load",function() {
            BannerHandler('blk_scroll_wings//160||1187||G');
        },false);
    } else if( window.attachEvent ) {
        window.attachEvent("onload",function() {
            BannerHandler('blk_scroll_wings//160||1187||G');
        });
    }

</script>

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
							<li><a href="#">상품 보관함</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">쇼핑문의</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="#">내 게시글 보기</a></li>
							<li><a href="#">E-mail 문의</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">개인정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="memberInfoUpdate.do">회원정보변경</a></li>
							<li><a href="">회원정보탈퇴신청</a></li>
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
									<a href="memberInfoUpdate.do" class="CSSbuttonWhite CSSbuttonMin">수정</a>
								</p>
								<div class="box">
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd></dd>
									</dl>
									<dl>
										<!-- 이메일 -->
										<dt>이 메 일</dt>
										<dd>hyeongwoo26@naver.com</dd>
									</dl>
									<dl>
										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
										<dd></dd>
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
								<a href="#"><strong>0</strong>원</a>
							</dd>
							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt>
							<dd>
								<a href="#"><strong>0</strong>개</a>
							</dd>
						</dl>
					</div>
					<!-- //회원 정보 -->

					<!-- 회원 그룹 정보 -->
					<!-- //회원 그룹 정보 -->

					<!-- 최근 주문 정보 -->
					<div class="hd">
						<h3>최근 주문 정보</h3>
						<a class="view fe" href="#">+
							더보기</a>
					</div>
					<div class="tbl">
						<table summary="주문일자, 상품명, 결제금액, 주문상세">
							<caption>최근 주문 정보 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="140">
								<col width="140">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">제품</div></th>
									<th><div class="tb-center">금액</div></th>
									<th><div class="tb-center">상세</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //최근 주문 정보 -->

					<!-- 최근 등록 게시글 -->
					<div class="hd">
						<h3>최근 등록 게시글</h3>
						<a class="view fe" href="#">+더보기</a>
					</div>
					<div class="tbl">
						<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">게시글</div></th>
									<th><div class="tb-center">위치</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><div class="tb-center">작성된 게시글이 없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //최근 등록 게시글 -->
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
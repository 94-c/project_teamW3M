<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="resources/css/header.css" rel="stylesheet" type="text/css">

<div id="hdWrap">
	<div class="top_space"></div>
	<div id="comment_top" class="fixed">
		<div id="header">

			<div class="btn_ham">
				<img src="resources/images/icons/side_slide_menu.png">
				<div class="top_login_area">

					<div class="top_btn_login01">
						<a href="login.do">로그인</a>
					</div>
					<div class="top_btn_login01">
						<a href="logout.do">로그아웃</a>
					</div>
					<div class="top_btn_login01">
						<a href="memberInsert.do">회원가입</a>
					</div>

					<div class="top_btn_login02">
						<a href="#">아이디 찾기 / 비밀번호 찾기</a>
					</div>
					<div class="top_comm">
						<ul class="fleft">
							<li><a href="#">장바구니</a></li>
							<li><a
								href="#">개인정보</a></li>
							<li><a
								href="#">주문내역</a></li>
						</ul>
						<ul class="fright">
							<!-- 상단 커뮤니티 링크 수정 -->
							<li><a href="#">공지사항</a></li>
							<li><a href="#">상품후기</a></li>
							<li><a href="#">문의게시판</a></li>
						</ul>
					</div>
					<!-- //top_comm -->
				</div>
			</div>
			
			<!-- //btn_ham -->
			<div class="top_logo">
				<a href="main.jsp"><img src="resources/images/h_design/top_logo.gif"></a>
			</div>

			<div class="section1">
				<ul id="left_menu">
					<!-- 카테고리 자동출력 -->
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=023"
						class="">웰킵스 미세먼지마스크</a>
						<ul class="sub1" style="display: none;">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=023&amp;mcode=001" class="">- 프리미엄마스크</a></li>
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=023&amp;mcode=002">- 스마트마스크</a></li>
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=023&amp;mcode=003">- 리얼블랙마스크</a></li>
						</ul>
						<!-- //sub1 --></li>
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=028" class="">웰킵스 비말차단마스크</a>
						<ul class="sub1" style="display: none;">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=028&amp;mcode=001"> -웰킵스언택트마스크</a></li>
						</ul>
						<!-- //sub1 --></li>
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=026"
						class="">퓨렐손소독제</a>
						<ul class="sub1" style="display: none;">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=026&amp;mcode=001" class="">- 퓨렐손소독제</a></li>
						</ul>
						<!-- //sub1 --></li>
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=007"
						class="">원더블루 쿨패치</a>
						<ul class="sub1" style="display: none;">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=007&amp;mcode=001">- 원더블루 쿨패치</a></li>
						</ul>
						<!-- //sub1 --></li>
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=002" class="">원더핫 핫팩</a>
						<ul class="sub1" style="display: none;">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=002&amp;mcode=003">-원더핫 핫팩</a></li>
						</ul>
						<!-- //sub1 --></li>
					<li><a href="/shop/shopbrand.html?type=X&amp;xcode=027">체온계</a>
						<ul class="sub1">
							<li><a href="/shop/shopbrand.html?type=M&amp;xcode=027&amp;mcode=001">- 체온계</a></li>
						</ul>
						<!-- //sub1 --></li>
				</ul>
				<!-- //left_menu -->
			</div>
			<!-- //section1 -->



			<ul class="top_cart">
				<li><a href="#">로그인</a></li>
				<li><a href="https://www.welkeepsmall.com/shop/idinfo.html" class="join">회원가입
						<div class="scroll" style="bottom: 2.97586px;">
							<div>+1,000P</div>
						</div>
				</a></li>
				<li><a href="/shop/basket.html">장바구니<span id="user_basket_quantity" class="user_basket_quantity">0</span></a></li>
			</ul>
		</div>
		<!-- #header -->
	</div>
	<!-- //comment_top -->
</div>
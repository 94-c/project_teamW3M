<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<!-- head태그 시작 -->
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html;charset=UTF-8">
<title>[Well3Mask] W3M 공식쇼핑몰</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">

<!-- 폰트 -->
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">

<!-- Image -->
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">

<!-- CSS -->
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/footer.css" rel="stylesheet" type="text/css">
<link href="resources/css/login.css" rel="stylesheet" type="text/css">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.sliderkit.1.9.2.pack.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<!-- 각자 JS 파일만들어서 링크로 넣기 -->
<script type="text/javascript" src="resources/js/joe.js"></script>

</head>
<!-- head태그 끝 -->
<!-- body태그 시작(끝은 footer.jsp)에 있다. -->
<body>
	<div id="hdWrap">
		<div class="top_space"></div>
		<div id="comment_top">
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
						<a href="insertMember.do">회원가입</a>
					</div>

					<div class="top_btn_login02">
						<a href="searchID.do">아이디 찾기 / 비밀번호 찾기</a>
					</div>
					<div class="top_comm">
						<ul class="fleft">
							<li><a href="#">장바구니</a></li>
							<li><a href="#">개인정보</a></li>
							<li><a href="#">주문내역</a></li>
						</ul>
						<ul class="fright">
							<!-- 상단 커뮤니티 링크 수정 -->
							<li><a href="getNoticeList.do">공지사항</a></li>
							<li><a href="#">상품후기</a></li>
							<li><a href="#">문의게시판</a></li>
						</ul>
					</div>
				</div>
			</div>			
			
			
			<div class="top_logo">
				<a href="index.jsp"><img src="resources/images/h_design/top_w3m.gif"></a>
			</div>
			

			<div class="section1">
				<ul id="left_menu">
					<!-- 카테고리 자동출력 -->
					<li><a href="#" class="">웰킵스 미세먼지마스크</a>
						<ul class="sub1" style="display: none;">
							<li><a href="#" class="">- 프리미엄마스크</a></li>
							<li><a href="#">- 스마트마스크</a></li>
							<li><a href="#">- 리얼블랙마스크</a></li>
						</ul>
					</li>
					<li><a href="#" class="">웰킵스 비말차단마스크</a>
						<ul class="sub1" style="display: none;">
							<li><a href="#">- 웰킵스언택트마스크</a></li>
						</ul>
					</li>
					<li><a href="#" class="">퓨렐손소독제</a>
						<ul class="sub1" style="display: none;">
							<li><a href="#" class="">- 퓨렐손소독제</a></li>
						</ul>
					</li>
					<li><a href="#" class="">원더블루 쿨패치</a>
						<ul class="sub1" style="display: none;">
							<li><a href="#">- 원더블루 쿨패치</a></li>
						</ul>
					</li>
					<li><a href="#" class="">원더핫 핫팩</a>
						<ul class="sub1" style="display: none;">
							<li><a href="#">- 원더핫 핫팩</a></li>
						</ul>
					</li>
					<li><a href="#">체온계</a>
						<ul class="sub1">
							<li><a href="#">- 체온계</a></li>
						</ul>
					</li>
				</ul>
			</div>
			

			<ul class="top_cart">
			<c:set var="login_state" value="${login_state}"/>
			<c:choose>
				<c:when test="${login_state eq 'login' }">
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="#" class="">마이페이지</a></li>
				</c:when>
				<c:when test="${login_state ne 'login' }">	
					<li><a href="login.do">로그인</a></li>
					<li><a href="insertMember.do" class="join">회원가입
						<span class="scroll" style="bottom: 2.97586px;">
							<span>+1,000P</span>
						</span></a>
					</li>
				</c:when>	
			</c:choose>				
				<li><a href="#">장바구니<span id="user_basket_quantity" class="user_basket_quantity">0</span></a></li>
			</ul>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- 일반유저 페이지 header파일입니다. -->
<html>

<!-- head태그 시작 -->
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html;charset=UTF-8">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">

<!-- 폰트 -->
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">

<!-- Image -->
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">

<!-- CSS -->
<link href="resources/css/slider.css" rel="stylesheet" type="text/css">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/footer.css" rel="stylesheet" type="text/css">
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<link href="resources/css/findID.css" rel="stylesheet" type="text/css">
<link href="resources/css/insertMember.css" rel="stylesheet" type="text/css">
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="resources/css/border.css">
<link type="text/css" rel="stylesheet" href="resources/css/menu.css">
<link type="text/css" rel="stylesheet" href="resources/css/lost.css">
<link href="resources/css/shopbrand.css" rel="stylesheet" type="text/css">
<link href="resources/css/basket.css" rel="stylesheet" type="text/css">
<link href="resources/css/shopdetail.css" rel="stylesheet" type="text/css">
<link href="resources/css/soo.css" rel="stylesheet" type="text/css">
<link href="resources/css/reply.css" rel="stylesheet" type="text/css">

<!-- JS -->
<script type="text/javascript" src="resources/js/jquery_option.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript" src="resources/js/main.js" ></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/basket.js" ></script>  
<!-- 아래처럼 각자 JS파일 만들어서 링크 삽입하기 -->
<script type="text/javascript" src="resources/js/joe.js"></script>
<script type="text/javascript" src="resources/js/insertmember.js?v=7"></script>


</head>
<!-- head태그 끝 -->


<!-- body태그 시작 (끝부분은 footer.jsp)에 있음. -->
<body>
   <div id="hdWrap">
      <div class="top_space"></div>
      <div id="comment_top">
      <div id="header">

         <div class="btn_ham">
            <img src="resources/images/icons/side_slide_menu.png">
            <div class="top_login_area">
            
               <div class="top_btn_login01" >
                  <c:if test="${login_state eq 'login' }">
                     <a id="haveSession" href="#" onclick="window.location.reload()">로그인</a>
                  </c:if>
                  <c:if test="${login_state ne 'login' }">
                     <a href="loginForm.do">로그인</a>
                  </c:if>
               </div>
               <div class="top_btn_login01">
                  <c:if test="${login_state eq 'login' }">
                     <a onclick="logoutAlert();" href="logout.do">로그아웃</a>
                  </c:if>
                  <c:if test="${login_state ne 'login' }">
                     <a id="haveNoSession" href="loginForm.do">로그아웃</a>
                  </c:if>
               </div>
               <div class="top_btn_login01">
                  <a href="selectJoin.do">회원가입</a>
               </div>

               <div class="top_btn_login02">
                  <a href="findIDForm.do">아이디 찾기 / 비밀번호 찾기</a>
               </div>
               <div class="top_comm">
                  <ul class="fleft">
                  <c:if test="${login_state eq 'login' }" >
                     <li><a href="GoCart.do">장바구니</a></li>
                  </c:if>
                   <c:if test="${login_state ne 'login' }" >
                     <li><a href="loginForm.do" onClick="alert('로그인이 필요합니다.')">장바구니</a></li>
                  </c:if>
                  <c:if test="${login_state eq 'login' }">
                     <li><a href="mypage.do">마이페이지</a></li>                     
                  </c:if>
                  <c:if test="${login_state ne 'login' }">
                     <li><a href="loginForm.do">마이페이지</a></li>
                  </c:if>                  
                     <li><a href="#">주문내역</a></li>
                  </ul>
                  <ul class="fright">
                     <!-- 상단 커뮤니티 링크 수정 -->
                     <li><a href="getUserNoticeList.do">공지사항</a></li>
                     <li><a href="review.do">상품후기</a></li>
                     <c:if test="${login_state eq 'login' }">
                     <li><a href="inquiry.do">문의게시판</a></li>
                     </c:if>
                     <c:if test="${login_state ne 'login' }">
                     <li><a href="loginForm.do" onClick="alert('로그인이 필요합니다.')">문의게시판</a></li>
                     </c:if>         
                  </ul>
               </div>
            </div>
         </div>
         
         <div class="top_logo">
            <a href="/"><img src="resources/images/h_design/top_w3m.gif"></a>
         </div>

         <div class="section1">
            <ul id="left_menu">
               <!-- 카테고리 자동출력 -->
               <li><a href="category.do?prod_category1=MM">W3M 미세먼지마스크</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=MM&prod_category2=P">- 프리미엄</a></li>
                     <li><a href="category.do?prod_category1=MM&prod_category2=N">- 일반</a></li>
                     <li><a href="category.do?prod_category1=MM&prod_category2=B">- 블랙</a></li>
                  </ul>
               </li>
               <li><a href="category.do?prod_category1=BB">W3M 비말차단마스크</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=BB&prod_category2=N">- 일반</a></li>
                  </ul>
               </li>
               <li><a href="category.do?prod_category1=SS">W3M 손소독제</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=SS&prod_category2=N">- 일반</a></li>
                  </ul>
               </li>
               <li><a href="category.do?prod_category1=CC">W3M 쿨패치</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=CC&prod_category2=N">- 일반</a></li>
                  </ul>
               </li>
               <li><a href="category.do?prod_category1=HH">W3M 핫팩</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=HH&prod_category2=N">- 일반</a></li>
                  </ul>
               </li>
               <li><a href="category.do?prod_category1=TT">W3M 체온계</a>
                  <ul class="sub1" style="display: none;">
                     <li><a href="category.do?prod_category1=TT&prod_category2=N">- 일반</a></li>
                  </ul>
               </li>
            </ul>
         </div>
         
         <ul class="top_cart">
         <c:set var="login" value="${login_state}"/>
         <c:choose>
            <c:when test="${login eq 'login' }">
               <li><a onclick="logoutAlert();" href="logout.do">로그아웃</a></li>
               <li><a href="mypage.do" class="">마이페이지</a></li>
               <li><a href="GoCart.do">장바구니<span id="user_basket_quantity" class="user_basket_quantity">(${cart})</span></a></li>
            </c:when>
            <c:when test="${login ne 'login'}">
               <li><a href="loginForm.do">로그인</a></li>
               <li><a href="selectJoin.do" class="join">회원가입
                  <span class="scroll" style="bottom: 2.97586px;">
                     <span>+1,000P</span>
                  </span></a>
               </li>
               <li><a href="loginForm.do" onClick="alert('로그인이 필요합니다.')">장바구니<span id="user_basket_quantity" class="user_basket_quantity"></span></a></li>
            </c:when>
         </c:choose>
         </ul>

				<div class="fixed_quick">
					<ul>
						<li><a href="#">
							<img src="resources/images/sideBar/r_quick02_off.gif" class="menuoff">
							<img src="resources/images/sideBar/r_quick02_on.gif" class="menuon" alt="배송조회"></a></li>
						
						<li><a href="GoCart.do">
							<img src="resources/images/sideBar/r_quick03_off.gif" class="menuoff">
							<img src="resources/images/sideBar/r_quick03_on.gif" class="menuon" alt="장바구니"></a></li>
						
						<li><a href="#">
							<img src="resources/images/sideBar/r_quick04_off.gif" class="menuoff">
							<img src="resources/images/sideBar/r_quick04_on.gif" class="menuon" alt="최근본상품"></a></li>
							
						<li><img src="resources/images/sideBar/r_quick05_on.gif" 
						onclick="javascript:window.open('https://lc1.lunasoft.co.kr/lunachat/api-connect/@welkeeps/main', 'lunachat', 'width=1024, height=800');"
							style="cursor: pointer"></li>
							
						<li class="page_up">
							<a href="#hdWrap" class="scroll" style="bottom: 1.63925px;">
							<img src="resources/images/sideBar/r_quick_up.gif"></a></li>
					</ul>
				</div>

			</div>
   </div>
</div>
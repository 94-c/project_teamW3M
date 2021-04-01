<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.spring.w3m.login.admin.dao.AdminDAO"%>
<%@ page import="com.spring.w3m.login.admin.vo.AdminVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="ft">
	<div id="footer">
		<div class="section0 cboth" style="display: none">
			<div class="inner">
				<!-- 하단 인스타그램 텍스트 수정 -->
				<div class="insta_title cboth">INSTAGRAM</div>
				<div class="insta_sub_title cboth">@welkeeps_official</div>
				<div id="instafeed"></div>
			</div>
		</div>
		<!-- //section0 -->

		<div class="section cboth">
		<c:set var="login" value="${adminLogin_state }"/>
			<ul>
					<c:choose>
						<c:when test="${login eq 'adminLogin'}">
							<li><a href="#">회사소개</a></li>
							<li><a href="javascript:void(window.open('shopterms', '_blank', status=no, menubar=no, toolbar=no, resizable=no'))">이용약관</a></li>
							<li><a href="#" class="black">개인정보처리방침</a></li>
							<li><a href="info">이용안내</a></li>
							<li><a href="loginIndex.mdo">관리자</a></li>
						</c:when>
						<c:when test="${login ne 'adminLogin'}">
							<li><a href="#">회사소개</a></li>
							<li><a href="javascript:void(window.open('shopterms', '_blank', status=no, menubar=no, toolbar=no, resizable=no'))">이용약관</a></li>
							<li><a href="#" class="black">개인정보처리방침</a></li>
							<li><a href="info">이용안내</a></li>
							<li><a href="login.mdo">관리자</a></li>
						</c:when>
				</c:choose>
			</ul>
		</div>
		<!-- //section -->

		<div class="section1 cboth">
			<div class="ft_info01 fleft">
				<div class="ft_logo">
					<a href="/"><img src="resources/images/f_design/ft_logo.gif"></a>
				</div>
				<div class="ft_copy">
					법인명 : 웰킵스(주) | 대표 : 박종한<br> 고객센터 : 02-443-0999 | 팩스 :
					02-441-1764<br> 사업장소재지 : 서울시 송파구 위례성대로 10 에스타워 7층<br>
					개인정보관리책임자 : 김성일<br> 사업자등록번호 : 215-87-45158 
					<a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank"><b>[사업자정보확인]</b></a><br> 통신판매업 신고번호 : 제2020-서울송파-4267호
				</div>
			</div>
			
			<div class="ft_info02 fleft">
				<div class="area01">

					<!-- 하단 고객센터 정보 수정 -->
					<div class="ft_title">고객센터</div>
					<div class="ft_num">02.443.0999</div>

					<div class="ft_copy">
						월요일 - 금요일 AM 09:00 - 18:00<br> 점심시간 12:00 - 13:00<br>
						토/일/공휴일 휴무<br>
						<br>
					</div>

					<div class="ft_title">카카오톡 1:1 상담하기</div>
					<div class="ft_copy">
						고객센터 연결이 어려우신 경우<br> 카카오톡 상담하기 또는<br> 이메일로 문의해주세요<br>
						<br>

						<div class="ft_title">이메일 : help@welkeeps.com</div>
						<br>
					</div>

				</div>
				<!-- 하단 반품주소 정보 수정 -->
				<div class="ft_title02"></div>
				<div class="ft_copy2"></div>
			</div>
			
			<div class="ft_info02 fleft mrl48">
				<div class="area01">
					<!-- 하단 은행 정보 수정 -->
					<div class="ft_title">계좌안내</div>
					<div class="ft_copy">
						고객님의 편의를 위한<br> 가상계좌 서비스를<br> 이용해주시기 바랍니다.<br>
					</div>
				</div>
				<div class="ft_title02"></div>
				<div class="ft_copy2" style="padding-top: 55px;">
					<div class="ft_sns">
						<!-- 하단 인스타그램 링크 수정 -->
						<a href="https://www.instagram.com/welkeeps_official/?hl=ko/" target="_blank"><img src="resources/images/f_design/sns_insta.png" width="28"></a>
						<a href="https://www.facebook.com/welkeeps" target="_blank"><img src="resources/images/f_design/sns_facebook.png" width="28"></a>
						<a href="https://pf.kakao.com/_GaYwC" target="_blank"><img src="resources/images/f_design/sns_kakao.png" width="28"></a>
						<a href="https://blog.naver.com/welkeeps_official" target="_blank"><img src="resources/images/f_design/sns_blog.png" width="28"></a>
					</div>
					<!-- //ft_sns -->
				</div>
				<!-- //ft_copy2 -->
			</div>
			
			<div class="ft_info02 fleft mrl48">
				<div class="ft_title">게시판</div>
				<div class="ft_comm">
					<ul>
						<!-- 하단 커뮤니티 링크 수정 -->
						<li><a href="getUserNoticeList.do" style="text-align: center;">공지사항</a></li>
						<c:if test="${login_state eq 'login' }">
						<li><a href="inquiry.do" style="text-align: center;">문의게시판</a></li>
						</c:if>                    
                     	<c:if test="${login_state ne 'login' }">
                     	<li><a href="loginForm.do" style="text-align: center;" onClick="alert('로그인이 필요합니다.')">문의게시판</a></li>
                     	</c:if>         
						<li><a href="review.do" style="text-align: center;">상품후기</a></li>
						<li><a href="https://corona-live.com/" style="text-align: center;">코로나-19</a></li>
					</ul>
				</div>
			</div>
			<!-- //ft_info02 -->
		</div>
		<!-- //section1 -->

		<div class="section2 cboth">
			<div class="inner">
				Copyright by W3MASK(주). All rights reserved. <span>designed by W3M.com</span>
			</div>
		</div>
		<!-- //section2 -->
	</div><!-- //footer -->
</div>
</body>
<!-- body 끝 -->
</html>
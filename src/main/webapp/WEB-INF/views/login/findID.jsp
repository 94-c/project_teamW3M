<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>아이디/패스워드 찾기</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="findWrap">

				<form class="findIdForm" method="post" action="findID.do">
					<div id="find_id" class="find_idpw">
						<h1 class="tit">아이디 찾기</h1>
						<p class="sub-tit">
							회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로<br> 아이디를 확인하실 수 있습니다.<br>
							<br> nh@, ka@ fa@와 같은 '@'가 포함된 아이디는<br>
							네이버, 카카오, 페이스북 등 타 사이트 연동 가입시<br>
							임의로 생성되는 회원번호입니다. '네이버로 로그인' 등<br>
							연동 로그인 버튼으로 접속 부탁드립니다.<br>
						</p>
						<div class="radio-wrap">
							<label> 
								<input type="radio" name="find_id_type" value="mobile" checked="checked">
									 휴대폰 번호로 찾기
							</label> 
							<!-- <label> 
								<input type="radio" name="find_id_type" value="email"> 
									이메일로 찾기
							</label> -->
						</div>
						<div class="find-info">
							<ul class="frm-list">
								<li id="find_id_name_wrap">
									<input type="text" name="user_name" placeholder="이름" onfocus="this.placeholder=''" onblur="this.placeholder='이름'" maxlength="6"/>
								</li>
								<!-- <li id="find_id_email_wrap">
									<input type="text" name="user_email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" maxlength="40"/>
								</li> -->
								<li id="find_id_mobile_wrap">
									<input type="text" name="user_phone" placeholder="휴대폰 번호(ex.01012345678)" onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호(ex.01012345678)'" maxlength="11"/>
								</li>
							</ul>
							<div class="btn-area">
								<a class="CSSbuttonWhite findID_btn">
									아이디 찾기
								</a> 
								<a class="CSSbuttonBlack" href="loginForm.do">
									로그인
								</a>
							</div>
						</div>
					</div>
				</form>
					<!--/#find_id/-->
				<form class="findPwForm" method="post" action="findPW.do">
					<div id="find_pw" class="find_idpw">
						<h1 class="tit">임시 비밀번호 발급</h1>
						<p class="sub-tit">
							가입하신 아이디+이메일 또는 휴대폰번호를 입력과 본인인증을 통해<br> 
							이메일 또는 휴대폰번호로 임시 비밀번호를 보내드립니다.<br> 
							확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다.<br>
							<br> 회원가입시 정확한 연락처 미 기재 의 경우<br> 아이디/비밀번호 찾기가 어려울 수 있습니다.<br> 
							문자 수신 오류 시 메일 (<b>help@welkeeps.com</b>)로 문의 바랍니다.<br>
							<br>
						</p>
						<div class="radio-wrap">
							<!-- <label> 
								<input type="radio" name="find_pw_type" value="email"> 
									이메일로 찾기
							</label>  -->
							<label> 
								<input type="radio" name="find_pw_type" value="mobile" checked="checked"> 
									휴대폰 번호로 찾기
							</label>
						</div>
						<div id="find_pw_input_wrap">
							<div class="find-info">
								<ul class="frm-list">
									<li id="find_pw_id_wrap">
										<input type="text" name="user_id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" maxlength="20"/>
									</li>
									
									<!-- <li id="find_pw_email_wrap">
										<input type="text" name="user_email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" maxlength="40"/>
									</li> -->
									
									<li id="find_pw_mobile_wrap">
										<input type="text" name="user_phone" placeholder="휴대폰 번호 (ex.01012345678)" onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호(ex.01012345678)'" maxlength="11"/>
									</li>
								</ul>
								<div class="btn-area">
									<a class="CSSbuttonWhite info-confirm findPW_btn">
										임시 비밀번호 발급
									</a> 
									<a href="/loginForm.do" class="CSSbuttonBlack info-confirm">로그인</a>
								</div>
							</div>
						</div>
					</div>
					<!--/#find_pw/-->
				</form>
			</div>
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
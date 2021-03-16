<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>아이디/패스워드 찾기</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script>
	$(document).ready(function(){
		var rd_email = $("input[type='radio'][value='email']");
		var rd_phone = $("input[type='radio'][value='mobile']");
		var in_email = $("#find_id_email_wrap");
		var in_phone = $("#find_id_mobile_wrap");
		
		rd_email.click(function(){
			in_email.css("display","block");
			in_phone.css("display","none");
		});
		rd_phone.click(function(){
			in_email.css("display","none");
			in_phone.css("display","block");
		});		
		
	});
</script>
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="findWrap">

				<form name="form1" method="post" action="#" target="loginiframe">
					<input type="hidden" name="focus_ok"> <input type="hidden" name="msecure_key">
					<input type="hidden" name="sslid" value="pgreen1364">
					<input type="hidden" name="sslip" value="www.welkeepsmall.com">
					<input type="hidden" name="mail">
					<input type="hidden" name="authtext" value="">
					<input type="hidden" name="authid">
					<input type="hidden" name="find_type" value="find_pw">
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
								<input type="radio" name="find_id_type" value="email" checked="checked">
									 이메일로 찾기
							</label> 
							<label> 
								<input type="radio" name="find_id_type" value="mobile"> 
									휴대폰 번호로 찾기
							</label>
						</div>
						<div class="find-info">
							<ul class="frm-list">
								<li>
									<input type="text" name="user_name" placeholder="이름" onfocus="this.placeholder=''" onblur="this.placeholder='이름'" maxlength="20"/>
								</li>
								<li id="find_id_email_wrap">
									<input type="text" name="user_email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" maxlength="40"/>
								</li>
								<li id="find_id_mobile_wrap" style="display: none;">
									<input type="text" name="user_phone" placeholder="휴대폰 번호" onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호'" maxlength="30"/>
								</li>
							</ul>
							<div class="btn-area">
								<a class="CSSbuttonWhite" href="javascript:find_type('find_id');">
									아이디 찾기
								</a> 
								<a class="CSSbuttonBlack" href="login.do">
									로그인
								</a>
							</div>
						</div>
					</div>
					<!--/#find_id/-->

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
							<label> 
								<input type="radio" name="find_pw_type" value="email" checked="checked"> 
									이메일로 찾기
							</label> 
							<label> 
								<input type="radio" name="find_pw_type" value="mobile"> 
									휴대폰 번호로 찾기
							</label>
						</div>
						<div id="find_pw_input_wrap">
							<div class="find-info">
								<ul class="frm-list">
									<li>
										<input type="text" name="user_id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" maxlength="20"/>
									</li>
									
									<li id="find_pw_email_wrap">
										<input type="text" name="user_email" placeholder="이메일" onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" maxlength="40"/>
									</li>
									
									<li id="find_id_mobile_wrap" style="display: none;">
										<input type="text" name="user_phone" placeholder="휴대폰 번호" onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호'" maxlength="30"/>
									</li>
							</ul>
								<div class="btn-area">
									<a href="javascript:find_type('find_pw');" class="CSSbuttonWhite info-confirm">
										임시 비밀번호 발급
									</a> 
									<a href="/shop/member.html?type=login&amp;returnurl=%2Fhtml%2Fmainm.html"
										class="CSSbuttonBlack info-confirm">
										로그인
									</a>
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
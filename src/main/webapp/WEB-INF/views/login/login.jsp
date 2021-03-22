<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>회원로그인</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<!-- 로그인 -->
<div id="contentWrapper">
		<div id="contentWrap">
			<div id="content">
				<div id="loginWrap">
					<div class="tit-page">로그인</div>
					<div class="page-body">
						<div class="mlog-sign">
	<div class="mlog">
	<h3>W3M 회원 로그인</h3>
	<p>가입하신 아이디와 비밀번호를 입력해주세요.<br>
	비밀번호는 대소문자를 구분합니다.<br>
	</p>
	
	<form action="/login.do" name="form1" method="post">
		<ul class="frm-list">
			<li class="id">
			<input onkeyup="enterkey();" type="text" name="user_id" id="user_id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" maxlength="20" />
			</li>
			
			<li class="pwd">
			<input onkeyup="enterkey();" type="password" name="user_password" id="user_password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'" maxlength="20" />
			</li>
		</ul>
		
		<div class="btn-mlog">
			<a href="#" class="CSSbuttonBlack fe" id="login_btn">로그인</a>
		</div>
		<br><br><br>
		<p class="se-log">
		<label><input type="checkbox" name="ssl" value="Y" class="MS_security_checkbox" checked/> 보안접속</label>
	    </p>
	    <c:if test="${msg eq 'failure' }">
	    	<p style="color:red; font-size: 14px" align="right">아이디 또는 비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p>
	    </c:if>
	     <c:if test="${msg eq 'delete' }">
	    	<p style="color:red; font-size: 14px" align="center">회원 탈퇴한 계정입니다.</p>
	    </c:if>
	    
	</form>
	</div>
	<!-- 로그인 END -->
	
				<!-- 회원가입 / ID&PW찾기 -->
				<div class="sign">
				<h3>W3M 회원가입</h3>
					<dl>
						<dt>
							아직 회원이 아니신가요? <br />회원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다.
						</dt>
						<dd>
							<a href="insertMember.do" class="CSSbuttonWhite fe">회원가입</a>
						</dd>
					</dl>
					<dl>
						<dt>
							아이디 혹은 비밀번호를 잊으셨나요?<br />간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.
						</dt>
						<dd>
							<a href="findIDForm.do" class="CSSbuttonWhite fe">아이디/비밀번호 찾기</a>
						</dd>
					</dl>
				</div>
										
						</div>
						<!-- .mlog-sign -->
					</div>
					<!-- .page-body -->
					<!-- snsLogin -->
							<div id="simplogin">
							<div class="sns-login">
								 <a href="javascript:sns_login_log('kakao');">
								 <img src="resources/images/sns/kakao_login.png" alt="카카오톡으로 로그인"></a> 
								 <a href="javascript:sns_login_log('naver');">
								 <img src="resources/images/sns/naver_login.png" alt="네이버로 로그인"></a>
							</div>
							<!-- .sns-login -->
						</div>
				</div>
				<!-- #loginWrap -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
	<!-- 회원가입/ID&PW찾기 END -->


<%@include file="/WEB-INF/views/include/footer.jsp"%>
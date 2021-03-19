<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>아이디/비밀번호 찾기 결과</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
	<div id="contentWrap">
            
			<div id="content">
				<div id="findIdPwd_result">
					<div class="tit-page">아이디/비밀번호 찾기 결과</div>
						<div class="findIdPwd_result">
							<div id="find_Success">
                                <dl>
									<dd>메일로 임시비밀번호가 발송되었습니다.</dd>
                                </dl>
                            </div>
						<p class="sub-tit">
                            회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.<br>
                            정보 보호를 위해 아이디 일부는 숨김 처리되고, 임시 비밀번호는 가입하신 이메일로 발송됩니다.
                        </p>
                    <div class="btn-area">
						<a href="loginForm.do" class="CSSbuttonBlack">로그인</a>
					</div>
				</div>
			</div><!-- #findIdPwd -->
		</div><!-- #content -->
	</div><!-- #contentWrap -->
</div><!-- #contentWrapper -->

<%@include file="/WEB-INF/views/include/footer.jsp"%>

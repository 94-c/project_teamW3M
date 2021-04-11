<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>로그인 성공</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<meta http-equiv="refresh" content="1; url=./">
<link type="text/css" rel="stylesheet" href="resources/css/loginAfter.css?v=1">
<div id="contentWrapper">
        <div id="contentWrap">
             <div id="content">
                <div id="login_After">
                    <div class="tit-page">로그인 완료 결과</div>
                    <div class="login_After_result">
                    <div id="Login_Success">
                                <dl>
                                    <dd>${userVO.user_name}[${userVO.user_id}]님 환영 합니다.</dd>
                                </dl>
                    </div>
                        <div id ="Login_Success01">
                        	<dl>
                          		<dd>홈페이지으로 자동으로 이동 합니다.</dd>
                        	</dl>
                        </div>
                </div>
                </div><!-- #findIdPwd -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
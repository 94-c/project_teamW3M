<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
<title>회원로그인</title>
</head>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<div id="contentWrapper">
<div id="contentWrap">
 <div id="content">
 <div id="loginWrap">
                        <div class="tit-page">로그인</div>
                        <div class="page-body">
                            <div class="mlog-sign">
                                <div class="mlog">
                                    <h3>웰킵스 회원 로그인</h3>
                                    <p>가입하신 아이디와 비밀번호를 입력해주세요.<br />
                                       	비밀번호는 대소문자를 구분합니다.<br />
                                    </p>
                                    <form action="loginprac.jsp" method="post" name="form1" autocomplete="off">
			
                                      <!--     <legend>member login</legend> --> 
                                            <ul class="frm-list">
                                                <li class="id">
                                                    <input type="text" name="id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" maxlength="20"/>                                                </li>
                                                <li class="pwd">
                                                    <input type="password" name="passwd" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"  maxlength="20"/>                                                </li>
                                            </ul>
                                            <div class="btn-mlog">
                                       
                                             	<a href="javascript:check();" class="CSSbuttonBlack fe">로그인</a>
                                            </div>
                                            <p class="se-log">
                                                <label><input type="checkbox" name="ssl" value="Y" class="MS_security_checkbox" /> 보안접속</label>
                                            </p>
                                        
                                    </form>                                </div>
                                <div class="sign">
                                    <h3>웰킵스 회원가입</h3>
                                    <dl>
                                        <dt>아직 회원이 아니신가요? <br />회원가입을 하시면 다양한 혜택을  편리하게 이용하실 수 있습니다.</dt>
                                        <dd><a href="/shop/idinfo.html?type=new&first=" class="CSSbuttonWhite fe">회원가입</a></dd>
                                    </dl>
                                    <dl>
                                        <dt>아이디 혹은 비밀번호를 잊으셨나요?<br />간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.</dt>
                                        <dd><a href="/shop/lostpass.html" class="CSSbuttonWhite fe">아이디/비밀번호 찾기</a></dd>
                                    </dl>
                                </div>
                            </div><!-- .mlog-sign -->
                        </div><!-- .page-body -->
                    </div><!-- #loginWrap -->
                    </div><!-- #content -->
                    </div><!-- #contentWrap -->
        </div><!-- #contentWrapper-->
 	<%@include file="/WEB-INF/views/include/footer.jsp"%>
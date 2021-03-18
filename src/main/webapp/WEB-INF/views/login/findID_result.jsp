<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>아이디/비밀번호 찾기 결과확인</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
        <div id="contentWrap">
             <div id="content">
                <div id="findIdPwd_result">
                    <div class="tit-page">아이디/비밀번호 찾기 결과</div>
                    <div class="findIdPwd_result">
                    <div id="find_Success">
                                <dl>
                                	<c:if test="${userIdList.size() == 0 }">
                                	    <p style="color:red; font-size: 20px;">입력된 정보와 일치하는 아이디가 존재하지 않습니다.</p>
                                    </c:if>
                                    <c:if test="${userIdList.size() != 0 }">
                                	    <dt>${userIdList}</dt>
                                    	<dd>총 ${userIdList.size() }개의 아이디가 존재합니다.</dd>
                                    </c:if>	
                                </dl>
                    </div>
                        <p class="sub-tit">
                            회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.<br>
                            정보 보호를 위해 아이디 일부는 숨김 처리되고, 임시 비밀번호는 가입하신 이메일로 발송됩니다.
                        </p>
                        <c:if test="${userIdList.size() == 0 }">
                        	<div class="btn-area">
                            	<a href="insertMember.do" class="CSSbuttonBlack">회원가입</a>
                        	</div>
                        </c:if>
                        <c:if test="${userIdList.size() != 0 }">
                        	<div class="btn-area">
                            	<a href="loginForm.do" class="CSSbuttonBlack">로그인</a>
                        	</div>
                        </c:if>
                    </div>
                </div><!-- #findIdPwd -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div>
    
<%@include file="/WEB-INF/views/include/footer.jsp"%>

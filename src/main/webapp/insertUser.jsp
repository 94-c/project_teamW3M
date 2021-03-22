<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>회원 가입</title>	
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
        <div id="contentWrap">
             <div id="content">
                <div id="jointype">					
					<div class="cateTit_v2 join">
						<em class="title">회원가입</em>
						<div class="right">
							<p class="subTxt">
								회원종류에 따라 회원가입 절차가 다릅니다. 고객님께서 해당하는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.
							</p>
						</div>
					</div>

                  <div class="type-select btnArea simple-join">
						<div class="center type-simple">							
							<div class="type-wrap">
								<div class="img-wrap">
									<img src="resources/images/join/join_event.jpg" alt="웰컴혜택안내">
								</div>
																	
								<a href="#" class="move-link">간편회원가입</a>
							</div>
						</div>
					</div>
                    
					<div id="simpleJoinSns">
						<div class="sns-area">
									<a href="/list/API/login_kakao.html" class="link kakao">
									<img src="resources/images/sns/kakao_join.png" alt="카카오로 회원가입">
								</a>
									<a href="/list/API/login_naver.html" class="link naver">
									<img src="resources/images/sns/naver_join.png" alt="네이버로 회원가입">
								</a>
						</div>
					</div>
				</div><!-- #jointype -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
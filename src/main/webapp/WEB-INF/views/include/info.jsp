<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>이용 안내</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style>
/* BASIC css start */
/* t-msg */
#guide .t-msg { margin-top:20px; font-size:14px; color:#7b7b7b }
#guide .t-msg a { font-size:14px; color:#7b7b7b; vertical-align:top }
/* gd-dsc */
#guide .gd-dsc { margin-top:70px }
#guide .gd-dsc dt { padding:0 0 10px 10px; position:relative; font-size:16px; color:#000; border-bottom:1px dashed #e9e9e9; background:url(/design/open9/common/bu_4x4.gif) 0 7px no-repeat }
#guide .gd-dsc dt a { font-size:16px; color:#000; vertical-align:top }
#guide .gd-dsc dd { padding:15px 0 0 10px; font-size:14px; color:#7b7b7b; line-height:27px }

/* BASIC css end */
</style>
<div id="contentWrapper">
        <div id="contentWrap">
             <div id="content">
                <div id="guide">
                    <dl class="loc-navi">
                        <dt class="blind">현재 위치</dt>
                        <dd>
                            <a href="/">HOME</a> 
                            &gt; 이용안내
                        </dd>
                    </dl>
                    <h2 class="tit-page">SHOPPING GUIDE</h2>
                    <div class="page-body">
                        <p class="t-msg">
                            저희 쇼핑몰을 방문해 주셔서 감사드립니다. 저희 쇼핑몰은 회원제를 실시하고 있습니다. <br>
                            처음 오신 분은 먼저 <a href="https://www.welkeepsmall.com/shop/idinfo.html">회원가입</a>을 하신 후 이용하시길 바랍니다. 회원가입을 안 하시더라도 비회원의 자격으로 상품을 구입하실 수 있습니다. 
                        </p>
                        <dl class="gd-dsc">
                            <dt>상품 주문방법</dt>
                            <dd>
                                <ol>
                                    <li>1. 각 코너를 클릭하셔서 들어갑니다.</li>
                                    <li>2. "바로가기" 메뉴 또는 사진이나 상품명을 클릭하세요!</li>
                                    <li>3. "장바구니 담기"를 클릭하세요!</li>
                                    <li>4. "장바구니에 넣었습니다" 메시지가 나오면, 주문상품을 확인한 후 "주문버튼"을 클릭하세요!</li>
                                    <li>5. 주문버튼을 누르면, "주문서"가 나옵니다! 주문서를 작성 후 "주문"을 클릭하면 주문이 완료됩니다! </li>
                                </ol>
                            </dd>
                        </dl>
                        <dl class="gd-dsc">
                            <dt>주소/전화</dt>
                            <dd>
                                <ul class="bull">
                                    <li>주소 : 서울시 송파구 위례성대로 10 에스타워 7층</li>
                                    <li>전화 : 02-443-0999</li>
                                    <li>메일 : help@welkeeps.com</li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="gd-dsc">
                            <dt>배송일</dt>
                            <dd>
                                배송 방법은 택배입니다.<br>
                                주문하신 날로부터 3 ~ 6일 안에 받을 수 있습니다.
                            </dd>
                            <dd>
                                <ul class="bull">
                                    <li>- 온라인 입금 시 입금 확인 후 3 ~ 6일</li>
                                    <li>- 신용카드 결제 시 주문 후 3 ~ 6일</li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="gd-dsc">
                            <dt>반품안내</dt>
                            <dd>
                                <ul class="bull">
                                    <li>- 고객의 변심에 의한 교환 및 반품이면 배송비는 소비자부담입니다.</li>
                                    <li>- 상품의 이상에 의한 교환 및 반품이면 배송비는 판매자부담입니다.</li>
                                    <li>- 문의 : 02-443-0999</li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="gd-dsc">
                            <dt>개인정보 처리방침 <a href="javascript:privercy();">[약관보기]</a></dt>
                            <dd>
                                <ul class="bull">
                                    <li>담당 : 김성일</li>
                                    <li>전화 : 02-443-0999</li>
                                    <li>메일 : welkeeps@welkeeps.com</li>
                                </ul>
                            </dd>
                        </dl>
                    </div><!-- .page-body -->
                </div><!-- #guide -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
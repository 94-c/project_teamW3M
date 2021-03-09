<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="CONTENT-TYPE" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="naver-site-verification" content="bd290280815ba86132c708c10def12239cd80f34" />

<meta name="title" content="[웰킵스몰]웰킵스 공식쇼핑몰">
<meta name="description" content="위생,건강,안전을 대표하는 라이프케어 전문몰! 당신이 머무는 건강한 삶, 그곁에 언제나 웰킵스"> 

<meta name="robots" content="index,follow">

<meta property="og:type" content="website"> 
<meta property="og:image" content="resources/images/og_image">
<meta property="og:title" content="[웰킵스몰]웰킵스 공식쇼핑몰">
<meta property="og:description" content="위생,건강,안전을 대표하는 라이프케어 전문몰! 당신이 머무는 건강한 삶, 그곁에 언제나 웰킵스">
<meta property="og:url" content="http://www.welkeepsmall.com">
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon"><title>[웰킵스몰] 웰킵스 공식쇼핑몰</title>

<link type="text/css" rel="stylesheet" href="resources/css/common.css" /><link rel="canonical" href="http://www.welkeepsmall.com">

</head>
<body>
<script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>


<link type="text/css" rel="stylesheet" href="resources/css/slider.css" />
<script type="text/javascript" src="resources/js/jquery.sliderkit.1.9.2.pack.js"></script>

<%-- 보류... 
<script type="text/javascript" src="resources/images/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="resources/images/js/mosaic.1.0.1.min.js"></script>
<script type="text/javascript" src="resources/images/js/jquery.multipop-1.0.js"></script><!-- morenvy script -->
<script type="text/javascript" src="resources/images/js/jquery.bpopup.min.js"></script><!-- morenvy script -->
 --%>


<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">



<!-- 우측 퀵 -->
 <!-- *** 퀵메뉴는 추후에 추가할지 말지 정하기 ***
<div class="fixed_quick">
	<ul>
		<li class="right_search_area">
			<a href="#none"><img src="resources/images/icons/search_bt_off.gif" alt="검색" class="menuoff"><img src="resources/images/icons/search_bt_on.gif" class="menuon"></a>
			<div class="search_word">
				<form action="/shop/shopbrand.html" method="post" name="search">				<fieldset>
					<legend>검색 폼</legend>
						<input name="search" onkeydown="CheckKey_search();" value=""  class="MS_search_word" />						<a href="javascript:search_submit();"><input type="image" class="search_btn" src="/design/pgreen1364/0728from/r_quick01_on.gif" alt="검색" /></a>
				</fieldset>
				</form>			</div>
		</li>
		<li><a href="/shop/mypage.html?mypage_type=myorder"><img src="/design/pgreen1364/0728from/r_quick02_off.gif" class="menuoff"><img src="/design/pgreen1364/0728from/r_quick02_on.gif" class="menuon" alt="배송조회"></a></li>
		<li><a href="/shop/basket.html"><img src="/design/pgreen1364/0728from/r_quick03_off.gif" class="menuoff"><img src="/design/pgreen1364/0728from/r_quick03_on.gif" class="menuon" alt="장바구니"></a></li>
		<li><a href="/shop/todaygoods.html"><img src="/design/pgreen1364/0728from/r_quick04_off.gif" class="menuoff"><img src="/design/pgreen1364/0728from/r_quick04_on.gif" class="menuon" alt="최근본상품"></a></li>
		<li><img src="/design/pgreen1364/0728from/r_quick05_on.gif" onclick="javascript:window.open('https://lc1.lunasoft.co.kr/lunachat/api-connect/@welkeeps/main', 'lunachat', 'width=1024, height=800');" style='cursor:pointer'></a></li>
		<li class="page_up"><a href="#wrap" class="scroll"><img src="/design/pgreen1364/0728from/r_quick_up.gif"></a></li>
	</ul>
</div>
 -->
<!-- //fixed_quick -->


<div class="promoBanner">
    <a href="#" class="bannerLink">	
        <img src="resources/images/m_mask/top_banner.jpg" width=100%>
    </a>
</div>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script type="text/javascript" src="resources/images/js/index.js"></script>

<div id='blk_scroll_wings'><script type='text/javascript' src='/html/shopRbanner.html?param1=1' ></script></div>
<div id='cherrypicker_scroll'></div>
<div id="wrap">
<div id="contentWrapper">
	<div class="cboth main_img">
		<div class="sliderkit contentslider-main">
			<div class="main_img_arrow">
				<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#"></a></div>
				<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#"></a></div>
			</div>
			<div class="sliderkit-nav">
				<div class="sliderkit-nav-clip">
					<ul>
						<li><a></a></li>
						<li><a></a></li>
						<li><a></a></li>
					</ul>
				</div>
			</div>
			
			<!-- 메인 배너 스크립트 링크 수정하는곳 -->
			<div class="sliderkit-panels">
                    <div class="sliderkit-panel"><a href="#"><div style="background-image:url(resources/images/m_mask/main_visual_mask.jpg)"></div></a></div>                                
			        <div class="sliderkit-panel"><a href="#"><div style="background-image:url(resources/images/m_mask/main_visual_purell.jpg)"></div></a></div>
                   	<div class="sliderkit-panel"><a href="#"><div style="background-image:url(resources/images/m_mask/main_visual_wondercheck.jpg)"></div></a></div>                  
			</div>
		</div></div>
	</div><!-- //main_img -->
	


	<div class="cboth main_section02">
		<div class="fleft main_ban01">
		
		<!-- 좌측 2단 배너 -->
		<div class="cboth"><a href="#"><IMG SRC="resources/images/m_mask/center_left1.jpg"></a></div>
		<div class="cboth"><a href="#"><IMG SRC="resources/images/m_mask/center_left2.jpg"></a></div>
		</div>
			<div class="fleft">
				<div class="sliderkit contentslider-look">
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#none"></a></div>
					<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#none"></a></div>
					<div class="sliderkit-panels">
					
					<!-- 중앙 배너 슬라이드 123123 -->
                         <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center1.jpg"></a></div>
                         <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center2.jpg"></a></div>
                         <div class="sliderkit-panel"><a href="#"><img src="resources/images/m_mask/center_center3.jpg"></a></div>

					<!--<div class="sliderkit-panel"><a href="/shop/shopbrand.html?type=X&xcode=023"><img src="http://pgreen1364.img12.kr/202012_main_center_mask_pc.jpg"></a></div>-->
					</div>
				</div>
			</div>
			
		<!-- 우측 2단 배너 -->
		<div class="fright main_ban02">
		<div class="cboth"><a href="#"><img src="resources/images/m_mask/center_right1.jpg"></a></div>
        <div class="cboth"><a href="#"><img src="resources/images/m_mask/center_right2.jpg"></a></div>
		<!-- <div class="cboth"><a href="/shop/plan.html?plan_id=4"><img src="/design/pgreen1364/0728from/202010_bn_award.jpg"></a></div> -->
		</div>
	</div><!-- //main_section02 -->


	<div class="cboth main_section03">
		<div class="cboth main_title">웰킵스 마스크 BEST</div>
		<div class="cboth prd-list">
		<table summary="상품이미지, 상품 설명, 가격">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<tbody>
				<tr class="nopadding"><td></td><td></td><td></td><td></td></tr>
				<tr>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="list/shopdetail.jsp"><img class="MS_prod_img_m" src="resources/images/m_mask/mask1.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="52400"/>
								<input type="hidden" name="product_price" value="42000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-대형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">52,400원</li>									
								<li class="price">42,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask2.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="51400"/>
								<input type="hidden" name="product_price" value="40000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-소형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">51,400원</li>
								<li class="price">40,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
						<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask3.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="53000"/>
								<input type="hidden" name="product_price" value="42000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94-초소형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">53,000원</li>									
								<li class="price">42,000원</li>
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask4.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="53000"/>
								<input type="hidden" name="product_price" value="45000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙황사방역마스크<br>KF94-대형 50개입</li>
								<li class="subname"></li>
								<li class="consumer">53,000원</li>									
								<li class="price">45,000원</li>															
								<li class="icon"><span class='MK-product-icons'><img src='resources/images/icons/new.jpg' class='MK-product-icon-1' /></span></li>
							</ul>
						</div>
						</div>
					</td>
					</tr>
					
					<tr>
						<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask5.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26200"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,200원</li>
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask6.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26200"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 중형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,200원</li>									
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask7.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="25700"/>
								<input type="hidden" name="product_price" value="21300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 소형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">25,700원</li>									
								<li class="price">21,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask8.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="26500"/>
								<input type="hidden" name="product_price" value="22300"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 황사방역마스크<br>KF94 초소형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">26,500원</li>									
								<li class="price">22,300원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					</tr><tr>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask9.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="24500"/>
								<input type="hidden" name="product_price" value="20000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 미세먼지황사마스크<br>KF80 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">24,500원</li>									
								<li class="price">20,000원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask10.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="24000"/>
								<input type="hidden" name="product_price" value="20000"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 미세먼지황사마스크<br>KF80 소형 25개입</li>
								<li class="subname"></li>
								<li class="soldout">SOLD OUT</li>	
								<li class="price">입고 대기중</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask11.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="28700"/>
								<input type="hidden" name="product_price" value="23800"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙 황사마스크 <br>KF94 대형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">28,700원</li>									
								<li class="price">23,800원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td>
					<td>
						<div class="tb-center">
						<div class="box">
							<div class="thumb salebox">
								<a href="#"><img class="MS_prod_img_m" src="resources/images/m_mask/mask12.jpg" alt="상품 섬네일" /></a>
								<input type="hidden" name="custom_price" value="28700"/>
								<input type="hidden" name="product_price" value="23800"/>
								<span class="sale_text"></span>
							</div>
							<ul class="info">
								<li class="dsc">웰킵스 리얼블랙 황사마스크 <br>KF94 중형 25개입</li>
								<li class="subname"></li>
								<li class="consumer">28,700원</li>									
								<li class="price">23,800원</li>
								<li class="icon"><span class='MK-product-icons'></span></li>
							</ul>
						</div>
						</div>
					</td></tr><tr></tr>
			</tbody>
			</table>
		</div><!-- //prd-list -->
	</div>	
	<!-- //main_section03 -->

	
</div><!-- #contentWrapper-->
<hr />

<script type="text/javascript" src="#"></script><!-- morenvy script -->

<!-- 바이앱스 앱이면서 iOS이면 sns회원가입, 로그인 안보이게 -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
  console.log(navigator.userAgent);
  if (navigator.userAgent.match('Byapps') && navigator.userAgent.match(/iPhone|iPad|iPod|Apple/i)) {
    var snsSection = document.getElementsByClassName('sns-login')[0];
    snsSection.style.visibility = 'hidden';
  }

  if (navigator.userAgent.match('Byapps') && navigator.userAgent.match(/iPhone|iPad|iPod|Apple/i)) {
    var snsSection = document.getElementsByClassName('sns-join');
    var snsUl = snsSection.getElementsByTagName('ul')[0];
    var snsTitle = document.getElementsByClassName('sns-title')[0];

    snsUl.style.visibility = 'hidden';
    snsTitle.style.visibility = 'hidden';
  }
});
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>
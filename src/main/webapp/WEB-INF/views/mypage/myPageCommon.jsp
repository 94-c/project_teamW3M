<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css"> 
<link href="resources/admin_css/pagination.css" rel="stylesheet" type="text/css">
<div id="aside">
	<h2 class="aside-tit">마이페이지</h2>
	<div class="lnb-wrap">
		<div class="lnb-bx">
			<h2 class="txt txt1">쇼핑정보</h2>
			<div class="lnb">
				<ul>
					<li class="first"><a href="/myOrderList.do">주문내역</a></li>
					<li><a href="getPointList.do?user_id=${userVO.user_id }">적립금내역</a></li>
					<li><a href="GoCart.do">상품 보관함</a></li>
				</ul>
			</div>
		</div>
		<div class="lnb-bx">
			<h2 class="txt txt2">쇼핑문의</h2>
			<div class="lnb">
				<ul>
					<li class="first"><a
						href="myinquryList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내
							문의사항 보기</a></li>
					<li><a
						href="myReviewList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내
							후기 보기</a></li>
				</ul>
			</div>
		</div>
		<div class="lnb-bx">
			<h2 class="txt txt3">개인정보</h2>
			<div class="lnb">
				<ul>
					<li class="first"><a href="memberInfoUpdate.do">회원정보수정</a></li>
					<li><form action="memberInfoDelete.do" id="deleteSuccess"
							method="POST">
							<input type="hidden" name="user_id" value="${userVO.user_id }">
							<a href="javascript:userexit();">회원탈퇴신청</a>
						</form></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- .lnb-wrap -->
</div>
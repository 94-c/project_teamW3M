<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>장바구니</title>
<script type="text/javascript">
var count = 1;
var countEl = document.getElementById("count");
var total_count = document.getElementById("tb-center tb-bold tb-price"); //추가
var total_count_view = document.getElementById("tb-center tb-bold tb-price"); //추가
function plus(){
  count++;
  countEl.value = count;
  total_count_view.value = total_count.value * countEl.value; //추가
}
function minus(){
  
  if (count > 1) {
    count--;
    countEl.value = count;
  total_count_view.value = total_count_view.value - total_count.value; //추가  
  }  
}
//https://codepen.io/eond/pen/JKbaoO
</script>
<body>
	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="content">
				<div id="cartWrap">
					<dl class="loc-navi">
						<dt class="blind">현재 위치</dt>
						<dd>
							<a href="/">HOME</a> &gt; CART
						</dd>
					</dl>
					<!-- 공지사항 배너 -->
					<a href="getUserNoticeList.do">
					<img src="resources/images/title/bask_title.jpg"></a><br>
					<br>

					<h2 class="tit-page">장바구니</h2>
					<div class="page-body">
						<div class="table-cart table-fill-prd">
							<table summary="번호, 사진, 제품명, 수량, 적립, 가격, 배송비, 취소">
								<caption>장바구니 담긴 상품</caption>
								<colgroup>
									<col width="75">
									<col width="90">
									<col width="*">
									<col width="115">
									<col width="95">
									<col width="105">
									<col width="95">
									<col width="95">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO.</div></th>
										<th scope="col"><div class="tb-center"></div></th>
										<th scope="col"><div class="tb-center"></div></th>
										<th scope="col"><div class="tb-center">수량</div></th>
										<th scope="col"><div class="tb-center">적립</div></th>
										<th scope="col"><div class="tb-center">금액</div></th>
										<th scope="col"><div class="tb-center">배송비</div></th>
										<th scope="col"><div class="tb-center"></div></th>
									</tr>
								</thead>
								
								<!-- 총 구매 금액 -->
								<tfoot>
									<tr>
										<td colspan="8">
											<div class="tb-right">
												<strong></strong> <!--(적립금 210원) -->
											</div>
										</td>
									</tr>
								</tfoot>
								<tbody>
									<form action="basket.html" method="post" name="forms" id="basket_form0"></form>
									<input type="hidden" name="brandcode" value="023002000038">
									<input type="hidden" name="branduid" value="1001500">
									<input type="hidden" name="type">
									<input type="hidden" name="orgamount" value="1">
									<input type="hidden" name="cart_id" value="1">
									<input type="hidden" name="cart_type" value="NORMAL">
									<input type="hidden" name="min_add_amount" value="1"> <!-- seq -->
									<input type="hidden" name="maxq" value="100">
									<input type="hidden" name="pack_uid" value="">

									<tr class="nbg">
										<!-- 상품 섬네일 -->
										<td><div class="tb-center"><!-- 상품 번호 --></div></td>
										<td>
											<div class="tb-center">
												<div class="thumb">
													<!--  <a href=""> 여기 안에 상품 주소가 들어가 있었다.-->
													<!--  <img alt="상품 섬네일" title="상품 섬네일"></a> -->
												</div>
											</div>
										</td>
										
										<td>
											<div class="tb-left">
												<a href="#" class="#"><!-- 상품명 들어가야 한다. -->
												</a>
												<div id="1001500_1" class="tb-opt"></div>
											</div>
										</td>
										<td>
											<div class="tb-center">
												<div class="opt-spin">
													<input type="text" name="amount" value="1" class="txt-spin">
													<span class="btns"> 
														<a href="javascript:count_change(0, 0)"><img class="btn-up" src="resources/images/basket/spin_up.gif"></a>
														<a href="javascript:count_change(1, 0)"><img class="btn-dw" src="resources/images/basket/spin_dw.gif"></a>
													</span>
												</div>
												<a href="javascript:send_basket(0, 'upd')" class="CSSbuttonWhite btn_option">수정</a>
											</div>
										</td>
										<td><div class="tb-center"><!-- 적립금 --></div></td>
										<td><div class="tb-center tb-bold tb-price">
												<!-- 금액 -->
											</div></td>
											
										<!-- 배송비 -->
										<td><div class="tb-center tb-delivery">
												<div class="MS_tb_delivery">
													<span class="MS_deli_txt" onmouseover="overcase(this, '0')" onmouseout="outcase(this, '0')"> 
													<span class="MS_deli_title MS_deli_block"></span>
													<span class="MS_deli_desc MS_deli_block"></span>
													</span>
													<div id="deliverycase0" class="MS_layer_delivery">
														<dl>
														</dl>
														<span class="bull"></span>
														<iframe id="deliverycase_iframe0" class="MS_layer_delivery_iframe" frameborder="no" border="0"></iframe>
													</div>
												</div>
											</div></td>
										<td>
											<div class="tb-center">
												<span class="d-block">
												<a href="javascript:go_wish('1001500','1','','NORMAL');" class="CSSbuttonWhite btn_select">보관하기</a></span> 
												<span class="d-block">
												<a href="javascript:send_basket(0, 'del')" class="CSSbuttonWhite btn_select">삭제하기</a></span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .table-fill-prd -->


						<div class="btn-order-ctrl">
							<a href="javascript:multi_order()" class="CSSbuttonBlack">주문하기</a>
							<a href="/" class="CSSbuttonWhite">계속 쇼핑하기</a> 
							<a href="javascript:basket_clear();" class="CSSbuttonWhite">장바구니 비우기</a>
						</div>
						<div class="cart-ft2"></div>

					</div>
					<!-- .page-body -->
				</div>
				<!-- #cartWrap -->
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>장바구니</title>
<script type="text/javascript">
	
	function cntup(aa){
		console.log("index : "+ aa);
		var order_cnt='order_cnt'+aa;
		console.log("index id : "+ order_cnt);
		var cnt = $('#'+order_cnt).val();
		cnt++;
		
		$('#'+order_cnt).val(cnt);
		
		
	};
	function cntdown(aa){
		console.log("index : "+ aa);
		var order_cnt='order_cnt'+aa;
		console.log("index id : " +order_cnt);
		var cnt = $('#'+order_cnt).val();
		cnt--;
		if(cnt > 0){
		$('#'+order_cnt).val(cnt);
		}else return;
	};
	function send_basket(index,cart_id){

		var order_cntval='order_cnt'+index;
		var send_cnt= $('#'+order_cntval).val();
		var total_price1 = 'total_price'+index;
		var alldata = {order_cnt : send_cnt, cart_id : cart_id};
		if(send_cnt > 199){
			alert("200개는 구매하실 수 없습니다.")
			return;
		}
		
		$.ajax({
			url : "/send_order_cnt.do",
			type : "POST",
			data : JSON.stringify(alldata),
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success:function(a){
				
				alert("해당 물품의 수량이 수정되었습니다.");
				history.go();
			},
			error:function(data){
				console.log(data+"에러?");
			}
		
		});
	}
	function send_basket_delete(index,cart_seq){
		var cart_id = cart_seq;
		$.ajax({
			async : true,
			url : "/send_cart_delete.do",
			type:"POST",
			data: JSON.stringify(cart_id),
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:function(aa){
				alert("해당 뭎품이 삭제되었습니다.");
				history.go();
			}
		});
	}
		function send_basket_Alldelete(){
				
			if(confirm('장바구니를 비우시겠습니까?')){
				location.href = "/send_cart_allDelete.do",
				alert("장바구니가 비워졌습니다.");
				history.go();
					
				
			}else{
				return;
			}
		}
			
			
	


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
					<a href="getUserNoticeList.do"> <img
						src="resources/images/title/bask_title.jpg"></a><br> <br>

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
												총 구매 금액 : <strong><fmt:formatNumber value="${total_Price}" pattern="#,###" /></strong>
												원 (적립금 : <fmt:formatNumber value="${total_Point}" pattern="#,###" />)
												<!--(적립금 210원) -->
											</div>
										</td>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="CartVO" items="${cartList}" varStatus="status">
									
										<tr class="nbg">
											<!-- 상품 섬네일 -->
											<td><div class="tb-center">${status.count}</div></td>
											<td>
												<div class="tb-center">
													<div class="thumb">
														<a href="/getProduct?prod_code=${CartVO.prod_code }"><img src="${CartVO.prod_title_image }"></a>
														<!--  <a href=""> 여기 안에 상품 주소가 들어가 있었다.-->
														<!--  <img alt="상품 섬네일" title="상품 섬네일"></a> -->
													</div>
												</div>
											</td>

											<td>
												<div class="tb-left">
													<a href="/getProduct?prod_code=${CartVO.prod_code }" class="#">${CartVO.prod_title }<!-- 상품명 들어가야 한다. -->
													</a>
													<div id="1001500_1" class="tb-opt"></div>
												</div>
											</td>
											<td>
												<div class="tb-center">
													<div class="opt-spin">
														<input type="text" name="order_cnt" id="order_cnt${status.count}"
															value="${CartVO.order_cnt }" class="txt-spin"> <span
															class="btns"> <a
															href="javascript:cntup(${status.count});" id="up"><img
																class="btn-up" src="resources/images/basket/spin_up.gif"></a>
															<a href="javascript:cntdown(${status.count});" id="down"><img
																class="btn-dw" src="resources/images/basket/spin_dw.gif"></a>
														</span>
													</div>
													<a href="javascript:send_basket(${status.count},${CartVO.cart_id});"
														class="CSSbuttonWhite btn_option">수정</a>
												</div>
											</td>
											<td><div class="tb-center">
													<fmt:formatNumber value="${CartVO.total_point }" pattern="#,###" />
													<!-- 적립금 -->
												</div></td>
											<td><div class="tb-center tb-bold tb-price"  >
													<fmt:formatNumber value="${CartVO.total_price }" pattern="#,###" />원
													<!-- 금액 -->
												</div></td>

											<!-- 배송비 -->
											<td><div class="tb-center tb-delivery">
													[기본 배송]
													     조건
												</div></td>
											<td>
												<div class="tb-center">
													 <span class="d-block"> <a
														href="javascript:send_basket_delete(${status.count},${CartVO.cart_id});"
														class="CSSbuttonWhite btn_select">삭제하기</a></span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- .table-fill-prd -->
						<div class="btn-order-ctrl">
							<a href="javascript:multi_order()" class="CSSbuttonBlack">주문하기</a>
							<a href="/" class="CSSbuttonWhite">계속 쇼핑하기</a> <a
								href="javascript:send_basket_Alldelete();" class="CSSbuttonWhite">장바구니
								비우기</a>
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
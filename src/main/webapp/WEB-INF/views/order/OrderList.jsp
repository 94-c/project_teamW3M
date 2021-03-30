<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>고급형 주문서 작성</title>

<link href="resources/css/order.css" rel="stylesheet" type="text/css">
<div id="contentWrap">

	<div id="content">
		<div id="order">
			<dl class="loc-navi">
				<dt class="blind">현재 위치</dt>
				<dd>
					<a href="/">Home</a> &gt; <strong>주문서</strong>
				</dd>
			</dl>
			<div class="page-body">

				<form name="form1" id="order_form" action="#" method="post">

					<fieldset>
						<legend>주문 폼</legend>
						<h3>주문리스트</h3>
						<div class="tbl-order">
							<table>
								<caption>주문리스트</caption>
								<colgroup>
									<col style="width: 50px">
									<col style="width: 200px">
									<col style="width: 80px">
									<col style="width: 80px">
									<col style="width: 50px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">제품</th>
										<th scope="col">수량</th>
										<th scope="col">가격</th>
										<th scope="col">적립</th>
									</tr>
								</thead>
								<tbody>
									<!-- foreach문으로 작성해줘야함  -->
									<tr class="nbg">
										<td>
											<div class="tb-center">
												<div class="thumb">
													<img src="${OrderVO.prod_title_image }" width="40">
												</div>
											</div>
										</td>
										<td>
											<div class="tb-left">
												<a href="/getProduct?prod_code=${CartVO.prod_code }">${OrderVO.prod_title}
												</a>
											</div>
										</td>
										<td>
											<div class="tb-center">${OrderVO.prod_amount}</div>
										</td>
										<td>
											<div class="tb-center tb-bold">${OrderVO.prod_total_price}</div>
										</td>
										<td>
											<div class="tb-center">${OrderVO.prod_total_point}</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .table-order -->


						<h3>주문자정보</h3>
						<div class="tbl-order">
							<table>
								<caption>주문자정보</caption>
								<colgroup>
									<col style="width: 130px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<div class="txt-l">이름</div>
										</th>
										<td> 
											<input type="text" name="sender" form="order_form" 
											id="sender" class="MS_input_txt" value="${OrderVO.user_name}">
										</td>
									</tr>
									<tr>
										<th scope="row"><div class="txt-l">이메일</div></th>
										<td>
											<input type="hidden" name="oldemail" id="oldemail" value="haso1115@gmail.com"> 
												<input type="hidden" name="email" id="email" value="haso1115@gmail.com"> 
												<input type="text" name="email1" id="email1" class="MS_input_txt" maxlength="20" form="order_form"> 
												
												<span>@</span> 
												
												<span id="direct_email" style="margin-top: 3px; display: inline-block"> 
													<input type="text" name="email3" id="email3" value="gmail.com" class="MS_input_txt" disabled="" maxlength="25"
													form="order_form">
												</span> 
												
											<select name="emailsel" id="emailsel" class="MS_select MS_email" style="margin-right: 5px;"
												onchange="viewdirect()">
													<option value="direct">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="yahoo.com">yahoo.com</option>
													<option value="nate.com">nate.com</option>
													<option value="korea.com">korea.com</option>
													<option value="chol.com">chol.com</option>
													<option value="gmail.com" selected="selected">gmail.com</option>
													<option value="netian.com">netian.com</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><div class="txt-l">연락처</div></th>
										<td>
											<input type="text" name="emergency11" form="order_form" id="emergency11" size="4" maxlength="4"
											class="MS_input_txt w60" value=""> - 
											
											<input type="text" name="emergency12" form="order_form" id="emergency12" size="4" maxlength="4" 
											class="MS_input_txt w60" value=""> - 
											
											<input type="text" name="emergency13" form="order_form" id="emergency13" size="4" maxlength="4" minlength="4"
											class="MS_input_txt w60" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .tbl-order -->

						<h3> 배송 정보
							<label> 
							<!-- 체크박스 클릭시 주문자 정보에 이름과 연락처가 배송 정보 입력에 자동 작성 됨 -->
								<input type="checkbox" name="same"
								form="order_form" id="same" onclick="copydata()"> 위 정보와 같음
							</label>
						</h3>
						<div class="tbl-order">
							<table>
								<caption>배송 정보 입력</caption>
								<colgroup>
									<col style="width: 130px">
									<col>
									<col style="width: 100px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<div class="txt-l">이름</div>
										</th>
										<td colspan="3">
											<input type="text" name="receiver"
											form="order_form" id="receiver" class="MS_input_txt" value="">
										</td>
									</tr>
									<tr>
										<th scope="row"><div class="txt-l">연락처 1</div></th>
										<td>
											<input type="text" name="emergency21" form="order_form" id="emergency21" 
											size="4" maxlength="4" value="" class="MS_input_txt w60"> - 
											
											<input type="text" name="emergency22" form="order_form" id="emergency22" 
											size="4" maxlength="4" class="MS_input_txt w60" value=""> - 
										
											<input type="text" name="emergency23" form="order_form" id="emergency23" 
											size="4" maxlength="4" minlength="4" class="MS_input_txt w60" value="">
										</td>
										
										<th scope="row" style="border: 1px solid #eee">
											<div class="txt-c">연락처 2</div>
										</th>
											<td style="padding-left: 10px">
												<input type="text" name="emergency31" form="order_form" id="emergency31"
												size="4" maxlength="4" class="MS_input_txt w60" value=""> - 
												
												<input type="text" name="emergency32" form="order_form" id="emergency32" 
												size="4" maxlength="4" class="MS_input_txt w60" value=""> - 
												
												<input type="text" name="emergency33" form="order_form" id="emergency33" 
												size="4" maxlength="4" minlength="4" class="MS_input_txt w60" value="">
											</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="txt-l">배송지 선택</div>
										</th>
										<td colspan="3">
											<input type="radio" value="H" form="order_form" 
											name="place" onclick="addrclick()">자택&nbsp;&nbsp; &nbsp;&nbsp;
											
											<input type="radio" value="O" form="order_form" 
											name="place" onclick="addrclick()">회사 &nbsp;&nbsp;
											
											<input type="radio" value="A" name="place" form="order_form">
											최근 배송지&nbsp;<a href="javascript:;" class="past_list" 
											style="display: inline-block; height: 23px; line-height: 25px; padding: 0px 5px; border: 1px solid rgb(221, 221, 221); color: rgb(0, 0, 0); font-weight: bold; letter-spacing: -1px; border-radius: 3px;">
											배송지 목록</a> &nbsp;&nbsp;
											<input type="radio" value="E" name="place" form="order_form" onclick="post();">신규 배송지</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="txt-l">주소</div>
										</th>
										<td colspan="3">
											<input name="post1" id="post1" form="order_form" size="6" class="MS_input_txt w60"
											onclick="this.blur();post();"> 
											<a href="javascript:post();" class="btn-white">우편번호</a>
											<div class="mt-10">
												<input type="text" name="address1" form="order_form"
													id="address1" size="50" class="MS_input_txt w240"
													readonly=""> 
													
													<input type="hidden" name="old_address" form="order_form" 
													id="old_address" value=""> 
													
													<input type="hidden" name="old_home_address" form="order_form"
													id="old_home_address" value=""> 
													
													<input type="hidden" name="old_offi_address" form="order_form"
													id="old_offi_address" value=""> 
													
													<input type="text" name="address2" form="order_form" id="address2" size="50"
													class="MS_input_txt w240">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><div class="txt-l">
												주문메세지<br> <span>(100자내외)</span>
											</div></th>
										<td colspan="3">
											<textarea name="message" form="order_form" id="message" cols="50" rows="5" class="MS_textarea"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="txt-l">무통장 입금자명</div>
										</th>
										<td colspan="3">
											<input type="text" name="bankname" form="order_form" class="MS_input_txt" size="10"
											maxlength="40"> 
											<span class="MS_bankname_message">
												(주문자와 같을경우 생략 가능)
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .tbl-order -->


						<h3>주문상품 할인적용</h3>
						<div class="tbl-pay">
							<table>
								<caption>주문상품 할인적용</caption>
								<colgroup>
									<col style="width: 24%">
									<col style="width: 18%">
									<col style="width: 18%">
									<col style="width: 18%">
									<col style="width: 22%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품금액</th>
										<th scope="col">배송비</th>
										<th scope="col">할인금액</th>
										<th scope="col">추가금액</th>
										<th scope="col">결제 예정금액</th>
									</tr>
									<tr>
										<td>
											<div class="base">
												<strong><em><span
														class="op-total block-op-product-price" price="총 주문 금액"><!-- 총 주문금액 --></span></em>원</strong>
											</div>
										</td>
										<td>
											<div class="base">
												<strong><em><span
														class="op-total block-op-delivery-price" price="0">무료</span></em>
														<span id="block_op_delivery_unit" style="display: none;">원</span></strong>
												<!-- 총 가격에 +,- 적용 -->
												<a class="plus">
												<img src="resources/images/order/plus.png" alt="plus"></a>
												<a class="minus" style="display: none;">
													<img src="resources/images/order/minus.png" alt="minus">
												</a>
											</div>
										</td>
										<td>
											<div class="base">
												<strong><em class="fc-red">
												<span class="op-total block-op-sale-price" price="보유 적립금"><!-- 보유 적립금 --></span></em>원</strong>
												
												<a class="plus" style="display: none;">
													<img src="resources/images/order/plus.png" alt="plus">
												</a>
												<a class="minus">
													<img src="resources/images/order/minus.png" alt="minus">
												</a>
											</div>
										</td>
										
										<td>
										<!-- 추가 금액 부분 살릴지 말지 고민 
											<div class="base">
												<strong><em><span
														class="op-total block-op-add-price" price="0">0</span></em>원</strong> <a
													class="plus"><img src="/images/order/plus.png"
													alt="plus"></a><a class="minus" style="display: none;"><img
													src="/images/order/minus.png" alt="minus"></a>
											</div>
										-->
										</td>
										
										<td>
											<div class="base">
												<a class="equal">
													<img src="resources/images/order/equal.png" alt="equal">
												</a> 
												<strong><em class="fc-red">
													<span class="block-op-sum-price" price="최종 결제금액"><!-- 최종 결제금액 --></span>
												</em>원</strong>
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="txt-c">쿠폰 사용</th>
										<td colspan="4"><input type="text" name="couponnum" form="order_form"
										 	id="couponnum" class="MS_input_txt" readonly=""> 
										 	<a class="btn-darkgray" href="javascript:clickcoupon();">쿠폰선택</a> 
										 	<span class="coupon-description"></span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .tbl-pay -->

						<h3>결제 정보</h3>
						<table class="escrow-info">
							<caption>에스크로</caption>
							<colgroup>
								<col style="width: 150px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td><img src="resources/images/h_design/top_w3m.gif"></td>
									<td>고객님은 안전거래를 위해 현금으로 결제하실 때 저희 쇼핑몰에 가입한 토스페이먼츠의 구매안전서비스를
										이용할 수 있습니다.</td>
								</tr>
							</tbody>
						</table>
						<div class="tbl-order" style="margin-top: 0; border-top: 0">
							<table>
								<caption>결제 정보</caption>
								<colgroup>
									<col style="width: 110px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><div class="txt-l">결제방법</div></th>
										<td>
											<ul class="pay-method">
												<li><input type="radio" class="chk-rdo"
													name="radio_paymethod" value="C" checked="checked">
													신용카드 <em><span class="op-card-dc-price fc-red"></span></em>
												</li>
												<li><input type="radio" class="chk-rdo"
													name="radio_paymethod" value="B"> 가상계좌 <em><span
														class="op-bank-dc-price fc-red"></span></em> <select
													name="pay_data"
													class="w280 MK_bank_select_list MK_pay_add_choice"
													disabled=""><option value="">입금 계좌번호
															선택(반드시 주문자 성함으로 입금)</option>
														<option value="03">기업은행</option>
														<option value="06">국민은행</option>
														<option value="11">농협중앙</option>
														<option value="26">신한은행</option>
														<option value="81">KEB하나은행</option>
														<option value="71">우체국</option>
														<option value="39">경남은행</option>
														<option value="20">우리은행</option>
														<option value="32">부산은행</option>
														<option value="07">수협은행</option>
												</select></li>
												<li><input type="radio" class="chk-rdo"
													name="radio_paymethod" value="KAKAOPAY">
													카카오페이(KAKAOPAY) <em><span
														class="op-card-dc-price fc-red"></span></em></li>
												<li><input type="radio" class="chk-rdo"
													name="radio_paymethod" value="PAYCO"> 페이코(PAYCO) <em><span
														class="op-card-dc-price fc-red"></span></em></li>
												<li><input type="radio" class="chk-rdo"
													name="radio_paymethod" value="S"> 에스크로 <em><span
														class="op-bank-dc-price fc-red"></span></em></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .tbl-order -->

						<!-- 증빙신청 태그 추가 시 임의로 태그를 제거하게 되면 결제 등 정상 동작이 불가할 수 있습니다 !!! -->
						<div id="evidence" style="display: none;">
							<div class="tbl-order" style="margin-top: 0px; border-top: 0px;">
								<table>
									<caption>증빙 신청</caption>
									<colgroup>
										<col style="width: 110px">
										<col>
									</colgroup>
									<tbody>
									<!-- 현금영수증 관련 
										<tr>
											<th scope="row"><div class="txt-l">증빙 신청</div></th>
											<td style="padding-left: 18px;"><input type="radio"
												name="evidencecheck" form="order_form" onclick="" value="N"
												checked=""> 신청안함 <input type="radio"
												name="evidencecheck" form="order_form" onclick=""
												value="cashbill"> 현금영수증

												<div style="padding-top: 5px;">
													<div id="evidence_data">
														<script type="text/javascript" src="/js/check.js"></script>
														<div id="evidence_donot_data"
															style="display: none; color: red;">
															* 투명한 온라인 거래를 위해서 현금영수증 의무발행을 사용하고 있습니다.<br>* 현금영수증을
															신청하지 않아도 의무발행제도에 의하여 '국세청 발급번호 010-000-1234'로 발행 됩니다.
														</div>
														<div id="evidence_cashbill_data" style="display: none;">
															<span id="cashbilltype"> <select
																name="evidence_banktype" class="bank-type"
																onchange="togglecashbilltype(this.value)">
																	<option value="0" selected="">핸드폰 번호</option>
																	<option value="1">국세청 현금영수증 카드</option>
																	<option value="2">사업자 번호</option>
															</select>
															</span>
															
															 <span id="evidence_cashbill_tel"> 
															 핸드폰번호
															<input type="text" name="mobilephone" size="5" maxlength="3"
																class="MS_input_txt txt-input w60" onkeyup="nextfocus(this.form['mobilephone'][0], this.form['mobilephone'][1], 3);"
																onkeypress="InpuOnlyPhone(this)"> - 
																
																<input type="text" name="mobilephone" size="5" maxlength="4"
																class="MS_input_txt txt-input w60" onkeyup="nextfocus(this.form['mobilephone'][1], this.form['mobilephone'][2], 4);"
																onkeypress="InpuOnlyPhone(this)"> -
																
																 <input type="text" name="mobilephone" size="5" maxlength="4"
																class="MS_input_txt txt-input w60" onkeypress="InpuOnlyPhone(this)">&nbsp;
																<span style="display: none;">
																
																<input type="checkbox" name="reset">초기화</span></span> 
																
																
																국세청 현금영수증 카드
																<span id="evidence_cashbill_card" style="display: none">
																
																<input type="text" name="tax_card_number" size="5" maxlength="4" class="MS_input_txt txt-input w60"
																onkeyup="nextfocus(this.form['tax_card_number'][0], this.form['tax_card_number'][1], 4);"
																onkeypress="InpuOnlyPhone(this)"> - 
																
																<input type="text" name="tax_card_number" size="5" maxlength="4" class="MS_input_txt txt-input w60"
																onkeyup="nextfocus(this.form['tax_card_number'][1], this.form['tax_card_number'][2], 4);"
																onkeypress="InpuOnlyPhone(this)"> - 
																
																<input type="text" name="tax_card_number" size="5" maxlength="4" class="MS_input_txt txt-input w60"
																onkeyup="nextfocus(this.form['tax_card_number'][2], this.form['tax_card_number'][3], 4);"
																onkeypress="InpuOnlyPhone(this)"> - 
																
																<input type="text" name="tax_card_number" size="6" maxlength="6" class="MS_input_txt txt-input w60"
																onkeypress="InpuOnlyPhone(this)">
															</span> 
															
															
															사업자 
															<span id="evidence_cashbill_company" style="display: none"> 
															
															<input type="text" name="crn" size="4" maxlength="3"
															class="MS_input_txt txt-input w60" onkeyup="nextfocus(this.form['crn'][0], this.form['crn'][1], 3);"
															onkeypress="InpuOnlyPhone(this)"> - 
															
															<input type="text" name="crn" size="3" maxlength="2"
															class="MS_input_txt txt-input w60" onkeyup="nextfocus(this.form['crn'][1], this.form['crn'][2], 2);"
															onkeypress="InpuOnlyPhone(this)"> - 
															<input 	type="text" name="crn" size="6" maxlength="5" class="MS_input_txt txt-input w60"> 
															
															<span class="company-name">업체명 : 
																<input type="text" name="crname" size="16" maxlength="20" class="MS_input_txt txt-input w60">
															</span>
															</span>
														</div>
														
														<div id="evidence_taxbill_data" style="display: none;">
															<table class="tbl-taxbill">
																<colgroup>
																	<col style="width: 19%">
																	<col style="width: *">
																</colgroup>
																<tbody>
																	<tr>
																		<th><div>신청자명</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>휴대폰번호</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>이메일</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>사업자번호</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>상호(법인명)</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>대표자명</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>사업장주소</div></th>
																		<td>
																			<div>
																				<a href="" class="btn-white">우편번호</a><br> <br>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>업태</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																	<tr>
																		<th><div>종목</div></th>
																		<td>
																			<div></div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div></td>
										</tr>
										-->
									</tbody>
								</table>
							</div>
						</div>
						<div class="lst-order" style="display: block;">
							<ul id="payinfo_V" class="payment-info" style="display: none">
								<li>· 본인 계좌 정보입력으로 결제금액이 이체되는 서비스입니다.</li>
								<li>· 인터넷뱅킹과 동일한 보안방식을 적용하므로 안전하며, 상점에 정보가 남지 않습니다.</li>
							</ul>
							<ul id="payinfo_C" class="payment-info" style="display: block;">
								<li>· 안심클릭 및 인터넷안전결제(ISP)서비스로 <font color="blue">128bit
										SSL</font>로 암호화된 결제 창이 새로 뜹니다.
								</li>
								<li>· 결제후, 카드명세서에 [<font color="red">tosspayments.com(토스페이먼츠)</font>]로
									표시되며, 카드 정보는 상점에 남지 않습니다.
								</li>

							</ul>
							<ul id="payinfo_D" class="payment-info" style="display: none">
								<li>· 결제정보가 상점에 남지 않으며, 보안 적용된 결제창이 새로 뜹니다.</li>
								<li>· 결제후, 핸드폰 요금청구서에 '소액결제'로 표시됩니다.</li>
								<li>· <font color="red">결제후, 결제건의 취소는 해당 달에만 가능합니다.</font></li>

							</ul>
							<ul id="payinfo_A" class="payment-info" style="display: none">
								<li><img src="/images/common/paypal_text_KOR.gif"></li>
							</ul>
							<ul id="payinfo_T" class="payment-info" style="display: none">
								<li>·제휴BC카드 이외의 카드로는 결제가 되지 않습니다.</li>
							</ul>
							<ul id="payinfo_PAYCO" class="payment-info" style="display: none">

								<li style="color: #3b3b3b;"><strong>★ 페이코 POINT
										결제시<font color="red"> “언제나” 2%</font> 적립 (기본 0.2% 적립)
								</strong></li>
								<li style="color: #3b3b3b;"><strong>★ 페이코 첫 결제시
										1만원 이상 <font color="red">2,000원 즉시 할인</font>
								</strong></li>


							</ul>
							<ul id="payinfo_KAKAO" class="payment-info" style="display: none">
								<li>· <img src="/images/common/orderpay_kakao.gif"
									alt="카카오페이" style="vertical-align: middle;"></li>
								<li>· 가장 빠른 모바일 결제 <img
									src="/images/common/orderpay_kakao2.gif" alt="카카오페이"
									style="margin: 0 5px; vertical-align: middle;"> <a
									href="http://www.kakao.com/kakaopay" target="_blank"
									style="text-decoration: underline;">지금 바로 확인하세요&gt;</a></li>

							</ul>
							<ul id="payinfo_KAKAOPAY" class="payment-info"
								style="display: none">
								<li>· 카카오톡에서 신용/체크카드 연결하고, 결제도 지문으로 쉽고 편리하게 이용하세요!</li>
								<li>· 본인명의 스마트폰에서 본인명의 카드 등록 후 사용 가능</li>
								<li>· (카드등록 : 카카오톡 &gt; 더보기 &gt; 카카오페이 &gt; 카드)</li>
								<li>· 이용가능 카드사 : 모든 국내 신용/체크카드</li>
								<li>· 카드 결제 시, 결제금액 200만원 이상일 경우 ARS추가 인증이 필요합니다. 카카오머니
									결제시는 추가인증 없음</li>
							</ul>
							<ul id="payinfo_SSGPAY" class="payment-info"
								style="display: none">
								<li>· <img src="/images/common/orderpay_ssgpay.png"
									alt="쓱페이" style="vertical-align: middle; margin-bottom: 6px;"></li>
								<li>· SSG MONEY : 현금영수증 발급 가능합니다.(쇼핑몰에 별도 신청)</li>
								<li>· 결제 불가 카드 : 씨티카드, 비씨카드(수협, 우체국 등)</li>
								<li>* SSGPAY는 이마트, 신세계백화점, 스타벅스 등에서 사용할 수 있는 신세계의 간편결제
									서비스입니다.</li>
								<li>* 결제방법 : 앱 가입 ▷ 머니충전/카드등록 ▷ 비밀번호 6자리 입력하여 결제!</li>

							</ul>
							<ul id="payinfo_SETTLE_BANK" class="payment-info"
								style="display: none">
								<li>· 최초 사용 시 통장 등록 및 ARS 인증하면, 비밀번호 입력만으로 계좌 결제가 가능합니다.</li>
								<li>· 결제 후에는 현금영수증이 자동 발급됩니다.</li>
								<li>· 1회 / 1일 최대 결제금액 한도는 200만원입니다.</li>

							</ul>
							<ul id="payinfo_SMILEPAY" class="payment-info"
								style="display: none">
								<li><font color="red">* 스마일페이 혜택</font></li>
								<li>1) 스마일페이 결제 시 <font color="red">0.5%</font> 기본 적립(최대
									5천원)
								</li>
								<li>2) 스마일페이에 등록한 스마일카드로 결제 시 <font color="red">2%</font>
									추가 적립
								</li>

							</ul>
							<ul id="payinfo_TOSS" class="payment-info" style="display: none">
								<li>· 토스에 등록된 계좌와 신용/체크카드로 쉽고 편리하게 결제하세요.</li>
								<li>· 이용가능 카드사 : 비씨, 삼성, 롯데, 하나, 신한, 현대카드 (KB카드, NH농협 준비중)</li>
								<li>· 이용가능 은행 : 20개 은행과 8개 증권사</li>
								<li>· 토스 간편결제시 토스에서 제공하는 카드사별 무이자, 청구할인, 결제이벤트만 제공됩니다.</li>
								<li>· 토스머니 결제시 현금영수증은 자동으로 신청됩니다.</li>

							</ul>
							<ul id="payinfo_NPAY" class="payment-info" style="display: none">
								<li>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
								<li>· 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이
									비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
								<li>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티,
									카카오뱅크</li>
								<li>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협,
									우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크,
									삼성증권, KDB산업은행,씨티은행, SBI은행, 유안타증권, 유진투자증권</li>
								<li>· 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수
									있습니다.</li>

							</ul>
							<ul id="payinfo_CHAIPAY" class="payment-info"
								style="display: none">
								<li>· CHAI는 은행 계좌만 등록하면 간편하게 결제할 수 있는 결제 서비스입니다.</li>
								<li>· 은행점검시간인 23:30~00:30까지는 이용이 불가합니다. (단, 차이머니 보유 시
									은행점검시간 관계 없이 결제 가능합니다.)</li>
								<li>· 등록 가능한 계좌는 CHAI 앱에서 확인 가능합니다.</li>
								<li>· 결제에 사용할 은행 계좌는 휴대폰 명의자와 일치해야 합니다.</li>
								<li>· CHAI 머니 잔액 부족 시 자동충전 후 결제 됩니다.</li>
								<li>· CHAI 결제를 이용하고 취소 시 CHAI 머니로 환불됩니다.</li>
								<li>* CHAI 특별 혜택 *<br> 1) 1만원 이상 생애 첫 결제 시 <font
									color="red">5천원 즉시할인</font>(단, 상시 1.5% 적립과 중복 불가)<br> 2)
									상시 <font color="red">1.5% 캐시백</font>(결제 건당 2천원)<br> 3)
									자동충전 설정 후 결제 시 <font color="red">1% 추가 캐시백</font>(결제 건당 500원)<br>
									* 해당 혜택은 차이 사정에 의해 조기 종료 될 수 있습니다.
								</li>

							</ul>
							<ul id="payinfo_B" class="payment-info" style="display: none">
								<li>· 입금은행 선택후 결제하기 클릭시 1회용 계좌가 생성되며 생성된 계좌로 [2일이내] 입금완료 시
									입금확인이 처리됩니다.</li>
								<li>· <font color="red">주의! 가상계좌 입금시, 반드시 은행 / 이름 /
										금액이 꼭 일치해야 합니다!</font></li>
							</ul>
							<ul id="payinfo_S" class="payment-info" style="display: none">
								<li>· 결제 시도 시 생성되는 ‘에스크로 모듈’ 상의 필수 정보를 기재해 주시기 바랍니다.</li>
								<li>· <font color="red">주의! 발급된 가상계좌로 입금 시, 반드시 이름 /
										금액이 꼭 일치해야 합니다!</font></li>
							</ul>
						</div>

						<!-- 고급형 사은품 선택 노출 -->

						<h3>주문자 동의</h3>
						<div class="tbl-order">
							<table>
								<caption>주문자 동의</caption>
								<colgroup>
									<col style="width: 130px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<!-- 주문자 동의가 있어야 주문하기 버튼 클릭 가능 -->
										<th scope="row"><div class="txt-l">주문동의</div></th>
										<td><label class="label"> 
										<input type="checkbox" id="pay_agree" name="pay_agree" form="order_form">
												상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
										</label></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- .tbl-order -->

						<div class="tbl-order tot-order">
							<table>
								<caption></caption>
								<colgroup>
									<col style="width: 100px">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>최종 결제금액</th>
										<td><strong class="price"><span><!-- 장바구니 총 가격 --></span>원</strong>
											&nbsp; (적립예정: <span><!-- 장바구니 총 적립금 --></span>원)
											<div class="reserve-msg">(적립 예정금액과 최종 적립금액은 상이할 수 있습니다.
												주문 완료 시 지급되는 적립금을 확인해주시기 바랍니다.)</div></td>
									</tr>

								</thead>
							</table>
						</div>
						<!-- .tbl-pay -->

						<div id="paybutton">
							<!-- 주문자 동의가 있어야 주문하기 버튼 클릭 가능 -->
							<a href="javascript:send();" class="CSSbuttonBlack">주문하기</a> 
							<a href="<!--장바구니로 이동-->" class="CSSbuttonWhite">주문취소</a>
						</div>
					</fieldset>
				</form>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #order -->
	</div>
	<!-- #content -->
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
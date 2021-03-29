<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>회원 정보 수정</title>	
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="join_test">
				<div class="cateTit_v2 join">
					<em class="title">회원 가입</em>
				</div>
				<div class="page-body">

					<form action="login_insert.do" method="post" id="user_insert">
						<div id="personInfo">
							<table class="person-tb">
								<colgroup>
									<col style="width: 155px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>이름
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="text" name="user_name" id="user_name"
													class="MS_input_txt normal-input" size="15" maxlength="30"><span
													class="check_font" id="name_check"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>아이디
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="text" name="user_id" id="user_id"
													class="MS_input_txt normal-input" size="10" maxlength="12"><span
													class="check_font" id="id_check"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>비밀번호
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="password" name="user_password"
													id="user_password1" class="MS_input_txt normal-input"
													size="15" maxlength="20"><span class="idpw-info"
													id="pw_check1"> * 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여
													8~16자 </span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>비밀번호 확인
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="password" name="user_password2"
													id="user_password2" class="MS_input_txt normal-input"
													value="" size="15" maxlength="20"><span
													id=pw_check2></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>생년월일
											</div>
										</th>
										<td>
											<div class="col-cell social">
												<select name="user_birthday" id="user_birthday1"
													class="MS_select MS_birthday">
													<option value="">선택</option>
													<c:set var="today" value="<%=new java.util.Date()%>" />
													<fmt:formatDate value="${today}" pattern="yyyy"
														var="sysYear" />
													<c:forEach begin="0" end="80" var="idx" step="1">
														<option value="<c:out value="${sysYear - idx}" />"><c:out
																value="${sysYear - idx}" /></option>
													</c:forEach>
												</select>년<select name="user_birthday" id="user_birthday2"
													class="MS_select MS_birthday">
													<option value="">선택</option>
													<c:forEach begin="01" end="12" step="1" var="month">
														<option value="<c:out value="${month}"/>"><c:out
																value="${month}" /></option>
													</c:forEach>

												</select>월<select name="user_birthday" id="user_birthday3"
													class="MS_select MS_birthday">
													<option value="">선택</option>
													<c:forEach begin="01" end="31" step="1" var="day">
														<option value="<c:out value="${day}"/>"><c:out
																value="${day}" /></option>
													</c:forEach>
												</select>일&nbsp;&nbsp; <input type="radio" name="user_gender"
													id="user_gender" value="남자" class="MS_radio">남 <input
													type="radio" name="user_gender" value="여자" class="MS_radio"
													checked>여
											</div>
										</td>
									</tr>

									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>우편번호
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="text" name="user_zipcode" id="user_zipcode"
													readonly class="MS_input_txt small-input" size="7"
													maxlength="15"> <input type="button"
													class="cbtn form" onclick="DaumPostcode();" value="우편번호 찾기"><br>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>집주소
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="text" name="user_address1" id="user_address1"
													readonly class="MS_input_txt large-input" size="40"
													maxlength="100">
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>상세주소
											</div>
										</th>
										<td>
											<div class="col-cell">
												<input type="text" name="user_address2" id="user_address2"
													class="MS_input_txt large-input" size="40" maxlength="100">
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>휴대폰
											</div>
										</th>
										<td>
											<div class="col-cell">
												<select name="user_phone" id="user_phone1"
													class="MS_input_tel normal-input">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>- <input type="text" name="user_phone" id="user_phone2"
													class="MS_input_tel normal-input" size="4" maxlength="4">-
												<input type="text" name="user_phone" id="user_phone3"
													class="MS_input_tel normal-input" size="4" maxlength="4">
												<input type="button" id="send_sms" class="cbtn form"
													value="휴대폰 인증하기"><span id=phone_check></span>&nbsp;&nbsp;
												<input type="text" name="phone_certification"
													id="phone_certification" placeholder="인증번호"
													class="MS_input_tel normal-input" size="4" maxlength="6">
												<span id=phone_check1></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>이메일
											</div>
										</th>
										<td>
											<div class="col-cell email-area">

												<input type="text" name="user_email" id="user_email1"
													class="MS_input_txt normal-input" size="10" maxlength="20"
													value=""> <span>@</span> <span id="direct_email"
													style="margin-top: 3px; display: inline-block"> <input
													type="text" name="user_email" id="user_email2"
													class="MS_input_txt normal-input" size="15" maxlength="25">
												</span> <select name="user_email3" id="user_email3"
													class="MS_select MS_email" style="margin-right: 5px;">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="yahoo.com">yahoo.com</option>
													<option value="nate.com">nate.com</option>
													<option value="korea.com">korea.com</option>
													<option value="chol.com">chol.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="netian.com">netian.com</option>
												</select>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<fieldset>
							<legend>약관 동의 폼</legend>
						</fieldset>
						<div class="new-privercy-contract">
							<div id="chkwrap">
								<div class="all-chk">
									<label><input type="checkbox" name="every_agree"
										id="every_agree" class="input-cbox new_every_agree" checked>
										전체동의</label>
								</div>
								<div class="cont p10">
									<ul>
										<li class="ml-30 pt-10"><label><input
												type="checkbox" name="user_yaok" id="user_yaok"
												class="input-cbox every_agree" checked> 이용약관</label> <a
											href="#chk_cont1">내용보기</a></li>
										<li class="ml-30 pt-10"><label><input
												type="checkbox" name="user_privacy" id="user_privacy"
												value="agree_uidB" class="input-cbox every_agree" checked>
												개인정보 수집 및 이용 안내</label> <a href="#chk_cont2">내용보기</a></li>


									</ul>
									<div class="marketing pb-10">
										<div class="mk-wrap">
											<label class="mk-all"><strong>마케팅 수신동의 </strong></label>&nbsp;
											( <label><input type="checkbox"
												name="user_marketing_mail" id="user_marketing_mail"
												class="input-cbox every_agree ad_every_agree" checked>
												이메일</label> <label class="pl-30"><input type="checkbox"
												name="user_marketing_sms" id="user_marketing_sms"
												class="input-cbox every_agree ad_every_agree" checked>
												SMS</label>)
										</div>
										쇼핑몰에서 제공하는 신상품 소식/ 할인쿠폰을 무상으로 보내드립니다!<br> 단, 상품 구매 정보는
										수신동의 여부 관계없이 발송됩니다.<br> <strong>제공 동의를 하지 않으셔도
											서비스 이용에는 문제가 없습니다.</strong>
									</div>
								</div>
							</div>
							<div class="new-btn-area">
								<input type="button" id="insert_success" value="동의하고 가입완료"
									onclick="">
							</div>
						</div>
					</form>
					<h4 class="tit" id="chk_cont1">이용약관</h4>
					<div class="privercy-contract">
						<pre><textarea cols="200" wrap="soft" rows="10" readonly="readonly" style="margin: 0px; width: 1245.5px; height: 188px;">${tos.tos_content } </textarea></pre>
					</div>

					<h4 class="tit" id="chk_cont2">개인정보 수집·이용</h4>
					<table border="0" summary="구분, 목적, 항목, 보유기간, 필수정보, 선택정보"
						class="contract-tbl">
						<caption>개인정보 수집·이용</caption>
						<colgroup>
							<col width="100">
							<col width="33%">
							<col width="33%">
							<col width="33%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><div>구분</div></th>
								<th scope="col"><div>목적</div></th>
								<th scope="col"><div>항목</div></th>
								<th scope="col"><div>보유기간</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" rowspan="1"><div>필수정보</div></th>
								<td><div class="p10 purposeY">회원제 서비스 이용 / 본인확인</div></td>
								<td><div class="p10 itemsY">이름, 아이디, 비밀번호, 이메일, 휴대폰</div></td>
								<td><div class="p10 holdingY">회원탈퇴 후 5일까지</div></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="agree_uidB" id="agree_uidB" value="1_5_">
					<table border="0" summary="구분, 목적, 항목, 보유기간, 필수정보, 선택정보"
						class="contract-tbl">
						<caption>개인정보 수집·이용</caption>
						<colgroup>
							<col width="100">
							<col width="33%">
							<col width="33%">
							<col width="33%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" rowspan="2"><div>선택정보</div></th>
								<td><div class="p10 purpose1">마케팅 활용(이벤트, 맞춤형 광고)</div></td>
								<td><div class="p10 items1">휴대폰, 이메일</div></td>
								<td><div class="p10 holding1">회원탈퇴 후 5일까지</div></td>
							</tr>
							<tr>

								<td><div class="p10 purpose5">마케팅 활용(이벤트, 맞춤형 광고)</div></td>
								<td><div class="p10 items5">휴대폰, 이메일, 쿠키정보</div></td>
								<td><div class="p10 holding5">수신동의를 받는 날로부터 1년마다 자동갱신</div></td>
							</tr>
						</tbody>
					</table>
					<p class="pl-6 btm-msg">
						귀하께서는 쇼핑몰에서 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수
						있습니다.<br> 다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.
					</p>
				</div>

				<!-- use_contract -->
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
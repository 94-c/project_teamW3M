<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>개인 정보 수정</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/insertMember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/insertmember.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	var name_ck = -1;
	var id_ck = -1;
	var pw_ck1 = -1;
	var pw_ck2 = -1;
	var birth_ck = -1;
	var adress_ck = -1;
	var phone_ck = -1;
	var email_ck = -1;
	$(document).ready(function() {

		$("#update_success").click(function() { // 회원가입 버튼

			if (name_ck == 1) {
				alert("이름을 확인해 주세요.")
			} else if (id_ck == 1) {
				alert("아이디를 확인해 주세요.")
			} else if (pw_ck1 == 1) {
				alert("비밀번호를 확인해 주세요.")
			} else if (pw_ck2 == 1) {
				alert("비밀번호 확인을 확인해 주세요.")
			} else if (birth_ck == 1) {
				alert("생일을 확인해 주세요.")
			} else if (adress_ck == 1) {
				alert("주소를 확인해 주세요.")
			} else if (phone_ck == 1) {
				alert("휴대폰을 확인해 주세요.")
			} else if (email_ck == 1) {
				alert("이메일을 확인해 주세요.")
			} else {
				alert("회원 정보 수정이 완료되었습니다.\n다시 로그인 해주십시오.");				
				$("#user_update").submit();
			}
		});
	});
	$(document).ready(function(){ 
		$("#user_password1_uadate").blur(function() { // 비밀번호  확인
			if($("#user_password1_uadate").val() ==""){
				$("#pw_check1_uadate").text("");
				pw_ck1 = 0;
				return;
			}
			if (pwJ.test($("#user_password1_uadate").val())) {
					$("#pw_check1_uadate").text(" OK");
					$("#pw_check1_uadate").css("color","blue");
					pw_ck1 = 0;
			} else {
				$("#pw_check1_uadate").text("* 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자");
				$("#pw_check1_uadate").css("color", "red");
				pw_ck1 =1;
				return;
			}
		});
	});
	$(document).ready(function(){ 
		$("#user_password2_uadate").blur(function() { // 비밀번호  재 확인 
			if($("#user_password2_uadate").val() ==""){
				pw_ck1 = 0;
				return;
			}
			if (($("#user_password1_uadate").val())==(($("#user_password2_uadate"))).val()) {
					$("#pw_check2_uadate").text(" OK");
					$("#pw_check2_uadate").css("color","blue");
					pw_ck2 = 0;
			} else {
				$("#pw_check2_uadate").text("비밀번호가 일치하지 않습니다.");
				$("#pw_check2_uadate").css("color", "red");
				pw_ck2 =1;
				return;
			}
		});
	});
	$(document).ready(function() {
		var birthday = $("#fullbirthday").val();
		var sp = birthday.split('-');
		var gender = $("#fullgender").val().trim();
		var phone = $("#fullphone").val().trim();
		var sp2 = phone.split('-');
		var email = $("#fullemail").val().trim();
		var sp3 = email.split('@');
		var mmail = $("#user_marketing_m").val().trim();
		var msms = $("#user_marketing_s").val().trim();

		$("#user_birthday1").val(sp[0]);
		$("#user_birthday2").val(sp[1]);
		$("#user_birthday3").val(sp[2]);
		if (gender == "남자") {
			$("#user_gender").prop("checked", true);
		} else {
			$("#user_gender").prop("checked", false);
		}
		$("#user_phone1").val(sp2[0]);
		$("#user_phone2").val(sp2[1]);
		$("#user_phone3").val(sp2[2]);
		$("#user_email1").val(sp3[0]);
		$("#user_email2").val(sp3[1]);
		if (mmail == "true") {
			$("#user_marketing_mail").prop("checked", true);
		}else{
			$("#user_marketing_mail").prop("checked", false);
		} 
		if (msms == "true") {
			$("#user_marketing_sms").prop("checked", true);
		}else{
			$("#user_marketing_sms").prop("checked", false);
		} 
	});
</script>
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="join_test">
				<div class="cateTit_v2 join">
					<em class="title">회원정보 입력</em>
				</div>
				<div class="page-body">

					<form action="user_update.do" method="post" id="user_update">
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
													class="MS_input_txt normal-input" size="15" maxlength="30"
													value="${userVO.user_name }" readonly="readonly"><span
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
												<input type="text" name="user_id" id="user_id2"
													class="MS_input_txt normal-input" readonly="readonly"
													value="${userVO.user_id }" size="10" maxlength="12">
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
													id="user_password1_uadate" class="MS_input_txt normal-input"
													size="15" maxlength="20"><span class="idpw-info"
													id="pw_check1_uadate"> * 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여
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
													id="user_password2_uadate" class="MS_input_txt normal-input"
													value="" size="15" maxlength="20"><span
													id=pw_check2_uadate></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="head-cell">
												<span class="empha">*</span>생년월일
											</div>
										</th>
										<td><input type="hidden" value="${userVO.user_birthday }"
											id="fullbirthday">
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

												</select>일&nbsp;&nbsp; <input type="hidden"
													value="${userVO.user_gender }" id="fullgender"> <input
													type="radio" name="user_gender" id="user_gender" value="남자"
													class="MS_radio">남 <input type="radio"
													name="user_gender" value="여자" class="MS_radio" checked>여
											</div></td>
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
													maxlength="15" value="${userVO.user_zipcode }"> <input
													type="button" class="cbtn form" onclick="DaumPostcode();"
													value="우편번호 찾기"><br>
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
													maxlength="100" value="${userVO.user_address1 }">
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
													class="MS_input_txt large-input" size="40" maxlength="100"
													value="${userVO.user_address2 }">
											</div>
										</td>
									</tr>
									<tr>
										<th><input type="hidden" id="fullphone"
											value="${userVO.user_phone }">
											<div class="head-cell">
												<span class="empha">*</span>휴대폰
											</div></th>
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

											</div>
										</td>
									</tr>
									<tr>
										<th><input type="hidden" id="fullemail"
											value="${userVO.user_email }">
											<div class="head-cell">
												<span class="empha">*</span>이메일
											</div></th>
										<td>
											<div class="col-cell email-area">
												<input type="hidden" name="oldemail" id="oldemail" value="">
												<input type="hidden" name="email" id="email" value="">
												<input type="text" name="user_email" id="user_email1"
													class="MS_input_txt normal-input" size="10" maxlength="20"
													value=""> <span>@</span> <span id="direct_email"
													style="margin-top: 3px; display: inline-block"> <input
													type="text" name="user_email" id="user_email2"
													class="MS_input_txt normal-input" value="" size="15"
													maxlength="25">
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
									<tr>
										<th>
											<div class="head-cell">마케팅 수신동의</div>
										</th>
										<td>
										<input type="hidden" value="${userVO.user_marketing_mail}" id = user_marketing_m>
										<input type="hidden" value="${userVO.user_marketing_sms}" id = user_marketing_s>
										<label><input type="checkbox"
												name="user_marketing_mail" id="user_marketing_mail"
												class="input-cbox every_agree ad_every_agree" checked>
												이메일</label> <label class="pl-30"><input type="checkbox"
												name="user_marketing_sms" id="user_marketing_sms"
												class="input-cbox every_agree ad_every_agree" checked>
												SMS</label></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea join-footer">
							<input type="button" class="cbtn form" id="update_success"
								value="수정하기" onclick=""> <a href="mypage.do"
								class="cbtn form">취소하기</a>
						</div>
					</form>
				</div>
				<!-- use_contract -->
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<title>개인 정보 수정</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<link href="resources/css/insertMember.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/insertmember.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>

//아이디 정규식 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크
var idJ = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
// 비밀번호 정규식 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자
var pwJ = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/); 
// 이름 정규식 한글만~
var nameJ = RegExp(/^[가-힣]{2,6}$/);
//숫자만 
var phoneJ= RegExp(/^([0-9]{4})$/);

var name_ck = -1;
var id_ck = -1;
var pw_ck1 = -1;
var pw_ck2 = -1;
var birth_ck = -1;
var adress_ck = -1;
var phone_ck = -1;
var email_ck = -1;


	$(document).ready(function() {
		
		$("#insert_success").click(function() { // 회원가입 버튼

			console.log("이름 - " + name_ck );
			console.log("아이디 - " + id_ck );
			console.log("pw - " + pw_ck1 );
			console.log("repw - " + pw_ck2 );
			console.log("생일 - " + birth_ck );
			console.log("주소 - " + adress_ck );
			console.log("폰 - " + phone_ck );
			console.log("이메일 - " + email_ck );
			console.log("약관 - " + $("#user_privacy").val );
			console.log("개인정보 - " + $("#user_yaok").val );
			
		
			if(!$("#user_yaok").prop("checked")){
				alert("약관 동의 확인해 주세요.")
			}else if(!$("#user_privacy").prop("checked")){
				alert("개인정보 수집 및 이용 안내 동의 확인해 주세요.")
			}else if(name_ck != 0){
				alert("이름을 확인해 주세요.")
			}else if(id_ck != 0){
				alert("아이디를 확인해 주세요.")
			}else if(pw_ck1 != 0){
				alert("비밀번호를 확인해 주세요.")
			}else if(pw_ck2 != 0){
				alert("비밀번호 확인을 확인해 주세요.")
			}else if(birth_ck != 0){
				alert("생일을 확인해 주세요.")
			}else if(adress_ck != 0){
				alert("주소를 확인해 주세요.")
			}else if(phone_ck != 0){
				alert("휴대폰을 확인해 주세요.")
			}else if(email_ck != 0){
				alert("이메일을 확인해 주세요.")
			}else{

				  $("#user_insert").submit();
			}
		
			
		});
	
	});

	$(document).ready(function() {

		$("#user_email3").change(function() { // email검사
			var text = $("#user_email3").val();
			$("#user_email2").val(text);
			if($("#user_phone2").val() == ""){
				email_ck = 1;
				return;
			}
			else if($("#user_phone3").val() == ""){
				email_ck = 1;
				return;
			}else {
				email_ck = 0;
			}
		});

	});
	
	$(document).ready(function(){ 

		$("#user_name").blur(function() { // 이름  확인
			if (nameJ.test($("#user_name").val())) {
					$("#name_check").text(" OK");
					$("#name_check").css("color","blue");
					name_ck =0;
			} else {
				$("#name_check").text("이름을 확인해 주세요.");
				$("#name_check").css("color", "red");
				name_ck =1;
				return;
			}
		});
	});
	
	$(document).ready(function(){ 

		$("#user_birthday3").blur(function() { // 생일 확인
			console.log("년 - " + $("#user_birthday1").val());
			console.log("월 - " + $("#user_birthday2").val());
			console.log("일 - " + $("#user_birthday3").val());
			if($("#user_birthday1").val() == ""){
				birth_ck = 1;
			}else if ($("#user_birthday2").val() == ""){
				birth_ck = 1;
			}else if ($("#user_birthday3").val() == ""){
				birth_ck = 1;
			}else {
				birth_ck = 0;
			}
				
			
		});
	});
	
	$(document).ready(function(){ 
		$("#user_id").blur(function(){ // 아이디 중복확인
			var user_id = $("#user_id").val();
			
			if (idJ.test($("#user_id").val())){
				$("#id_check").text("");
				console.log("형식은 맞음 - "+user_id);
				
			}else if(!idJ.test($(this).val())){
				$("#id_check").text("* 영문 대.소문자, 숫자 ,- 만 입력 가능하고 5~20자 입력하세요.");
				$("#id_check").css("color","red");
				console.log("형식이 틀림 - "+user_id);
				id_ck = 1;
				return;
			}else return;
			$.ajax({
				async : true,
				url : "user_id_check.do",
				type : "POST",
				data : user_id,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success  : function(data){
					if(data > 0){
						$("#id_check").text("사용중인 아이디 입니다 .");
						$("#id_check").css("color","red");
						id_ck = 1;
						return;
					}
					else{
						$("#id_check").text(" OK");
						$("#id_check").css("color","blue");
						
						id_ck =0;
					}
				}
			});
		});
			
		$(document).ready(function(){ 
			$("#user_password1").blur(function() { // 비밀번호  확인
				if (pwJ.test($("#user_password1").val())) {
						$("#pw_check1").text(" OK");
						$("#pw_check1").css("color","blue");
						pw_ck1 = 0;
				} else {
					$("#pw_check1").text("* 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자");
					$("#pw_check1").css("color", "red");
					pw_ck1 =1;
					return;
				}
			});
		});
		$(document).ready(function(){ 
			$("#user_password2").blur(function() { // 비밀번호  재 확인 
				if (($("#user_password1").val())==(($("#user_password2"))).val()) {
						$("#pw_check2").text(" OK");
						$("#pw_check2").css("color","blue");
						pw_ck2 = 0;
				} else {
					$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
					$("#pw_check2").css("color", "red");
					pw_ck2 =1;
					return;
				}
			});
		});
		
		
	$(document).ready(function(){ 	
		$("#send_sms").click(function(){
			if (!phoneJ.test($("#user_phone2").val())){
				alert("중간번호를 확인해 주세요")
				phone_ck = 1;
				return;
			}
			if (!phoneJ.test($("#user_phone3").val())){
				alert("마지막번호를 확인해 주세요")
				phone_ck = 1;
				return;
			}
			
			if($("#user_phone2").val() == ""){
				alert("휴대폰 번호를 입력해 주세요.")
				phone_ck = 1;
				return;
			}
			if($("#user_phone3").val() == ""){
				alert("휴대폰 번호를 입력해 주세요.")
				phone_ck = 1;
				return;
			}
			
		var allPhone = $("#user_phone1").val() + $("#user_phone2").val() + $("#user_phone3").val();
		console.log("phone - "+allPhone);
		alert("인증번호 전송 성공");
		$.ajax({
			url: "/send_sms.do",
			type: "post",
			data: allPhone,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success: function(result){
				$("#phone_certification").blur(function(){
					if(result == $("#phone_certification").val()){
						$("#phone_check1").text("인증 되었습니다.");
						$("#phone_check1").css("color","blue");
						phone_ck = 0;
					}else{
						$("#phone_check1").text("인증이 실패하였습니다. 다시 확인해 주세요");
						$("#phone_check1").css("color","red");
						phone_ck = 1;
						}	
					})
			}
				})
			
			
		});
	
		});


	
		$("#every_agree").click(function() {
			if($("#every_agree").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
				
			}else{
				$("input[type=checkbox]").prop("checked",false);
				
			}
			
		});
		
		$("input[type=checkbox]").click(function(){
			if($("input[type=checkbox]:checked").length == 5){
				$("#every_agree").prop("checked",true);
			}else{
				$("#every_agree").prop("checked",false);
			}
		});
		
	});
	
	
		function DaumPostcode() {
			new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	                $("#user_zipcode").val(data.zonecode);
	                $("#user_address1").val(fullRoadAddr);
	                $("#user_address2").focus();
	                adress_ck = 0;
	
	            }
	        }).open();
	    }

	</script>
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="content">
			<div id="join_test">
				<div class="cateTit_v2 join">
					<em class="title">회원정보 입력</em>
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
												<input type="text" name="user_name" id="user_name" class="MS_input_txt normal-input" size="15" maxlength="30"><span class="check_font" id ="name_check"></span>
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
												<input type="text" name="user_id" id="user_id" class="MS_input_txt normal-input" size="10" maxlength="12"><span class="check_font" id ="id_check"></span>
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
													 size="15" maxlength="20"><span class="idpw-info" id="pw_check1"> * 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자
													 </span>
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
													value="" size="15" maxlength="20"><span id= pw_check2></span>
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
												<input type="text" name="user_zipcode" id="user_zipcode" readonly
													class="MS_input_txt small-input" size="7" maxlength="15">
												<input type="button" class="cbtn form" onclick="DaumPostcode();" value="우편번호 찾기"><br>
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
												<input type="text" name="user_address1" id="user_address1" readonly
													class="MS_input_txt large-input" size="40" maxlength="100">
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
                                            <div class="head-cell">뉴스메일</div>
                                        </th>
                                        <td>
                                            <div class="col-cell">
                                                <label style="margin-right:20px;">        
                                                <input type="radio" name="emailreceive" value="Y"> 받습니다.</label>
                                                <label>        
                                                <input type="radio" name="emailreceive" value="N" checked=""> 받지 않습니다.</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="head-cell">SMS안내</div>
                                        </th>
                                        <td>
                                            <div class="col-cell">
                                                <label style="margin-right:20px;">        
                                                <input type="radio" name="smsreceive" value="Y"> 받습니다.</label>
                                                <label>        
                                                <input type="radio" name="smsreceive" value="N" checked=""> 받지 않습니다.</label>
                                            </div>
                                        </td>
                                    </tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea join-footer">
                        <a href=# class="cbtn form action">수정하기</a>
                        <a href="#" class="cbtn form">취소하기</a>
                    </div>

						
				</div>
				</fieldset>
				<!-- use_contract -->
			</div>
		</div>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
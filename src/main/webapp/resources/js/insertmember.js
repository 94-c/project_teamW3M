//아이디 정규식 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크
var idJ = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
// 비밀번호 정규식 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자
var pwJ = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/); 
// 이름 정규식 한글만~
var nameJ = RegExp(/^[가-힣]{2,6}$/);
//숫자만 
var phoneJ= RegExp(/^([0-9]{4})$/);
//이메일
var emailJ = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);


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
	$("#user_email2").blur(function(){
		if($("#user_email3").val() == ""){
			console.log("이메일 직접 입력");
			var emailCheck =  $("#user_email1").val() +"@"+$("#user_email2").val();
			console.log(emailCheck);
			if (emailJ.test(emailCheck)){
			console.log("email형식  OK");
			email_ck = 0;
			}
			else{
				console.log("email형식  NO");
				email_ck = 1;
			}
		}
	});
	$("#user_email3").change(function() { // email검사
		var text = $("#user_email3").val();
		$("#user_email2").val(text);
		if($("#user_email2").val() == ""){
			email_ck = 1;
			return;
		}
		else if($("#user_email1").val() == ""){
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
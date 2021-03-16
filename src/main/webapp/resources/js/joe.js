/**
 * 김요셉 JS 파일입니다. 건들지마세요!!!
 */
 
 /* 로그인 관련 스크립트*/
$(document).ready(function(){
		$("#login_btn").click(function(e){
			e.preventDefault();
			var userId = $("#user_id").val();
			var userPw = $("#user_password").val();
			
			if(userId == ""){
				alert("아이디를 입력하세요");
				$("#user_id").focus();
				return;
			}
			if(userPw == ""){
				alert("비밀번호를 입력하세요");
				$("#user_password").focus();
				return;
			}
		$("form:first").submit();
		});
});

$(document).ready(function(){
	$("#haveSession").click(function(){
		alert("이미 로그인중입니다.");
		return;
	});
	$("#haveNoSession").click(function(){
		alert("현재 로그인상태가 아닙니다. 로그인부터 해주세요.");
		return;
	});
});

/* ID&PW찾기 관련 스크립트 */
$(document).ready(function(){		
		var input_name = $("#find_id_name_wrap").children();		
		var input_phone = $("#find_id_mobile_wrap").children();

		$(".findID").click(function(e){
			e.preventDefault();
			if(input_name.val() == ""){
				alert("이름을 입력해주세요");
				input_name.focus();
				return;
			}
			if(input_phone.val() == ""){
				alert("휴대폰 번호를 입력해주세요");
				input_phone.focus();
				return;
			}
			location.href="/findID.do";
		});		
});

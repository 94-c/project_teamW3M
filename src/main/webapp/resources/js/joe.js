/**
 * 김요셉 JS 파일입니다. 건들지마세요!!!
 */
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
});
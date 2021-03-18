/**
 * 김요셉 JS 파일입니다. 건들지마세요!!!
 */
 
 /* 로그인 관련 스크립트 */
$(document).ready(function(){
		$("#login_btn").click(function(e){
			e.preventDefault();
			emptyCheck();
			$("form:first").submit();
		});
});
function enterkey() {
        if (window.event.keyCode == 13) {
        	if(emptyCheck()=="finish"){
        		$("form:first").submit();
        	}else{
        		return;
        	}      	
        }        
};
function emptyCheck(){
	var userId = $("#user_id").val();
	var userPw = $("#user_password").val();
	
	if(userId == ""){
		alert("아이디를 입력하세요");
		$("#user_id").focus();
		return;
	}
	else if(userPw == ""){
		alert("비밀번호를 입력하세요");
		$("#user_password").focus();
		return;
	}else{
		return "finish";
	}
};

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

/* 로그아웃 관련 스크립트 */
function logoutAlert(){
		alert("로그아웃 되었습니다.");
		return;
	};
	
/* ID&PW찾기 관련 스크립트 */
$(document).ready(function(){		
	var input_name = $("#find_id_name_wrap").children();		
	var input_phone = $("#find_id_mobile_wrap").children();
	var phoneNumber = input_phone.val();
	var name = input_name.val();
	var phoneNumber_ck = RegExp(/^([0-9]{11})$/);
	var name_ck = RegExp(/^[가-힣]{2,6}$/);
	
		$(".findID").click(function(e){
			e.preventDefault();
			if(input_name.val() == ""){
				alert("이름을 입력해주세요");
				input_name.focus();
				return;
			}
			if(!(name_ck.test($("#find_id_name_wrap").children().val()))){
				alert("이름을 확인해주세요. 한글이름만 가능합니다.");
				input_name.focus();
				console.log($("#find_id_name_wrap").children().val());
				return;
			}
			if(input_phone.val() == ""){
				alert("휴대폰 번호를 입력해주세요");
				input_phone.focus();
				return;
			}
			if(!(phoneNumber_ck.test($("#find_id_mobile_wrap").children().val()))){
				alert("'-'(하이픈)을 제외한 11자리의 휴대폰 번호를 입력해 주세요.");
				input_phone.focus();
				return;
			}
			$(".findIdForm").submit();
		});
});
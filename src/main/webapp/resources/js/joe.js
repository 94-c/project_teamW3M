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
	
	if($("#user_id").val() == ""){
		alert("아이디를 입력하세요");
		$("#user_id").focus();
		return;
	}
	else if($("#user_password").val() == ""){
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
$(document).ready(function(){ //ID찾기
	var input_name = $("#find_id_name_wrap").children();		
	var input_phone = $("#find_id_mobile_wrap").children();

	var phoneNum_ck = RegExp(/^([0-9]{11})$/); //폰번호형식 검사
	var name_ck = RegExp(/^[가-힣]{2,6}$/); //이름형식 검사
	
		$(".findID_btn").click(function(e){
			e.preventDefault();
			if(input_name.val() == ""){
				alert("이름을 입력해주세요");
				input_name.focus();
				return;
			}
			if(!name_ck.test(input_name.val())){
				alert("2~6자 사이의 이름을 입력해주세요. 한글이름만 가능합니다.");
				input_name.focus();
				return;
			}
			if(input_phone.val() == ""){
				alert("휴대폰 번호를 입력해주세요");
				input_phone.focus();
				return;
			}
			if(!phoneNum_ck.test(input_phone.val())){
				alert("'-'(하이픈)을 제외한 11자리의 휴대폰 번호를 입력해 주세요.");
				input_phone.focus();
				return;
			}
			$(".findIdForm").submit();
		});
});
$(document).ready(function(){ //PW찾기
	var input_id = $("#find_pw_id_wrap").children();
	var input_phone = $("#find_pw_mobile_wrap").children();

	var id_ck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/); //아이디형식 검사
	var phoneNum_ck = RegExp(/^([0-9]{11})$/); //폰번호형식 검사
	
		$(".findPW_btn").click(function(e){
			e.preventDefault();
			if(input_id.val() == ""){
				alert("ID를 입력해주세요");
				input_id.focus();
				return;
			}
			if(!id_ck.test(input_id.val())){
				alert("5~20자 사이의 아이디를 입력해주세요.");
				input_id.focus();
				return;
			}
			if(input_phone.val() == ""){
				alert("휴대폰 번호를 입력해주세요");
				input_phone.focus();
				return;
			}
			if(!phoneNum_ck.test(input_phone.val())){
				alert("'-'(하이픈)을 제외한 11자리의 휴대폰 번호를 입력해 주세요.");
				input_phone.focus();
				return;
			}
			$(".findPwForm").submit();
		});
});
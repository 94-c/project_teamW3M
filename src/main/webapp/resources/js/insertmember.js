/** 
 *  회원가입 유효성 
 */
// 아이디 정규식 영문 대.소문자, 숫자 _,-만 입력 가능하고 5에서 20자리를 입력했는지 체크한다 {}사이에는 n과 m을 입력하여 n과 m사이의 값을 입력했는지 체크한다. n만 입력했을 경우 n자리 수 만큼 입력했는지 체크
var idJ = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
// 비밀번호 정규식 패스워드 체크에서는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자
var pwJ = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/); 
// 이름 정규식 한글만~
var nameJ = RegExp(/^[가-힣]{2,6}$/);
//숫자만 
var phoneJ= RegExp(/^[0-9]/g);

var count = 0;

	$(document).ready(function() {

		$("#user_email3").change(function() {
			var text = $("#user_email3").val();
			$("#user_email2").val(text);
		});

	});
	
	$(document).ready(function(){ 
		
		
		$("#user_name").keyup(function() { // 이름  확인
			if (nameJ.test($("#user_name").val())) {
					$("#name_check").text("");
			} else {
				$("#name_check").text("이름을 확인해 주세요.");
				$("#name_check").css("color", "red");
				count =1;
				return;
			}
		});
		
		$("#user_id").blur(function(){ // 아이디 중복확인
			var user_id = $("#user_id").val();
			
			if (idJ.test($("#user_id").val())){
				$("#id_check").text("");
				console.log("형식은 맞음 - "+user_id);
				
			}else if(!idJ.test($(this).val())){
				$("#id_check").text("아이디는 영문자로 시작하는 5~19자 영문자 또는 숫자이어야 합니다.");
				$("#id_check").css("color","red");
				console.log("형식이 틀림 - "+user_id);
				count = 1;
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
						count = 1;
						return;
					}
					else{
						$("#id_check").text("사용가능한 아이디 입니다.");
						$("#id_check").css("color","blue");
					}
				}
			
			});
		});
		
		
		
		$("#every_agree").click(function() {
			if($("#every_agree").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
				
			}else{
				$("input[type=checkbox]").prop("checked",false);
				;
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
	

	
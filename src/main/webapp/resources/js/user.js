/**
 *  회원가입 유효성검사
 */
function User_Check(){

if($("#user_id").val() == ""){
        alert("아이디 입력바람");
        $("#user_id").focus();
        return;
      }

if($("#user_name").val() == ""){
        alert("이름 입력바람");
        $("user_name").focus();
        return;
      }
  $("#signform").submit();
}
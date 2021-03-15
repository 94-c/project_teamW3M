/**
 *  회원가입 유효성검사
 */
function Admin_Check(){

if($("#admin_Id").val() == ""){
        alert("아이디 입력바람");
        $("#admin_Id").focus();
        return;
      }

if($("#admin_Password").val() == ""){
        alert("패스워드 입력바람");
        $("admin_Password").focus();
        return;
      }


  $("#signform").submit();
}
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
        <title>관리자 페이지 로그인</title>
        <link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="resources/js/adminlogin.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
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
			var userId = $("#admin_id").val();
			var userPw = $("#admin_password").val();
			
			if(userId == ""){
				alert("아이디를 입력하세요");
				$("#admin_id").focus();
				return;
			}
			else if(userPw == ""){
				alert("비밀번호를 입력하세요");
				$("#admin_password").focus();
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
		</script>
    </head>
    
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header" >
	                                    <center>
	                                    	<img src="resources/images/h_design/top_w3m.gif">
	                                    </center>
                                    	<h3 class="text-center font-weight-light my-4">관리자 로그인</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action = "index.mdo" id="signform" method="post">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputAddress">아이디</label>
                                                <input class="form-control py-4" onkeyup="enterkey();" type="text" name = "admin_id" id="admin_Id"/>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">비밀번호</label>
                                                <input class="form-control py-4" onkeyup="enterkey();" type="password" name="admin_password" id="admin_Password" />
                                            </div>
                                            
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0" >
                                                <input type="button" onclick="Admin_Check()" class="btn btn-primary center" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="/">홈으로</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
	
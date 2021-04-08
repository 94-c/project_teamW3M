<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지 로그인</title>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
<link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function(e) {
			e.preventDefault();
			if (emptyCheck() == "finish") {
				$("form:first").submit();
			}
		});
	});
	function enterkey() {
		if (window.event.keyCode == 13) {
			if (emptyCheck() == "finish") {
				$("form:first").submit();
			}
		}
	};
	function emptyCheck() {
		if ($("#admin_id").val() == "") {
			alert("아이디를 입력하세요");
			$("#admin_id").focus();
			return;
		}
		if ($("#admin_password").val() == "") {
			alert("비밀번호를 입력하세요");
			$("#admin_password").focus();
			return;
		}
		return "finish";
	};
</script>
</head>

<body class="bg-primaryLogin">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<div align="center">
										<img src="resources/images/h_design/top_w3m.gif">
									</div>
									<h3 class="text-center font-weight-light my-4">관리자 로그인</h3>
								</div>
								<div class="card-body">
									<form action="login.mdo" id="signform" method="post">
										<div class="form-group">
											<label class="small mb-1" for="inputAddress">아이디</label> <input
												class="form-control py-4" onkeyup="enterkey();" type="text"
												name="admin_id" id="admin_id" autofocus="autofocus"/>
										</div>

										<div class="form-group">
											<label class="small mb-1" for="inputPassword">비밀번호</label> <input
												class="form-control py-4" onkeyup="enterkey();"
												type="password" name="admin_password" id="admin_password" />
										</div>

										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="button" id="login_btn" class="btn btn-primary center" value="로그인">
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="/">홈으로</a>
									</div>
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

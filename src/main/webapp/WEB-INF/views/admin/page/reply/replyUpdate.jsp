<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/menu.css">
<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
<link type="text/css" rel="stylesheet" href="resources/css/notification.css">
<link type="text/css" rel="stylesheet" href="resources/css/comment.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$("#contentbutton").click(function(){
		console.log("1");
		var re_reply_data_id = $("#re_reply_data_id").val();
		var re_reply_data_pw = $("#re_reply_data_pw").val();
		var re_reply_data_con = $("#re_reply_data_con").val();
		var re_reply_data_seq =  $('#re_reply_data_seq').val();
		console.log(re_reply_data_id);
		console.log(re_reply_data_pw);
		console.log(re_reply_data_con);
		console.log(re_reply_data_seq);
		
		var alldata ={
				"review_re_writer" :re_reply_data_id,
				"review_re_pass" : re_reply_data_pw,
				"review_re_content" :re_reply_data_con,
				"review_re_seq" :re_reply_data_seq
		}
		console.log(alldata);
		
		$.ajax({
			url : "replyUpdate.do",
			type : "POST",
			data : JSON.stringify(alldata),
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success  : function(data){
				console.log(data+ "성공");
				opener.location.reload();
				window.close();
				}
				
			
		});
	
	});
});

</script>
</head>
<body>

				<input type="hidden" name="review_re_seq" id="re_reply_data_seq" class="MS_input_txt input-style input-style2" value="${replyVO.review_re_seq }">
						<table>
							<tbody>
								<tr>
									<td class="com-wrt-box">
										<div>
											<div class="wrt">
												<span>
												<input type="hidden" name="review_re_writer" id="re_reply_data_id" class="MS_input_txt input-style input-style2" value="${userVO.user_id }"  placeholder="아이디">
												<label>아이디 : ${userVO.user_id }</label></span>
											</div>
											<div class="wrt wrt_write">
												<textarea name="review_re_content" id="re_reply_data_con"  placeholder="내용">${replyVO.review_re_content }</textarea><br>
											</div>
										</div>
										<input type="button" class="CSSbuttonBlack" id="contentbutton"  value="수정"/>
									</td>
								</tr>
							</tbody>
						</table>
			
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 주문 배송지</title>
<link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function click(index){ 	
	var lastadd = 'lastAddress_seq'+index;
	
	if($('#'+lastadd).prop("checked",true)){		
			var seq = $('#'+lastadd).val();
		}else{}
}

function setParentText(){
    opener.document.getElementById("receiver_name").value = document.getElementById("ad_receiver_name").value
    opener.document.getElementById("receiver_zipcode").value = document.getElementById("ad_receiver_zipcode").value
    opener.document.getElementById("receiver_address1").value = document.getElementById("ad_receiver_address1").value
    opener.document.getElementById("receiver_address2").value = document.getElementById("ad_receiver_address2").value
    opener.document.getElementById("receiver_phone1").value = document.getElementById("ad_receiver_phone1").value
    opener.document.getElementById("receiver_phone2").value = document.getElementById("ad_receiver_phone2").value
    window.close();
}

$(document).ready(function(){ 
	$("#delete").click(function(){
		var last_address_seq = $("#last_address_seq").val();
		
		var alldata ={
				"last_address_seq" :last_address_seq
		}
		
		$.ajax({
			url : "delete_last_address.do",
			type : "POST",
			data : JSON.stringify(alldata),
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success  : function(data){
				location.reload();
				}
		});
	});
});
</script>
<style type="text/css">
input[type="text"], input[type="date"], input[type="tel"], input[type="number"], input[type="email"], input[type="password"], select {
    height: 35px;
    border: 1px solid #bbb;
    vertical-align: middle;
    padding-left: 10px;
    box-sizing: border-box;
    -webkit-border-radius: 0;
    border-radius: 0;
}
form, fieldset, legend, label {margin: 0; padding: 0; border:0;}
fieldset legend {
	position: absolute;
    visibility: hidden;
    overflow: hidden;
    width: 0;
    height: 0;
    margin: 0;
    padding: 0;
    font: 0/0 Arial;
}
* {padding: 0; margin: 0;}
a {text-decoration:none;}
li {list-style:none;}
/* pc 팝업 */
.address-pop {padding: 30px 20px;}
.address-pop .tab-area {width:100%; border-bottom: 2px solid #2868de;}
.address-pop .tab-cnt {width:100%;}
.address-pop .tab-area ul {overflow: hidden;}
.address-pop .tab-area ul li {width: 128px; float: left; border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc;}
.address-pop .tab-area ul li a {display: block; height: 30px; line-height: 30px; text-align: center; font-size: 12px; color: #666666; font-weight: bold;}
.address-pop .tab-area ul li:first-child {border-right: none;}
.address-pop .tab-area ul li.on {border-left: 1px solid #2868de; border-right: 1px solid #2868de; border-top: 1px solid 
#2868de;}
.address-pop .tab-area ul li.on a {background: #6a8beb; color: #ffffff;}
.address-pop .tab-area .title-box {width: 128px; border-top: 1px solid #ccc; border-left: 1px solid #ccc; border-right: 1px solid #ccc; height: 30px; line-height: 30px; text-align: center; font-size: 12px; font-weight:  bold; color: #666666; /*background: #2868de;*/}
.address-pop .adress {max-height: 464px; overflow-y:auto; border-bottom: 1px solid #cccccc;}
.address-pop .adress li {display:table; width : 100%; padding : 13px 0px; border-top : 1px solid #cccccc; #overflow : hidden; position: relative;}
.address-pop .adress li:first-child {border-top: none;}
.address-pop .adress li .check {position: absolute; left: 10px;}
.address-pop .adress li .text {width: 85%; padding: 0; float:left;}
.address-pop .adress li .text p {width: 100%;}
.address-pop .adress li .text .name { display: inline-block; font-weight: bold; line-height: 20px; font-size: 12px; color: #333333;}
.address-pop .adress li .text .name .basic { display: inline-block; padding: 0 5px; margin-left: 5px; font-size: 11px; color: #ffffff; background: #68c40e; border-radius: 5px; line-height: 18px;}
.address-pop .adress li .text .ad {line-height: 18px; font-size: 12px; color: #333333;}
.address-pop .adress li .text .tell {line-height: 18px; font-size: 12px; color: #333333;}
.address-pop .adress li .text .memo {width:330px; overflow: hidden; text-overflow:ellipsis; white-space:nowrap; line-height: 17px; font-size: 12px; color: #666666;}
.address-pop .adress li .btn-select {display:table-cell; width: 5%; padding:0; vertical-align:middle; #float:right;}
.address-pop .adress li .btn-select a {display: block; width: 45px; height: 24px; line-height: 24px; text-align: center; font-size: 11px; color: #ffffff; float: right;}
.address-pop .adress li .btn-select a.select {background: #327add; border: 1px solid #2262cb;}
.address-pop .adress li .btn-select a.ad-book {margin-top: 5px; background: #8d8d8d; border: 1px solid #666666;}
.address-pop .adress.check-type li .text {padding:  0 15px 0 30px; width:76%;}
.address-pop .btn-area {margin-top: 30px; text-align: center;}
.address-pop .btn-area div {display: inline-block; #display:inline; #zoom:1;}
.address-pop .btn-area div .btn40 {display: inline-block; width: 117px; line-height: 38px; text-align: center; font-size: 16px;}
.address-pop .btn-area div .btn40.blue {border: 1px solid #0f62cb; background: #2d81ea; color: #ffffff;}
.address-pop .btn-area div .btn40.black {border: 1px solid #333333; background: #555555; color: #ffffff;}
.address-pop .btn-area .btn-go-myplace {margin-left: 10px;}
.address-pop .none-ad {width: 100%; padding: 50px 0; vertical-align: middle;}
.address-pop .none-ad p {font-size: 12px; color: #333; text-align: center;}
.address-pop .addplace {width:100%;}
.address-pop .addplace .title {padding: 25px 0 10px; border-bottom: 1px solid #cccccc; line-height: 25px; font-size: 20px; color: #000; font-weight: bold;}
.address-pop .addplace .table {padding: 20px 0 10px;}
.address-pop .addplace .table table {width: 100%; border: 1px solid #97abe1;}
.address-pop .addplace .table table th {padding: 0 15px; background: #f6f6f6; text-align: left; font-size: 12px; color: #333333; border-top: 1px solid #dbdbdb;}
.address-pop .addplace .table table th em {font-weight: 400; font-size: 11px; font-style:normal;}
.address-pop .addplace .table table td {padding: 12px 10px; border-top: 1px solid #dbdbdb; border-left: 1px solid #dbdbdb;}
.address-pop .addplace .table table td input {width: 100%; height: 23px; font-size: 11px; color: #666;}
.address-pop .addplace .table table td textarea {width: 100%; height: 60px; font-size: 11px; color: #666; padding:5px 10px;}
.address-pop .addplace .table table td select + textarea {margin-top:10px;}
.address-pop .addplace .table table td .post p {padding-top: 10px; overflow: hidden;}
.address-pop .addplace .table table td .post p * {float: left;}
.address-pop .addplace .table table td .post p a {display: inline-block; width: 59px; height: 23px; margin-left: 5px;}
.address-pop .addplace .table table td .post p a img {width: 100%; border:0;}
.address-pop .addplace .table table td .post p:first-child {margin-top: 0;}
.address-pop .addplace .table table td .post p:first-child input {width: 55px; float: left;}
.address-pop .addplace .table table td .post p:first-child span {display: inline-block; width: 15px; line-height: 23px; text-align: center; font-size: 11px; color: #666666; float: left;}
.address-pop .addplace .table table td p.post-number-input {#padding-top: 0px;}
.address-pop .addplace .table table td p.post-number-input input {width: 55px; float: left;}
.address-pop .addplace .table table td p.post-number-input span {display: inline-block; width: 15px; line-height: 23px; text-align: center; font-size: 11px; color: #666666; float: left;}
.address-pop .addplace .table table td .phone {overflow: hidden;}
.address-pop .addplace .table table td .phone input {width: 55px; float: left;}
.address-pop .addplace .table table td .phone span {display: inline-block; width: 15px; line-height: 23px; text-align: center; font-size: 11px; color: #666666; float: left;}
.address-pop .addplace .table table td select {width: 100%; height: 23px; font-size: 11px; color: #666;}
.address-pop .addplace .table table tr:first-child th {border-top: none;}
.address-pop .addplace .table table tr:first-child td {border-top: none;}
.address-pop .addplace label {font-size: 12px; color: #333333;}
.address-pop .addplace label input {margin-right:5px; vertical-align:middle;}
/* mobile 팝업 */
.popup {padding: 20px 10px; font-size: 11px; color: #4c4c4c;}
.popup .address-add .title {padding: 8px 0 8px 13px; background: url(/images/d3/m_04/ico_arr_popup.png) left center no-repeat; background-size: 8px 13px; font-weight:bold; font-size: 14px; color: #4c4c4c;}
.popup .address-add .table {margin-bottom:10px;}
.popup .address-add table {width:100%; border: 1px solid #d5d5d5;}
.popup .address-add table th {padding: 0 10px; border-top: 1px solid #e4e7e8; background: #f1f1f1; vertical-align: middle; text-align: left; font-size:12px;}
.popup .address-add table th em {font-style:normal;}
.popup .address-add table td {padding: 5px 10px; border-top: 1px solid #e4e7e8; border-left: 1px solid #e4e7e8;}
.popup .address-add table td input[type=text] {width: 100%; border: 1px solid #c9c9c9; height: 28px; font-size: 11px; color: #4c4c4c;}
.popup .address-add table td select {width:100%; font-size: 11px; color: #4c4c4c;}
.popup .address-add table td textarea {width:100%; height: 87px; padding:10px; font-size: 11px; color: #4c4c4c;}
.popup .address-add table td select + textarea {margin-top:10px;}
.popup .address-add table td .btn-gray {display:block; background: #858585; line-height: 29px; text-align: center; font-size: 12px; color: #ffffff;}
.popup .address-add table td .address-box * {margin-top: 5px;}
.popup .address-add table td .address-box p {margin-top: 5px;}
.popup .address-add table td .address-box p:first-child {margin-top: 0;}
.popup .address-add table td .address-box p:first-child * {margin-top: 0;}
.popup .address-add table td .address-box p:first-child input {width: 55px; float:left;}
.popup .address-add table td .address-box p.post {overflow: hidden;}
.popup .address-add table td .address-box p.post * {float: left;}
.popup .address-add table td .address-box p.post span {display: inline-block; width: 15px; line-height: 23px; text-align: center; font-size: 11px; color: #666;}
.popup .address-add table td .address-box p.post a {width: 100%; margin-top: 5px;}
.popup .address-add table td .phone {overflow: hidden;}
.popup .address-add table td .phone input {width: 55px; float: left;}
.popup .address-add table td .phone span {display: inline-block; width: 15px; line-height: 23px; text-align: center; font-size: 11px; color: #666666; float: left;}
.popup .address-add table tr:first-child th {border-top: none;}
.popup .address-add table tr:first-child td {border-top: none;}
.popup .address-add label {font-size: 11px; color: #4c4c4c;}
.popup .address-add label input[type=checkbox] {margin-right:5px; vertical-align:middle;}
.popup .address-add .btn-wrap a {margin-top:5px;}
.popup .address-add .btn-wrap .btn-white {width:auto; float:none;}
.popup .address-add .btns {margin-top: 10px;}
.popup .address-add .btns p {margin-top: 5px;}
.popup .address-add .btns p a {display: block; line-height: 34px; text-align: center; font-size: 12px;}
.popup .address-add .btns p a.btn-black {border: 1px solid #393939; background: #393939; color: #ffffff;}
.popup .address-add .btns p a.btn-white {border: 1px solid #393939; background: #ffffff; color: #393939;}
.popup.add .address-add {display: block;}
.popup.add .tab-cnt {display: none;}
.popup.add > .btn-wrap {display: none;}

.popup .tab-wrap ul {overflow: hidden;}
.popup .tab-wrap ul li {float: left; width: 50%;}
.popup .tab-wrap ul li a {display:block; border: 1px solid #858585; line-height: 40px; text-align: center; font-size: 13px; color: #3b3b3b; background: #f1f1f1;}
.popup .tab-wrap ul li.on a {background: #858585; color: #ffffff;}
.popup .tab-wrap ul li:first-child {border-right: none;}
.popup .tab-wrap .title-box {width: 50%; border-top: 1px solid #858585; border-left: 1px solid #858585; border-right: 1px solid #858585; line-height: 40px; text-align: center; font-size: 13px; color: #3b3b3b; background: #f1f1f1;}
.popup .tab-cnt .address.check-type li .text {padding: 0 15px 0 20px;}
.popup .tab-cnt .address li {margin-top: 7px; padding: 15px 10px; border: 1px solid #d5d5d5; line-height:14px; font-size: 12px; color: #4c4c4c; position: relative;}
.popup .tab-cnt .address li .check {position: absolute; left: 10px;}
.popup .tab-cnt .address li .text {width: auto; padding: 0 15px 0 0; vertical-align: middle;}
.popup .tab-cnt .address li .text .name {margin-bottom:5px; font-weight: bold; font-size: 13px; color: #4c4c4c;}
.popup .tab-cnt .address li .text .name .basic {display: inline-block; padding: 0 5px; background: #68c40e; font-size: 10px; color: #ffffff; border-radius: 5px;}
.popup .tab-cnt .address li .text .tell {line-height:14px; font-size: 12px; color: #4c4c4c;}
.popup .tab-cnt .address li .text .memo {display: inline-block; line-height:14px; font-size: 12px; color: #666666; width: 100%; overflow: hidden; text-overflow:ellipsis; white-space:nowrap;}
.popup .tab-cnt .address li .btn-select {margin-top: 5px; text-align: right;}
.popup .tab-cnt .address li .btn-select a {display: inline-block; width: 50px; line-height: 24px; text-align: center; font-size: 11px; color: #ffffff;}
.popup .tab-cnt .address li .btn-select a.btn-black {background: #393939;}
.popup .tab-cnt .address li .btn-select a.btn-gray {background: #858585;}
.popup .tab-cnt .address li .ad-book {margin-top: 5px;}
.popup .tab-cnt .address li.on {border:2px solid #000000;}
.popup .tab-cnt .none-ad {padding: 50px 0;}
.popup .tab-cnt .none-ad p {text-align: center; font-size: 12px; color: #000;}

.popup .btn-wrap {display: block; margin-top: 15px;}
.popup .btn-wrap div {overflow: hidden; margin-top: 5px;}
.popup .btn-wrap div a {display: block; line-height: 35px; text-align: center; font-size: 12px; color: #393939;}
.popup .btn-wrap div a.btn-black {border: 1px solid #393939; background: #393939; color: #ffffff;}
.popup .btn-wrap div a.btn-white {border: 1px solid #393939; width:48%; float:left;}
.popup .btn-wrap div a.btn-white + .btn-white {float:right;}

/* 우편번호 레이어 */
.layer {width: 100%; min-height: 100%; z-index: 3; position: fixed; left: 0; top: 0; background:rgba(60,60,60,0.8); font-size: 12px;}
.layer .layer-pop {width:90%; background-color: #fff; position: relative; box-shadow: 0px 1px 10px #494949; margin:80px auto;}
.layer .layer-pop h3 {background-color: #efefef; height: 36px; line-height: 36px; font-weight: bold; padding: 0 10px; color: #3b3b3b;}
.layer .layer-pop .txt {max-height: 300px; overflow-y: auto; padding:10px;}
.layer .layer-pop .close {width:45px; height:36px; color:#fff; line-height: 36px; position:absolute; top:0; right:0;  background-color: #4f4f4f; text-align: center;}
body #comment_password {border-radius:0 !important; font-size:1em;}
body #comment_password .head {background-color: #efefef; height: 36px; line-height: 36px; font-weight: bold; text-align:left !important; padding: 0 10px;}
body #comment_password .head h5 {border-bottom:0px none !important; font-size:1em !important; padding:0 !important;}
body #comment_password .head a.close {width:45px; height:36px; color:#fff; line-height: 42px; top:0 !important; right:0 !important; text-align: center;}
body #comment_password .contents p {font-size:1em !important; font-weight:normal;}
body #comment_password .contents .form-wrap2 input {height: 35px;}
body #comment_password .contents .form-wrap2 p:last-child a {display:block; background-color: #393939; color:#fff; position:initial !important; padding:10px 0; margin-top: 10px;}
.step-comm {display:none;}
.layer input {height: 35px; border: 1px solid #bbb; vertical-align: middle; padding-left: 10px; box-sizing:border-box;}
.layer select {margin-top: 5px; height: 35px;}
.layer .keyword input {width:45%;}
.layer .msg01 {text-align: center;}
.layer .MS_addr_type_area {text-align: center; margin:10px 0;}
.layer .search-form .btn_Grey {width:105px; display:inline; margin-left: 10px;}
.layer .addr-list {width:100%;}
.layer .msg-wrap {background-color: #fbfbfb; padding:10px 0; text-align: center;}
.layer .msg-wrap .msg01-highlight {color:#1984f1;}
.layer #searchStep02 {margin-top:10px;}
.layer #searchStep02 h4 {font-weight: bold;}
.layer #searchStep02 .btn_Black {margin-top:10px;}
.layer #searchStep03 table {width:100%;}
.layer #searchStep03 table th {width:20%; text-align: left; font-size: 12px;}
.layer #searchStep03 table td {padding:10px 0;}
.layer #searchStep03 table .detail-addrPost input {width:50px;}
.layer #searchStep03 table .detail-addrAddress input {width:90%; margin-bottom: 5px;}
.addr_type {text-align:center; font-weight: bold;}
.addr_type label {margin:0 5px;}
.btn_Grey {width:100%; height:35px; line-height:35px; background-color:#858585; color:#fff; text-align:center; display:block; border:1px solid #858585; box-sizing: border-box; vertical-align: middle;}
.btn_Black {width:100%; height:35px; line-height:35px; background-color:#393939; color:#fff; text-align:center; display:block; border:1px solid #393939; box-sizing: border-box; vertical-align: middle;}
</style>
</head>

<body  style="width: 700px; height: 500px">
    <div class="address-pop">
        <div class="tab-area">
                    <div class="title-box">최근 배송지</div>
                </div>
            <div class="tab-cnt" >
			<form name="form_past_list" method="post">
				<ul class="adress check-type" >
					<li >
						<c:forEach var="lastAddress" items="${LastAddress}" varStatus="status">						
						<input type="hidden" id="last_address_seq" value="${lastAddress.last_address_seq} ">
						<input type="hidden" id="ad_receiver_name" value="${lastAddress.receiver_name} ">
						<input type="hidden" id="ad_receiver_zipcode" value="${lastAddress.receiver_zipcode }">
						<input type="hidden" id="ad_receiver_address1" value="${lastAddress.receiver_address1 }">
						<input type="hidden" id="ad_receiver_address2" value="${lastAddress.receiver_address2 }">
						<input type="hidden" id="ad_receiver_phone1" value="${lastAddress.receiver_phone1 }">
						<input type="hidden" id="ad_receiver_phone2" value="${lastAddress.receiver_phone2 }">
							<div class="text" >
								<p>${state.count}</p>
								<p class="name" id="ad_receiver_name">${lastAddress.receiver_name }</p>
								<p class="ad" id="ad_receiver_zipcode">${lastAddress.receiver_zipcode } :</p>
									<p class="ad" id="ad_receiver_address1">${lastAddress.receiver_address1 }</p>
									<p class="ad" id="ad_receiver_address2">${lastAddress.receiver_address2 }</p>
								<p class="tell" id="ad_receiver_phone1">${lastAddress.receiver_phone1 } /</p>
									<p class="tell" id="ad_receiver_phone2">${lastAddress.receiver_phone2 }</p>

								<div class="btn-select">
									<a id="delete" href="#" onclick="" class="select btn-apply-past"
										data-addr="">삭제</a>
									<a href="#" class="select btn-apply-past" onclick="setParentText()"
										data-addr="">선택</a>
								</div>
								<br>
								<hr>
							</div>
						</c:forEach>
					</li>
				</ul>
			</form>
		</div>
    </div>
</body>
</html>
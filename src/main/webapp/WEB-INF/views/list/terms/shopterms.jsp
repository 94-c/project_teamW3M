<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<title>쇼핑몰 이용약관</title>
	<style type="text/css">	
		/* rest */
		* { margin: 0; padding: 0; }
		html { overflow:hidden; }
		body { color: #666; font-size: 12px; line-height: 1.5; font-family: "돋움", Dotum, Tahoma, Geneva, sans-serif; }
		h1, h2, h3, h4, h5, h6 { font-weight: normal; }
		img, fieldset { border: 0 none; }
		img { vertical-align: top; max-width: 100%; }
		li { list-style: none; }
		hr, caption, legend { display: none; }
		a { color: #666; text-decoration: none; }
		a:hover { }
		button { cursor: pointer; }
		address, em { font-style: normal; }
		button, input, select, textarea, a { vertical-align: middle; font-family: Dotum; }
		input, select, textarea { font-size: 12px; line-height: 1.5;}
		input:focus { outline: none; }
		table { width: 100%; border-collapse: collapse; border-spacing: 0; table-layout: fixed; word-wrap: break-word; word-break: keep-all; }
		table img { vertical-align: middle; }
		ins { text-decoration: none; }
		a { outline: none; }
		a:active { selector-dummy:expression(this.hideFocus = true); }
		/* common */
		.ir *,
		.blind { z-index:-1; position: absolute; display: block; left: 0; top: 0; overflow: hidden; visibility: hidden; width: 0; height: 0; text-indent: -9999px; }
		.tb-l { text-align: left; padding: 0 10px; }
		.tb-c { text-align: center; }
		.tb-r { text-align: right; }
		.input-text,
		.input-file { height:20px; line-height:22px; border:1px solid #dadada; }
		.input-radio { width:12px; height:12px; padding:0; margin:0; *margin-top:-2px; vertical-align:middle; }
		.w200 { width:200px; }
		.w300 { width:300px; }

		/* layout */
		#hdr { padding:15px 0 13px 20px; border-bottom:1px solid #d5d5d3; }
		#hdr h1 { font-size:20px; color:#000; font-weight:bold; letter-spacing:-1px; }
		#hdr h1 span { font-size:12px; color:#0036ff; font-weight:normal; letter-spacing:0; }

		#content { padding:20px; }
		#content textarea { width:100%; height:360px; padding:0; margin:0; border:0; }

		#ftr { padding:15px 0 13px 20px; border-top:1px solid #d5d5d3; }
		#ftr strong { color:#000; }
		#ftr select,
		#ftr a.btn { vertical-align:middle; }
		#ftr select { height:20px; }
		#ftr a.btn { display:inline-block; padding:0 10px; height:18px; line-height:19px; border:1px solid #1f2632; background:#566277; color:#fff; font-weight:bold; font-size:12px; }

	</style>
    <script type="text/javascript">
        window.resizeTo('550','590');
    </script>
</head>

<body>
	<div id="hdr">
		<h1>
			쇼핑몰 이용약관 <span id="date_end">등록일 : <fmt:formatDate
					value="${tos.tos_date }" pattern="yyyy년MM월dd일" /></span>
		</h1>
	</div>
	<!-- #hd -->
	<div id="content">
		<textarea name="contract" id="contract" cols="" rows=""
			readonly="readonly">${tos.tos_content }</textarea>
	</div>
	<form name="view_contract" method="post" action="join_terms.html">
		<div id="ftr">
			<span id="date_select"></span><a href="javascript:window.close();"
				class="btn">닫기</a>
		</div>
	</form>
</body>
</html>
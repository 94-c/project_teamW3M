<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>공지사항</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<div id="contentWrapper">
	<div id="contentWrap">
		<link type="text/css" rel="stylesheet" href="resources/css/menu.css">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<!-- //게시판 리스트 -->
					<div class="bbs-tit">
						<h3>공지사항</h3>
					</div>
					<div class="bbs-table-view">
						<table summary="게시글 보기">
							<caption>게시글 보기</caption>
							<thead>
								<tr>
									<th><div class="tb-center">
											<font size="3"><font color="#009FAF"><!-- 제목 --></font></font>
										</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="line">
										<div class="cont-sub-des">
											<div>
												<span><em>Date :</em> <!-- 날짜 표기 --></span>
											</div>
											<div>
												<span><em>Name :</em> <!-- 작성자 --></span> 
												<span><em>Hits :</em> <!-- 조회수 --></span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="data-bd-cont">
											<div class="" align="center">
											
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<hr size="1" color="#E5E5E5">
					</div>
				</div>
				<!-- .page-body -->
			</div>
			<!-- #bbsData -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

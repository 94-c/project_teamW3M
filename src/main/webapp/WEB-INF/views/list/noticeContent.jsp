<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.notice.admin.dao.NoticeDAO"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/include/header.jsp"%>

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
									<font size="3"> </font>
								</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="line">
								<div class="cont-sub-des">
									<div>
										<span><em>Date :</em> </span>
									</div>
									<div>
										<span><em>Name :</em> </span> 
										<span><em>Hits :</em> </span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="data-bd-cont">
									
								</div>
							</td>
						</tr>
					</tbody>
				</table>			
			</div>
		</div>
		<!-- .page-body -->
	</div>
	<!-- #bbsData -->
</div>


<%@include file="/WEB-INF/views/include/footer.jsp"%>
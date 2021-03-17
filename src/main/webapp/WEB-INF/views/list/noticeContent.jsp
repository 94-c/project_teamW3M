<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.notice.admin.dao.NoticeDAO"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@page import="com.spring.w3m.login.admin.dao.AdminDAO"%>
<%@page import="com.spring.w3m.login.admin.vo.AdminVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<div id="contentWrapper">
	<div id="contentWrap">

		<link type="text/css" rel="stylesheet" href="resources/css/menu.css?t=201912021906">
		<link type="text/css" rel="stylesheet" href="resources/css/soo.css">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<div class="bbs-tit">
						<h3>공지사항</h3>
					</div>
					<div class="bbs-table-view">
						<table summary="게시글 보기">
							<caption>게시글 보기</caption>
							<thead>
								<tr>
									<th><div class="tb-center">
											<font size="2">
												${notice.nt_title }
											</font>
										</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="line">
										<div class="cont-sub-des">
											<div>
												<span><em>Date :</em><fmt:formatDate value="${notice.nt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											</div>
											<div>
												<span><em>Name :</em> ${notice.nt_writer }</span> 
												<span><em>Hits :</em> ${notice.nt_count }</span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="data-bd-cont">
											${notice.nt_content }
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<hr size="1" color="#E5E5E5">



						<!-- 이전글 다음글 -->
						<div class="bbs-table-list">
							<table summary="게시글 목록">
								<caption>게시글 목록</caption>
								<thead>
								<c:set var="login" value="${adminLogin_state }"/>
								<ul>
								<c:choose>
									<c:when test="${login eq 'adminLogin'}">
											<input type="button" class="CSSbuttonBlack" id="submitbutton" value="글 목록" onclick="location.href='./getNoticeList.do'"/>
											<input type="button" class="CSSbuttonBlack" id="submitbutton" value="수정하기" onclick="location.href='./updateNotice_view.do?nt_seq=${notice.nt_seq}'"/>
											<input type="button" class="CSSbuttonBlack" id="submitbutton" value="삭제하기" onclick="location.href='./deleteNotice.do?nt_seq=${notice.nt_seq}'"/>
									</c:when>
									<c:when test="${login ne 'adminLogin'}">
											<input type="button" class="CSSbuttonBlack" id="submitbutton" value="글 목록" onclick="location.href='./getNoticeList.do'"/>
									</c:when>
								</c:choose>
								</ul>
								</thead>
							</table>
						</div>
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
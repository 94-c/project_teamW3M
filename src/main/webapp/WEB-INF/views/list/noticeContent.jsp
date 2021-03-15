<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.notice.admin.dao.NoticeDAO"%>
<%@page import="com.spring.w3m.notice.admin.vo.NoticeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<div id="contentWrapper">
	<div id="contentWrap">
		<link href="resources/css/notification.css" rel="stylesheet"
			type="text/css">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<div class="bbs-tit">
						<!-- //게시판 리스트 -->
						<div class="bbs-tit">
							<h3>공지사항</h3>
						</div>
						<div class="bbs-table-view">
							<table summary="게시글 보기">
								<caption>게시글 보기</caption>
								<thead>
									<tr>
										<th><div class="tb-center">${notice.nt_title }</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="line">
											<div class="cont-sub-des">
												<div>
													<span><em>Date :</em> <fmt:formatDate value="${notice.nt_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
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
											<div class="data-bd-cont">${notice.nt_content }</div></td>
									</tr>
									<tr>
										<td colspan="6">
											<input type="button" value="글 목록" onclick="location.href='./getNoticeList.do'"/>
										</td>
									</tr>
								</tbody>
							</table>
							<hr size="1" color="#E5E5E5" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
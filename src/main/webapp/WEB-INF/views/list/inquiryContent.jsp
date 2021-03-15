<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.inquiry.user.dao.InquiryDAO"%>
<%@page import="com.spring.w3m.inquiry.user.vo.InquiryVO"%>
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
							<h3>문의게시판</h3>
						</div>
						<div class="bbs-table-view">
							<table summary="게시글 보기">
								<caption>게시글 보기</caption>
								<thead>
									<tr>
										<th><div class="tb-center">${inquiryVO.inq_title }</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="line">
											<div class="cont-sub-des">
												<div>
													<span><em>Date :</em> ${inquiryVO.inq_date }</span>
												</div>
												<div>
													<span><em>Name :</em> ${inquiryVO.inq_writer }</span> <span><em>Hits
															:</em> ${inquiryVO.inq_cnt }</span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="data-bd-cont">${inquiryVO.inq_content }</div></td>
									</tr>
									<tr>
										<td colspan="6">
											<input type="button" value="글 수정" onclick="location.href='./inquiry_update_view.do?inq_seq=${inquiryVO.inq_seq}'"/>
											<input type="button" value="글 삭제" onclick="location.href='./deleteInquiry.do?inq_seq=${inquiryVO.inq_seq}'"/>
											<input type="button" value="글 목록" onclick="location.href='./inquiry.do'"/>
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
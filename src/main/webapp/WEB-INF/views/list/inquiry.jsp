<%@page import="java.util.List"%>
<%@page import="com.spring.w3m.inquiry.user.dao.InquiryDAO"%>
<%@page import="com.spring.w3m.inquiry.user.vo.InquiryVO"%>
<%@page import="com.spring.w3m.common.paging.vo.PageMaker"%>
<%@page import="com.spring.w3m.common.paging.vo.Criteria"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h3>문의게시판</h3>
						<div class="bbs-sch">
							<form action="getInquiryList.do" name="form1">
								<input type="hidden" name="searchCondition" value="">  
								<input type="hidden" name="seachKeyword" value=""> 

								<!-- .검색 폼시작 -->
								<fieldset>
									<legend>게시판 검색 폼</legend>
									<label> 
										<input type="radio" name="searchCondition" value="inq_title" onclick="checkOnlyOne(this)" 
										checked="checked" class="MS_input_checkbox"> 제목
									</label> 
									<label> 
										<input type="radio" name="searchCondition" value="inq_content" onclick="checkOnlyOne(this)" 
										class="MS_input_checkbox"> 내용
									</label> 
									<span class="key-wrap"> 
										<input type="text" name="searchKeyword" value="" class="MS_input_txt"> 
										<a href="javascript:document.form1.submit();"> 
											<img src="//image.makeshop.co.kr/makeshop/d3/basic_simple/bbs/btn_bbs_sch.gif"
											alt="검색" title="검색">
										</a>
									</span>
								</fieldset>
							</form>
							<!-- .검색 폼 끝 -->
						</div>
						<!-- .bbs-sch -->
					</div>

					<!-- 게시판 목록 -->
					<div class="bbs-table-list">
						<form role="form" method="post" action="inquiry_write_view.do">
							<table border="1" summary="No, content,Name,Date,Hits">
								<caption>일반게시판 게시글</caption>
								<colgroup>
									<col width="70">
									<col width="35">
									<col width="*">
									<col width="110">
									<col width="110">
									<col width="75">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><div class="tb-center">NO.</div></th>
										<th scope="col"><div class="tb-center">&nbsp;</div></th>
										<th scope="col"><div class="tb-center">문의</div></th>
										<th scope="col"><div class="tb-center">작성자</div></th>
										<th scope="col"><div class="tb-center">날짜</div></th>
										<th scope="col"><div class="tb-center">조회수</div></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="inquiryVO" items="${inquiryList}">
										<tr>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_seq}</div></td>
											<td scope="col"><div class="tb-center">&nbsp;</div></td>
											<td scope="col"><div class="tb-center">
													<a
														href='<c:url value='/inquiryContent.do?inq_seq=${inquiryVO.inq_seq}'/>'
														class="text-dark">${inquiryVO.inq_title}
												</div></td>
											<td scope="col"><div class="tb-center">
													<c:if
														test="${inquiryVO.inq_writer ne null && inquiryVO.inq_writer!=''}">${fn:substring(inquiryVO.inq_writer,0,fn:length(inquiryVO.inq_writer)-1)}*</c:if>
												</div></td>
											<td scope="col"><div class="tb-center">
													<fmt:formatDate value="${inquiryVO.inq_date}"
														pattern="yyyy-MM-dd" />
												</div></td>
											<td scope="col"><div class="tb-center">${inquiryVO.inq_cnt}</div></td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="6" align="right"><button type="submit"
												class="CSSbuttonBlack" id="submitbutton">글쓰기</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<!-- //게시판 목록 -->
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("SearchCondition");
	  
	  checkboxes.forEach((cb){
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
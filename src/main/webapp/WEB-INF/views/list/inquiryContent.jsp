<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                    ${inquiryVO.inq_title }
                                 </font>
                              </div></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td class="line">
                              <div class="cont-sub-des">
                                 <div>
                                    <span><em>Date :</em><fmt:formatDate value="${inquiryVO.inq_date }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                 </div>
                                 <div>
                                    <span><em>Name :</em> <c:if test="${inquiryVO.inq_writer ne null && inquiryVO.inq_writer!=''}">${fn:substring(inquiryVO.inq_writer,0,fn:length(inquiryVO.inq_writer)-1)}*</c:if>
                                    </span> 
                                    <span><em>Hits :</em> ${inquiryVO.inq_cnt }</span>
                                 </div>
                              </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <div class="data-bd-cont">
                                 ${inquiryVO.inq_content }
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
                            <tr>
                            	<td>비밀번호 : <input type="text"/></td>
                            </tr>
                        </thead>
                     </table>
                  </div>
               </div>
               				<input type="button" id="submitbutton" value="글 수정" class="CSSbuttonBlack" id="submitbutton" onclick="location.href='./inquiry_update_view.do?inq_seq=${inquiryVO.inq_seq}'" />
		  					<input type="button" value="글 삭제" class="CSSbuttonBlack" id="submitbutton" onclick="location.href='./deleteInquiry.do?inq_seq=${inquiryVO.inq_seq}'" />
		 					<input type="button" value="글 목록" class="CSSbuttonBlack" id="submitbutton" onclick="location.href='./inquiry.do'" />
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
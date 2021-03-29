<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>후기 게시판</title>
<link type="text/css" rel="stylesheet" href="resources/css/main.css">
<link type="text/css" rel="stylesheet" href="resources/css/border.css">
<div id="contentWrapper">
   <div id="contentWrap">
      <div id="content">
         <div id="bbsData">
            <div class="page-body">
               <div class="bbs-tit">
                  <h3>후기게시판</h3>
               </div>
               <div class="bbs-table-write">
                      <form name="fileForm" action="review_write.do" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="lock" value="Y">
                     <input type="hidden" name="prod_code" value="${product.prod_code }">
                     <input type="hidden" name="user_id" value="${userVO.user_id }">
                     
                     <fieldset>
                        <legend>일반게시판 쓰기</legend>
                        <table summary="">
                           <caption>게시판 글쓰기</caption>
                           <colgroup>
                              <col width="135">
                              <col width="395">
                              <col width="155">
                              <col width="*">
                           </colgroup>
                           <tbody>
                              <tr>
                                 <th><div>이름</div></th>
                                 <td><div>
                                       <input id="bw_input_writer" type="text" name="user_name" class="MS_input_txt input_style1" value="${userVO.user_name}">
                                    </div></td>
                                 <th><div>비밀번호</div></th>
                                 <td>
                                    <div>
                                       <input id="bw_input_passwd" type="password" name="review_pass" class="MS_input_txt input_style"> 
                                    </div>
                                 </td>
                              </tr>
                                 <tr>
                                 <th><div>제목</div></th>
                                 <td colspan="3"><div>
                                    <input id="bw_input_title" type="text" class="MS_input_txt input_style1" name="review_title">
                                    </div></td>
                              </tr>
                              <tr>
                                 <th><div>내용</div></th>
                                 <td colspan="3" class="text_content">
                                    <div>
                                       <textarea id="MS_text_content" name="review_content" onfocus="clear_content()" class="MS_input_txt" style="font-family: 굴림체;"></textarea>
                                    </div>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </fieldset>
                     <!-- //게시판 글쓰기 -->
                     
                     <!-- 하단 버튼 -->
                     <dl class="bbs-link bbs-link-btm">
                        <dt></dt>
                        <dd>
                           <button type="submit" class="CSSbuttonBlack" id="contentbutton">등록하기</button>
                        </dd>
                     </dl>
                     <!-- //하단 버튼 -->
                  </form>
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
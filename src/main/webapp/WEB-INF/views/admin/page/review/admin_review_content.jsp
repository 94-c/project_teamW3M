<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<link href="resources/css/reply.css" rel="stylesheet" type="text/css">
<main>
<div class="container-fluid">
     <h1 class="mt-4">상품평 관리</h1>              
     <ol class="breadcrumb mb-4"><li class="breadcrumb-item active">상품평 상세보기 </li></ol>
		<div class="card mb-4">
        <div class="card-header"><i class="fas fa-table mr-1"></i>${reviewVO.review_title }</div>
        <div class="card-body">
        <div class="table-responsive">                    
			<table>
				<thead>
					<tr>
						<th><div class="tb-center"><font size="2"></font></div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="line">
							<div class="cont-sub-des">
								<div align="right">
									<span><em>Date :</em> <fmt:formatDate value="${reviewVO.review_date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
								</div>
								<div align="right">
									<span><em>Name :</em><c:if test="${reviewVO.review_writer ne null && reviewVO.review_writer!=''}">${fn:substring(reviewVO.review_writer,0,fn:length(reviewVO.review_writer)-1)}*</c:if></span>
								</div>
								<div align="right">
									<span><em>Hits :</em> ${reviewVO.review_cnt }</span>
								</div>
							</div>
						</td>
					</tr>
						<td>
							<div class="data-bd-cont">
								<div align="left">
								<p style="font-size: 15px; Line-height: 200%; align: left; color: #5f5f5f;">${reviewVO.review_content }</p>
								</div>
							</div>
						</td>
				</tbody>
				</table>

				<!-- 댓글 -->
							<br>
							<div id="reply">
							<form name="updateform" action="updateReply.mdo?inq_seq=${inquiryVO.inq_seq}" method="post">
							<h5>댓글</h5>
							<table id="re_table">							
									<c:forEach items="${replyList}" var="replyList" varStatus="status">
											<input type="hidden" id="re_seq" name="re_seq" value="${replyList.re_seq}" />
											<fmt:formatDate value="${replyList.re_date}" pattern="yyyy-MM-dd HH:mm" /><br>									
											<pre>${replyList.re_content}</pre>
											<div><a href="deleteReply.mdo?re_seq=${replyList.re_seq}&inq_seq=${inquiryVO.inq_seq}">삭제</a>
											<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="#">수정</a><div style="DISPLAY: none">											
											<input type="hidden" id="re_seq" name="re_seq" value="${replyList.re_seq}" />
											<input type="hidden" id="inq_seq" name="inq_seq" value="${inquiryVO.inq_seq}" />
											<textarea id="reply_text" name="re_content_up" style="font-family: 굴림체;">${replyList.re_content}</textarea>											
											<input type="button" value="수정" class="CSSbuttonBlack" id="replybutton" onclick="update()"/>														
											</div>							
											</div>	
									</c:forEach>
						  </table>
						  </form>
							</div>			 							 
				  <div>
				   <form name="insertform" action="insertReply.mdo" method="post">
				    <input type="hidden" id="inq_seq" name="inq_seq" value="${inquiryVO.inq_seq}" />
				    <input type="hidden" id="re_writer" name="re_writer" value="관리자" />
				    <br/>
				    <textarea id="reply_text" name="reply_txt" placeholder="댓글을 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='댓글을 입력하세요'" style="font-family: 굴림체;"></textarea><br>		  	
				 	<input type="button" value="등록" class="CSSbuttonBlack" id="replybutton" onclick="insert()"/>
				  </form>
				  </div>							
						<button type="button" class="btn btn-info " onclick="location.href = 'deleteInquiry.mdo?inq_seq=${inquiryVO.inq_seq}' ">삭제하기</button>
						<button type="button" class="btn btn-info " onclick="location.href = 'inquiry.do' ">목록으로</button>
					</div>
				</div>
			</div>		
	</div>
</main>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
<script type="text/javascript">
function insert()
{
	var insertform = document.insertform;

	insertform.submit();

	}
	
function update()
{
	var updateReply = document.updateform;
	
	updateReply.submit();

	}
</script>
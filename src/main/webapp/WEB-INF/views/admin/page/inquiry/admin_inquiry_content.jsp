<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<link href="resources/css/reply.css" rel="stylesheet" type="text/css">
<main>
<div class="container-fluid">
     <h1 class="mt-4">문의사항 상세보기</h1>              
     <ol class="breadcrumb mb-4"><li class="breadcrumb-item active">상세보기</li></ol>
		<div class="card mb-4">
        <div class="card-header"><i class="fas fa-table mr-1"></i>${inquiryVO.inq_title }</div>
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
						<td class="line"><div class="cont-sub-des">
						<div><span><em>Date :</em> <fmt:formatDate value="${inquiryVO.inq_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span></div>
						<div><span><em>Name :</em> ${inquiryVO.inq_writer }</span><span><em>Hits :</em> ${inquiryVO.inq_cnt }</span></div></div></td>
						</tr>
					<tr>
						<td><pre><div class="data-bd-cont">${inquiryVO.inq_content }</div></pre></td>
					</tr> 
				</tbody>
				</table>

				<!-- 댓글 -->
							<br>
							<div id="reply">
							<form name="updateform" action="updateReply.mdo" method="post">
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
											<textarea id="reply_text" name="re_content" style="font-family: 굴림체;">${replyList.re_content}</textarea>											
											<input type="button" value="수정" class="CSSbuttonBlack" id="replybutton" onclick="update(${replyList.re_seq})"/>											</div>							
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
	var txt = insertform.reply_text.value;
	
	if(!txt){
		alert("내용을 입력하세요")
	} else{
	insertform.submit();
		}
	}
	
function update(re_seq)
{
	var updateReply = document.updateform;
	
	updateReply.submit();

	}
</script>
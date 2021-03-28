<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<link href="resources/css/reply.css" rel="stylesheet" type="text/css">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">관리자 페이지</h1>
                         <form name="insertform" action="insertReply.mdo" method="post">                       
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">문의사항</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                	${inquiryVO.inq_title }
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th><div class="tb-center">
									<font size="2">  </font>
								</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="line">
								<div class="cont-sub-des">
									<div>
										<span><em>Date :</em> <fmt:formatDate
												value="${inquiryVO.inq_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
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
								<pre><div class="data-bd-cont">${inquiryVO.inq_content }</div></pre>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 댓글 -->
							<br>
							<div id="reply">
							<h5>댓글</h5>
							<table id="re_table">
									<c:forEach items="${replyList}" var="replyList">
											<input type="hidden" id="re_seq" name="re_seq" value="${replyList.re_seq}" />
											<fmt:formatDate value="${replyList.re_date}" pattern="yyyy-MM-dd HH:mm" /><br>									
											<pre>${replyList.re_content}</pre>
											<div><a href="deleteReply.mdo?re_seq=${replyList.re_seq}&inq_seq=${inquiryVO.inq_seq}">삭제</a>
											<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">수정</a><div style="DISPLAY: none">											
											<%@include file="/WEB-INF/views/admin/page/reply/replyUpdate.jsp"%>
											</div></div>	
									</c:forEach>
						  </table>
							</div>			 				
				  <div>
				    <input type="hidden" id="re_writer" name="re_writer" value="관리자" />
				    <br/>
				    <textarea id="reply_text" name="reply_text" placeholder="댓글을 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='댓글을 입력하세요'" style="font-family: 굴림체;"></textarea><br>		  	
				 	<input type="button" value="등록" class="CSSbuttonBlack" id="replybutton" onclick="insert()"/>
				  </div>
				  
				
				<input type="hidden" id="inq_seq" name="inq_seq" value="${inquiryVO.inq_seq}" />
<!-- 			<button type="submit" class="btn btn-info " onclick="location.href = 'admin_notice_update_view.mdo?nt_seq=${notice.nt_seq}' ">답글달기</button>  -->

				<button type="button" class="btn btn-info " onclick="location.href = 'deleteInquiry.mdo?inq_seq=${inquiryVO.inq_seq}' ">삭제하기</button>
				<button type="button" class="btn btn-info " onclick="location.href = 'inquiry.do' ">목록으로</button>
			</div>
		</div>
		</div>
		</form>
		
</main>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
<<script type="text/javascript">
function insert()
{
	var insertform = document.insertform;

	insertform.submit();

	}

function update()
{
	var updateform = document.updateform;

	updateform.submit();

	}
</script>
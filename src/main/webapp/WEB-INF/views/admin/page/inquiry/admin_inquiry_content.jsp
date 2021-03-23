<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">관리자 페이지</h1>
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
<!-- 			<button type="submit" class="btn btn-info " onclick="location.href = 'admin_notice_update_view.mdo?nt_seq=${notice.nt_seq}' ">답글달기</button>  -->

				<button type="submit" class="btn btn-info " onclick="location.href = 'deleteInquiry.mdo?inq_seq=${inquiryVO.inq_seq}' ">삭제하기</button>
				<button type="submit" class="btn btn-info " onclick="location.href = 'inquiry.do' ">목록으로</button>
			</div>
		</ol>
		</div>
</main>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
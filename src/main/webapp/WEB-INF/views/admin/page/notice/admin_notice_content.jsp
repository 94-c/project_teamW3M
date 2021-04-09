<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항</title>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">공지사항</h1>
		<ol class="breadcrumb mb-4">
			<div class="bbs-table-view">
				<table>
					<thead>
						<tr>
							<th><div class="tb-center">
									<strong><font size=2><font
											color="${notice.nt_color}">${notice.nt_title }</font></font></strong>
								</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="line">
								<div class="cont-sub-des">
									<div>
										<span><em>Date :</em> <fmt:formatDate
												value="${notice.nt_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
									</div>
									<div>
										<span><em>Name :</em> ${notice.nt_writer }</span> <span><em>Hits
												:</em> ${notice.nt_count }</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<pre><div class="data-bd-cont">${notice.nt_content }</div></pre>
							</td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-info "
					onclick="location.href = 'admin_notice_update_view.mdo?nt_seq=${notice.nt_seq}' ">수정하기</button>
				<button type="submit" class="btn btn-info "
					onclick="location.href = 'admin_notice_delete.mdo?nt_seq=${notice.nt_seq}' ">삭제하기</button>
				<button type="submit" class="btn btn-info "
					onclick="location.href = 'admin_notice_list.mdo' ">목록으로</button>
			</div>
		</ol>
	</div>
</main>
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
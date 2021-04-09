<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<title>공지사항</title>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">이용약관</h1>
		<ol class="breadcrumb mb-4">
			<div class="bbs-table-view">
				<table>
					<thead>
						<tr>
							<th><div class="tb-center">
									<strong>이용약관</font></font></strong>
								</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
						</tr>
						<tr>
							<td>
								<pre><div class="data-bd-cont">${tos.tos_content }</div></pre>
							</td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-info "
					onclick="location.href = 'tos_update_view.mdo?tos_writer=${tos.tos_writer}' ">수정하기</button>
			</div>
		</ol>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
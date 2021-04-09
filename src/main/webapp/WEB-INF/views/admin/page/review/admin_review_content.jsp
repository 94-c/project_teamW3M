<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<link href="resources/css/reply.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function insert() {
		var insertform = document.insertform;
		insertform.submit();
	}
	function update() {
		var updateReply = document.updateform;
		updateReply.submit();
	}
</script>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">상품평 관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">상품평 상세보기</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header" align="center">${reviewVO.review_title }</div>
			<div class="card-body">
				<div class="table-responsive">
					<tr>
						<thead>
							<tr>
								<th><div class="tb-center">
										<font size="2"></font>
									</div></th>
							</tr>
						</thead>
					</tr>
					<tbody>
						<tr>
							<td class="line">
								<div class="cont-sub-des">
									<div align="right">
										<span><em>Date :</em> <fmt:formatDate
												value="${reviewVO.review_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /></span>
									</div>
									<div align="right">
										<span><em>Name :</em>
										<c:if
												test="${reviewVO.review_writer ne null && reviewVO.review_writer!=''}">${fn:substring(reviewVO.review_writer,0,fn:length(reviewVO.review_writer)-1)}*</c:if></span>
									</div>
									<div align="right">
										<span><em>Hits :</em> ${reviewVO.review_cnt }</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="data-bd-cont">
									<div align="left">
										<p
											style="font-size: 20px; Line-height: 200%; align: left; color: #5f5f5f;">${reviewVO.review_content }</p>
										<br>
										<c:if test="${reviewVO.review_image eq '파일없음'}"></c:if>
										<c:if test="${reviewVO.review_image ne '파일없음'}">
											<img src="${reviewVO.review_image }" />
										</c:if>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
					<br> <br>
					<div align="right">
						<tr>
							<td>
								<button type="button" class="btn btn-info "
									onclick="location.href = '/reviewContent.do?review_seq=${reviewVO.review_seq}' ">원본으로
									넘어가기</button>
							</td>
						</tr>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

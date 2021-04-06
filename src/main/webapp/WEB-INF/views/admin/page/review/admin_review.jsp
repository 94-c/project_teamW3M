<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<c:url var = "getReviewList" value = "adminReview.mdo">
	<c:param name = "page" value = "${pagination.page }"/>
	<c:param name = "range" value = "${pagination.range }"/>
	<c:param name = "rangeSize" value = "${pagination.rangeSize}"/>
	<c:param name = "searchKeyword" value = "${pagination.searchKeyword}"/>
</c:url>
 <script type="text/javascript">
        	//이전 버튼 이벤트
        	function fn_prev(page, range, rangSize, searchKeyword){
        		var page = ((range - 2) * rangeSize) + 1;
        		var range = range - 1;
        		var url = "${pagContext.request.contextPath}/adminReview.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        
        	//페이지 번호 클릭
        	function fn_pagination(page, range, rangSize, searchKeyword){
        		var url = "${pagContext.request.contextPath}/adminReview.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	//다음 버튼 이벤트
        	function fn_next(page, range, rangSize, searchKeyword){
        		var page = parseInt((range  * rangeSize)) + 1;
        		var range = parseInt(range) + 1;
        		var url = "${pagContext.request.contextPath}/adminReview.mdo";
        		url = url + "?page=" + page;
        		url = url + "&range=" + range;
        		url = url + "&searchKeyword" + searchKeyword;
        		location.href = url;
        	}
        	
        	$(document).on('click', '#btnSearch', function(e){
        		e.preventDefault();
        		var url = "${pageContext.request.contextPath}/adminReview.mdo";
        		url = url + "?searchType=" + $('#searchType').val();
        		url = url + "&keyword=" + $('#keyword').val();
        		location.href = url;
        		console.log(url);
        	});
        </script>
        
    <head>
       <link rel="shortcut icon" href="resources/images/icons/favicon.ico" type="image/x-icon">
        <title>관리자 페이지</title>
        <link href="resources/admin_css/styles.css" rel="stylesheet" type="text/css">
    </head>
    
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">상품평 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">코로나 탈출!!!</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                	상품평 관리
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      <colgroup>
	                                    <col width="70">
	                                    <col width="85">
	                                    <col width="*">
	                                    <col width="110">
	                                    <col width="110">
	                                    <col width="75">
                               		 </colgroup>
                                    <thead>
									<tr>
                                        <th scope="col"><div class="tb-center">NO.</div></th>
                                        <th scope="col"><div class="tb-center">제품</div></th>
                                        <th scope="col"><div class="tb-center">후기</div></th>
                                        <th scope="col"><div class="tb-center">작성자</div></th>
                                        <th scope="col"><div class="tb-center">날짜</div></th>
                                        <th scope="col"><div class="tb-center">조회수</div></th>
                                    </tr>
								</thead>	
                                   
                                        <tbody>
									<c:forEach var="reviewVO" items="${reviewList}">
										<tr>
                                        <td><div class="tb-center">${reviewVO.review_seq}</div></td>
                                       	<td><div class="tb-left"><a href="getProduct?prod_code=${reviewVO.prod_code}"><img src="${reviewVO.prod_title_image}" width="60" height="60" align="middle"></a></div></td> 
                                        <c:if test="${reviewVO.reply_cnt > 0}">
                                        <td><div class="tb-left"><a href='<c:url value='/adminReviewContent.mdo?review_seq=${reviewVO.review_seq}'/>'class="text-dark">[${reviewVO.prod_title}]${reviewVO.review_title}</a><a href="javascript:void(window.open('review_reply.do?review_seq=${reviewVO.review_seq}', '_blank','width=430px, height=340px, status=no, menubar=no, toolbar=no, resizable=no'))">[${reviewVO.reply_cnt}]</a></div>
                                        </td>
                                        </c:if>
                                        <c:if test="${reviewVO.reply_cnt <=0}">
                                        <td><div class="tb-left"><a href='<c:url value='/adminReviewContent.mdo?review_seq=${reviewVO.review_seq}'/>'class="text-dark">[${reviewVO.prod_title}]${reviewVO.review_title}</a></div>
                                        </td>
                                        </c:if>
                                        <td>
                                          <div class="tb-center"> <c:if test="${reviewVO.review_writer ne null && reviewVO.review_writer!=''}">${fn:substring(reviewVO.review_writer,0,fn:length(reviewVO.review_writer)-1)}*</c:if></div>
	                            		</td>
	                                        <td><div class="tb-center"><fmt:formatDate value="${reviewVO.review_date}" pattern="yyyy-MM-dd" /></div></td>
	                                        <td scope="col"><div class="tb-center">${reviewVO.review_cnt}</div></td>
                                    </tr>
									</c:forEach>
								</tbody>
                                    </table>
                                    <!-- pagination -->
								<div id="paginationBox" >
									<ul class="pagination">
										<c:if test="${pagination.prev}">
											<li class="page-item">
											<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
										</c:if>

										<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
											<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
											<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx} </a></li>
										</c:forEach>

										<c:if test="${pagination.next}">
											<li class="page-item"><a class="page-link" href="#"	onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
										</c:if>
										</ul>
									</div>
									<!-- search{s} -->

										<div class="searchText">
											<div class="w100" style="padding-right: 10px">
												<select class="form-control form-control-sm" name="searchType" id="searchType">
													<option value="review_title">제목</option>
													<option value="review_content">내용</option>
												</select>

											</div>
											<div class="w300" style="padding-right: 10px">
												<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
											</div>

											<div>
												<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
											</div>

										</div>
								<!-- search{e} -->
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>

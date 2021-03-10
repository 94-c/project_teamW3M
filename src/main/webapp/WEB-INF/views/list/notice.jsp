<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div id="contentWrapper">
	<div id="contentWrap">
		<link href="resources/css/notification.css" rel="stylesheet" type="text/css">
		<div id="content">
			<div id="bbsData">
				<div class="page-body">
					<!-- 게시판 리스트 -->
					<div class="bbs-hd">
						<ul class="link">
							<li class="last"><a href="board.html?code=pgreen1364_board1">공지사항</a>
							</li>
							<li><a href="board.html?code=pgreen1364">문의게시판</a></li>
							<li><a href="board.html?code=pgreen1364_board2">상품후기</a></li>
							<li><a href="board.html?code=pgreen1364_board3">이벤트</a></li>
							<li><a href="board.html?code=pgreen1364_board4">웰콤의 드림랜드</a>
							</li>
							<li><a href="board.html?code=pgreen1364_image1">웰키의 다이어리</a>
							</li>
							<li><a href="board.html?code=pgreen1364_image2">미디어룸</a></li>
						</ul>
					</div>
					<!-- //게시판 리스트 -->
					<div class="bbs-tit">
						<h3>공지사항</h3>
						<div class="bbs-sch">
							<form action="board.html" name="form1">
								<input type="hidden" name="s_id" value=""> 
								<input type="hidden" name="code" value="pgreen1364_board1"> 
								<input type="hidden" name="page" value="1"> 
								<input type="hidden" name="type" value="s"> 
								<input type="hidden" name="board_cate" value=""> 
								<input	type="hidden" name="review_type" value="">
								<!-- .검색 폼시작 -->
								<fieldset>
									<legend>게시판 검색 폼</legend>
									<label> <input type="radio" name="ssubject" value="ok"
										onclick="change(2);" checked="checked"
										class="MS_input_checkbox"> 제목
									</label> <label> <input type="radio" name="scontent" value="ok"
										onclick="change(3);" class="MS_input_checkbox"> 내용
									</label> <span class="key-wrap"> <input type="text" name="stext"
										value="" class="MS_input_txt"> <a
										href="javascript:document.form1.submit();"><img
											src="//image.makeshop.co.kr/makeshop/d3/basic_simple/bbs/btn_bbs_sch.gif"
											alt="검색" title="검색"></a>
									</span>
								</fieldset>
							</form>
							<!-- .검색 폼 끝 -->
						</div>
						<!-- .bbs-sch -->
					</div>

					<!-- 게시판 목록 -->
					<div class="bbs-table-list">
						<table summary="No, content,Name,Data,Hits">
							<caption>일반게시판 게시글</caption>
							<colgroup>
								<col width="70">
								<col width="35">
								<col width="*">
								<col width="110">
								<col width="110">
								<col width="75">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><div class="tb-center">NO.</div></th>
									<th scope="col"><div class="tb-center">&nbsp;</div></th>
									<th scope="col"><div class="tb-center">공지</div></th>
									<th scope="col"><div class="tb-center">작성자</div></th>
									<th scope="col"><div class="tb-center">날짜</div></th>
									<th scope="col"><div class="tb-center">HITS</div></th>
								</tr>
							</thead>
							<tbody>
								<!-- .공지사항 리스트 시작 -->
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999891&amp;num2=00000&amp;number=57&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#0000ff">[공지] 웰킵스 마스크 25개입 가격 인하 공지</font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2021.02.19</div></td>
									<td><div class="tb-center">1477</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999893&amp;num2=00000&amp;number=56&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF08A0">[공지] 웰킵스몰 회원정책</font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2021.01.25</div></td>
									<td><div class="tb-center">921</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999896&amp;num2=00000&amp;number=55&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF08A0"><b>[공지] 웰킵스몰 웰컴혜택</b></font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.11.27</div></td>
									<td><div class="tb-center">51789</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999898&amp;num2=00000&amp;number=54&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF600F"><b>[공지] 웰킵스 1:1 카카오상담톡 오픈!</b></font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.10.28</div></td>
									<td><div class="tb-center">3729</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999900&amp;num2=00000&amp;number=53&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF08A0">[공지] 웰킵스몰 필독 공지 - 반품 및 교환관련</font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.10.15</div></td>
									<td><div class="tb-center">2811</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999918&amp;num2=00000&amp;number=52&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF08A0"><b>[공지] 웰킵스몰 필독 공지 - 오류 및 아이디 관련</b></font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.06.11</div></td>
									<td><div class="tb-center">23109</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999928&amp;num2=00000&amp;number=51&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3"><font
													color="#FF08A0"><b>[공지] 웰킵스몰 필독 공지 - 배송 및 취소관련</b></font></font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.05.11</div></td>
									<td><div class="tb-center">126367</div></td>
								</tr>
								<tr>
									<td><div class="tb-center">
											<img src="/images/d3/modern_simple/common/icon_box_arrow.gif">
										</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_notice.gif">
										</div></td>
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"> <a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999992&amp;num2=00000&amp;number=50&amp;lock=N&amp;flag=notice"
												class="tb-bold"><font size="3">결제가 안될 경우, 결제프로그램을
													수동설치 바랍니다. </font></a>

										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2014.05.15</div></td>
									<td><div class="tb-center">44724</div></td>
								</tr>
								<!--. 공지사항 리스트 끝! -->

								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">67</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999892&amp;num2=00000&amp;number=67&amp;lock=N"><font
												size="2"><font color="#000000">[공지] 설연휴 배송공지 </font></font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2021.02.01</div></td>
									<td><div class="tb-center">921</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">66</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999894&amp;num2=00000&amp;number=66&amp;lock=N">웰킵스몰
												네이버페이결제 OPEN</a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2021.01.19</div></td>
									<td><div class="tb-center">573</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">65</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999895&amp;num2=00000&amp;number=65&amp;lock=N">2021
												신축년, 새해 복 많이 받으세요!</a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2021.01.05</div></td>
									<td><div class="tb-center">840</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">64</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999897&amp;num2=00000&amp;number=64&amp;lock=N"><font
												size="2"><font color="#000000">2021 퍼스트브랜드 대상
														웰킵스를 투표해주세요!</font></font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.11.11</div></td>
									<td><div class="tb-center">12698</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">63</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999899&amp;num2=00000&amp;number=63&amp;lock=N"><font
												color="#000000">[필독공지] 가상계좌 입금기한 변경안내</font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.10.23</div></td>
									<td><div class="tb-center">1467</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">62</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999901&amp;num2=00000&amp;number=62&amp;lock=N"><font
												size="2"><font color="#000000">[공지] 한글날 배송공지</font></font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.10.07</div></td>
									<td><div class="tb-center">1540</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">61</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_jpg.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999902&amp;num2=00000&amp;number=61&amp;lock=N"><font
												size="2"><font color="#000000">[공지] 추석연휴 배송공지</font></font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.09.24</div></td>
									<td><div class="tb-center">6146</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">60</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999903&amp;num2=00000&amp;number=60&amp;lock=N"><font
												color="#000000">[공지] 퓨렐 손소독제 상품가 인하 공지</font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.09.23</div></td>
									<td><div class="tb-center">4395</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">59</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999904&amp;num2=00000&amp;number=59&amp;lock=N">[공지]
												택배사 변경 공지</a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.09.23</div></td>
									<td><div class="tb-center">5637</div></td>
								</tr>
								<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
								<tr>
									<td><div class="tb-center">58</div></td>
									<td><div class="tb-left">
											<img src="/board/images/neo_default.gif">
										</div></td>
									<!-- .product image 관련 -->
									<td>
										<div class="tb-left">
											<img src="/board/images/neo_head.gif"
												style="padding-left: 00px;">

											<!--. 스팸글 처리 -->
											<a
												href="/board/board.html?code=pgreen1364_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999905&amp;num2=00000&amp;number=58&amp;lock=N"><font
												color="#000000">코로나19 확산으로 인한 배송 지연 공지</font></a>
										</div>
									</td>
									<td>
										<div class="tb-center">
											<img src="/board/images/neo_adminimg.gif">
										</div>
									</td>
									<td><div class="tb-center">2020.08.18</div></td>
									<td><div class="tb-center">15342</div></td>
								</tr>
								<!--. 게시글 리스트 끝 -->
							</tbody>
						</table>
					</div>
					<!-- //게시판 목록 -->
</div></div></div>
</div></div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
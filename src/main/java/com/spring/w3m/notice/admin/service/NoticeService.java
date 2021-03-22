package com.spring.w3m.notice.admin.service;

import java.util.List;

import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface NoticeService {

	NoticeVO getUserNotice(NoticeVO vo);

	List<NoticeVO> getUserNoticeList(NoticeVO vo);

	
	List<NoticeVO> getNoticeList(NoticeVO vo);

	// 공지사항 페이징, 검색
	int getNoticeListCnt(Search search);
	
	int getNoticeSearchCnt(String searchKeyword);

	List<NoticeVO> getNoticePageList(Search search);


	List<NoticeVO> getNoticeSearchPagingList(Pagination pagination);

	// 공지사항 등록
	void admin_notice_insert(NoticeVO vo);

	// 공지사항 업데이트
	void admin_notice_update(NoticeVO vo);

	// 공지사항 삭제
	void admin_notice_delete(NoticeVO vo);

	// 공지사항 상세보기
	NoticeVO getNotice(NoticeVO vo);
	
}

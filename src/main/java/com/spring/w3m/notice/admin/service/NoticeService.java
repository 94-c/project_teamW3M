package com.spring.w3m.notice.admin.service;

import java.util.List;

import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

public interface NoticeService {

	NoticeVO getNotice(NoticeVO vo);

	List<NoticeVO> getNoticeList(NoticeVO vo);

	int getNoticeListCnt(Search search);

	int getNoticeSearchCnt(String searchKeyword);

	List<NoticeVO> getNoticePageList(Search search);

	List<NoticeVO> getNoticeSearchPagingList(Pagination pagination);

}

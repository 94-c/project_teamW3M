package com.spring.w3m.notice.admin.service;

import java.util.List;

import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;

public interface NoticeService {
	
	 void insertNotice(NoticeVO vo);
	 
	 void updateNotice(NoticeVO vo);
	 
	 void deleteNotice(NoticeVO vo);
	 
	 NoticeVO getNotice(NoticeVO vo);
	 
	 List<NoticeVO> getNoticeList(NoticeVO vo);
	 
	 int getNoticeListCnt();
	 List<NoticeVO> getPageList(Pagination pagination);
}

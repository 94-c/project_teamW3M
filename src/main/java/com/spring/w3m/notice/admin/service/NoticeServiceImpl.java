package com.spring.w3m.notice.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.notice.admin.dao.NoticeDAO;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return dao.getNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}

	@Override
	public List<NoticeVO> getNoticePageList(Search search) {
		return dao.getNoticePageList(search);
	}

	@Override
	public List<NoticeVO> getNoticeSearchPagingList(Pagination pagination) {
		return dao.getNoticeSearchPagingList(pagination);
	}

	@Override
	public int getNoticeListCnt(Search search) {
		return dao.getNoticeListCnt(search);
	}

	@Override
	public int getNoticeSearchCnt(String searchKeyword) {
		return dao.getNoticeSearchCnt(searchKeyword);
	}

}

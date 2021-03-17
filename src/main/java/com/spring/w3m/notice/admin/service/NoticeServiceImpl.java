package com.spring.w3m.notice.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.notice.admin.dao.NoticeDAO;
import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public void insertNotice(NoticeVO vo) {
		dao.insertNotice(vo);
		
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		dao.updateNotice(vo);
		
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		dao.deleteNotice(vo);
		
	}

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return dao.getNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}

	@Override
	public int getNoticeListCnt() {
		return dao.getNoticeListCnt();
	}

	@Override
	public List<NoticeVO> getPageList(Pagination pagination) {
		return dao.getPageList(pagination);
	}

}

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
	public NoticeVO getUserNotice(NoticeVO vo) {
		return dao.getUserNotice(vo);
	}

	@Override
	public List<NoticeVO> getUserNoticeList(NoticeVO vo) {
		return dao.getUserNoticeList(vo);
	}

	@Override
	public List<NoticeVO> getUserNoticeSearchPagingList(Pagination pagination) {
		System.out.println("service List : " + pagination.getSearchType());
		System.out.println("service List : " + pagination.getKeyword());
		return dao.getUserNoticeSearchPagingList(pagination);
	}

	@Override
	public List<NoticeVO> getNoticePageList(Search search) {
		return dao.getNoticePageList(search);
	}

	@Override
	public List<NoticeVO> getNoticeSearchPagingList(Pagination pagination) {
		System.out.println("service List : " + pagination.getSearchType());
		System.out.println("service List : " + pagination.getKeyword());
		return dao.getNoticeSearchPagingList(pagination);
	}

	@Override
	public int getNoticeListCnt(Search search) {
		System.out.println("service cnt : " + search.getKeyword());
		return dao.getNoticeListCnt(search);
	}

	@Override
	public int getNoticeSearchCnt(String keyword) {
		return dao.getNoticeSearchCnt(keyword);
	}

	// 공지사항 게시글 불러오기
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}

	// 공지사항 업데이트
	@Override
	public void admin_notice_update(NoticeVO vo) {
		dao.admin_notice_update(vo);
	}

	// 공지사항 삭제
	@Override
	public void admin_notice_delete(NoticeVO vo) {
		dao.admin_notice_delete(vo);
	}

	// 공지사항 상세보기
	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return dao.getNotice(vo);
	}

	// 공지사항 등록
	@Override
	public void admin_notice_insert(NoticeVO vo) {
		dao.admin_notice_insert(vo);

	}

}

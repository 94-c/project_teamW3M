package com.spring.w3m.notice.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.w3m.notice.admin.vo.NoticeVO;
import com.spring.w3m.paging.common.Pagination;
import com.spring.w3m.paging.common.Search;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public NoticeVO getNotice(NoticeVO vo) {
		sqlSessionTemplate.update("NoticeCntUpdate", vo);
		return sqlSessionTemplate.selectOne("NoticeDAO.getNotice", vo);
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", vo);
	}

	public int getNoticeSearchCnt(String searchKeyword) {
		System.out.println("getNoticeSearchCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getNoticeSearchCnt");
	}

	public int getNoticeListCnt(Search search) {
		System.out.println("getNoticeListCnt() 실행");
		return sqlSessionTemplate.selectOne("AdminDAO.getNoticeListCnt");
	}

	public List<NoticeVO> getNoticePageList(Search search) {
		System.out.println("getNoticePageList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getNoticePageList", search);
	}

	public List<NoticeVO> getNoticeSearchPagingList(Pagination pagination) {
		System.out.println("getNoticeSearchPagingList() 실행");
		return sqlSessionTemplate.selectList("AdminDAO.getNoticeSearchPagingList");
	}

}

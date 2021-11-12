package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Notice;
import com.khbill.util.Paging;

public interface NoticeDao {
	
	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param paramData
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 페이징을 적용하여 게시글 목록 조회한다
	 * 
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 
	 */
	public List<Notice> selectNoticeList(Paging paging);

	/**
	 * 공지사항 조회수를 +1
	 * 
	 * @param notice - 공지사항
	 */
	public void updateHit(Notice notice);

	/**
	 * DB에서 공지사항 번호로 공지사항을 조회한다
	 * 
	 * @param notice - 공지사항 번호를 가지고 있는 공지사항 객체
	 * @return 조회된 공지사항 객체
	 */
	public Notice selectNoticeByNoticeNo(Notice notice);
	
	

}

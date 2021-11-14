package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Notice;
import com.khbill.util.Paging;

public interface AdminNoticeDao {

	/**
	 * totalCount 구하기
	 * 
	 * @return int
	 */
	public int selectCntAll();

	/**
	 * 공지사항 목록 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Notice> selectNoticeList(Paging paging);

}

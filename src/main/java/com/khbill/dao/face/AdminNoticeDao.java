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

	/**
	 * 공지사항 상세 조회
	 * 
	 * @param noticeNo - 공지사항 번호
	 * @return Notice
	 */
	public Notice selectNoticeDetail(int noticeNo);

	/**
	 * 관리자 번호로 관리자 닉네임 조회
	 * 
	 * @param adminNo - 관리자 번호
	 * @return String adminNick
	 */
	public String selectAdminNickByAdminNo(int adminNo);

	/**
	 * 공지사항 입력하기
	 * 
	 * @param notice - 공지사항 정보
	 */
	public void insertNotice(Notice notice);

	/**
	 * 공지사항 수정하기
	 * 
	 * @param notice - 공지사항 정보
	 */
	public void updateNotice(Notice notice);

	/**
	 * 공지사항 삭제하기
	 * 
	 * @param noticeNo- 공지사항 번호
	 */
	public void deleteNotice(int noticeNo);

}

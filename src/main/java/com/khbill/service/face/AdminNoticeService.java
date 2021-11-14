package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Notice;
import com.khbill.util.Paging;

public interface AdminNoticeService {

	/**
	 * 페이징 정보 얻기
	 * 
	 * @param paramData 
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 공지사항 목록 조회
	 * 
	 * @param paging - 페이징
	 * @return List<Notice>
	 */
	public List<Notice> getNoticeList(Paging paging);

	/**
	 * 공지사항 상세 조회
	 * 
	 * @param noticeNo - 공지사항 번호
	 * @return Notice
	 */
	public Notice getNoticeDetail(int noticeNo);

	/**
	 * 관리자 번호로 관리자 닉네임 조회
	 * 
	 * @param adminNo - 관리자 번호
	 * @return String adminNick
	 */
	public String getAdminNick(int adminNo);

	/**
	 * 공지사항 작성
	 * 
	 * @param notice - 공지사항 내용
	 */
	public void setNoticeWrite(Notice notice);

	/**
	 * 공지사항 수정
	 * 
	 * @param notice - 공지사항 내용
	 */
	public void setNoticeUpdate(Notice notice);

	/**
	 * 공지사항 삭제
	 * 
	 * @param noticeNo - 공지사항 번호
	 */
	public void setNoticeDelete(int noticeNo);

}

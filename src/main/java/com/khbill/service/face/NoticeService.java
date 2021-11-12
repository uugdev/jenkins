package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Notice;
import com.khbill.util.Paging;

public interface NoticeService {
	
	/**
	 * 공지사항 목록을 위한 페이징 객체를 생성한다
	 * 
	 * @param paramData - curPage를 저장하고 있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 페이징이 적용된 게시글 목록을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Notice> getNoticeList(Paging paging);

	/**
	 * 공지사항 상세보기
	 * 
	 * @param notice - 상세 조회할 공지사항 번호를 가진 DTO
	 * @return 조회된 공지사항 정보
	 */
	public Notice getNoticeDetail(Notice notice);

}

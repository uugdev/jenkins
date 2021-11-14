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

}

package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Trade;
import com.khbill.util.Paging;

public interface AdminTradeDao {
	
	/**
	 * 페이징을 기준으로 정렬된 거래 게시판 리스트 조회
	 * 
	 * @param paging - 계산된 페이징
	 * @return 페이징을 기준으로 정렬된 거래 게시판 리스트
	 */
	public List<Trade> selectTradeList(Paging paging);
	
	/**
	 * trade 테이블의 총 게시글 수를 조회한다
	 * 
	 * @param paramData - curPage
	 * @return trade 테이블의 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);
	
}

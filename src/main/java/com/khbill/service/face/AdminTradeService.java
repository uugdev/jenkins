package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Trade;
import com.khbill.util.Paging;

public interface AdminTradeService {
	
	/**
	 * tradeNo에 해당하는 거래 게시글 상세조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 HashMap
	 */
	public HashMap<String, String> getTradeDetail(int tradeNo);
	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Trade> getTradeList(Paging paging);
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);
	

}

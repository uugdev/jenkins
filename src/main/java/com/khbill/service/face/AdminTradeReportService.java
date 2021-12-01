package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.TradeReport;
import com.khbill.util.Paging;

public interface AdminTradeReportService {
	
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
	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<TradeReport> getTradeReportList(Paging paging);
	
	/**
	 * 신고처리여부 'y'로 변경하기
	 * 
	 * @param reviewReport - report_status를 저장하고 있는 객체
	 * @return 조회된 처리여부 'y' (완료)
	 */
	public boolean TradeStatusToY(TradeReport tradeReport);

	/**
	 *  신고처리여부 'n'으로 변경하기
	 * 
	 * @param reviewReport- report_status를 저장하고 있는 객체
	 * @return 조회된 처리여부 'n' (미완료)
	 */
	public boolean TradeStatusToN(TradeReport tradeReport);
	
	/**
	 * 허위 신고된 허위 신고번호로 삭제한다
	 * 
	 * @param reportNo
	 */
	public void setTradeReportDelete(int reportNo);

	/**
	 * tradeNo에 해당하는 거래 게시글 상세조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 HashMap
	 */
	public HashMap<String, Object> getTradeDetail(int tradeNo);

	/**
	 * 댓글 목록을 조회한다
	 * 
	 * @param tradeComment - 댓글을 조회할 게시글 정보
	 * @return 조회된 댓글 목록
	 */
	public List<HashMap<String, Object>> getTradeCommentDetail(int tradeNo);
}

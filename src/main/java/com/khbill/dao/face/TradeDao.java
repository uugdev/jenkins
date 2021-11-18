package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.util.Paging;

public interface TradeDao {
	
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
	
	/**
	 * tradeNo로 거래 게시글 상세조회
	 * 
	 * @param tradeNo - 게시글 번호
	 * @return 상세 페이지에 필요한 정보
	 */
	public HashMap<String, String> selectTradeByTradeNo(int tradeNo);
	
	/**
	 * 
	 * 
	 * @param tradeNo
	 * @return
	 */
	public List<HashMap<String, String>> selectTradeCommentByTradeNo(int tradeNo);
	
	/**
	 * 
	 * 
	 * @param tradeFile
	 * @return
	 */
	public int insertFile(File tradeFile);
	
	/**
	 * 
	 * 
	 * @return
	 */
	public int selectFileNo();
	
	/**
	 * 
	 * 
	 * @param trade
	 */
	public void insertTrade(Trade trade);
	
	/**
	 * 
	 * 
	 * @param tradeNo
	 */
	public void updateHit(int tradeNo);
	
	/**
	 * 
	 * 
	 * @param tradeComment
	 */
	public void insertTradeComment(TradeComment tradeComment);
	
	/**
	 * 
	 * 
	 * @param tradeComNo
	 */
	public void deleteTradeCommentByTradeComNo(int tradeComNo);
	
	/**
	 * 
	 * 
	 * @param tradeComNo
	 * @return
	 */
	public int selectCountTradeComment(int tradeComNo);
	
	/**
	 * 
	 * 
	 * @param tradeComment
	 */
	public void updateTradeComment(TradeComment tradeComment);
	
	/**
	 * 
	 * 
	 * @param tradeComNo
	 * @return
	 */
	public TradeComment selectOneTradeCommentByTradeNo(int tradeComNo);
	
	/**
	 * 
	 * 
	 * @param userNo
	 * @return
	 */
	public TradeComment selectTradeCommentByUserNo(int userNo);
	
	/**
	 * 
	 * 
	 * @param userNo
	 * @return
	 */
	public String selectUserNickByUserNo(int userNo);
	
	/**
	 * 거래 게시글 번호로 거래 게시글 댓글 모두 삭제
	 * 
	 * @param tradeNo - 삭제할 댓글의 게시글 번호
	 */
	public void deleteTradeCommentByTradeNo(int tradeNo);
	
	/**
	 * 거래 게시글 번호로 거래 게시글 신고 모두 삭제
	 * 
	 * @param tradeNo - 삭제할 신고의 게시글 번호
	 */
	public void deleteTradeReportByTradeNo(int tradeNo);
	
	/**
	 * 거래 게시글 번호로 거래 게시글 스크랩 모두 삭제
	 * 
	 * @param tradeNo - 삭제할 스크랩의 게시글 번호
	 */
	public void deleteTradeScrapByTradeNo(int tradeNo);
	
	/**
	 * 저장파일명으로 거래 게시글과 연결되어 있는 파일 삭제
	 * 
	 * @param string - 삭제할 저장파일명
	 */
	public void deleteTradeFileByFileStored(String string);
	
	/**
	 * 거래 게시글 번호로 거래 게시글 삭제
	 * 
	 * @param tradeNo - 삭제할 거래 게시글 번호
	 */
	public void deleteTradeByTradeNo(int tradeNo);
	



}

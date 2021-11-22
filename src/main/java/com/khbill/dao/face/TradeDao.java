package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.dto.TradeReport;
import com.khbill.dto.TradeScrap;
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
	 * 추가할 파일을 fileNo을 nextVal해서 조회
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
	 * 저장 파일 이름으로 거래 게시글과 연결되어 있는 파일 삭제
	 * 
	 * @param fileStored - 삭제할 저장파일명
	 */
	public void deleteTradeFileByFileStored(String fileStored);
	
	/**
	 * 거래 게시글 번호로 거래 게시글 삭제
	 * 
	 * @param tradeNo - 삭제할 거래 게시글 번호
	 */
	public void deleteTradeByTradeNo(int tradeNo);
	
	/**
	 * 저장된 파일 이름로 거래 게시글 count
	 * 
	 * @param fileStored - 조회할 저장된 파일 이름
	 * @return 있을 경우 1, 없을 경우 0
	 */
	public int selectTradeFileCountByFileStored(File file);
	
	/**
	 * 저장 파일 이름으로 FILE_STORED를 NULL로 변경
	 * 
	 * @param fileStored - 변경될 저장 파일 이름
	 */
	public void updateTradeFileNullByFileNo(int fileNo);
	
	/**
	 * fileStored에 해당하는 fileNo을 조회
	 * 
	 * @param fileStored - 저장된 파일
	 * @return
	 */
	public int selectFileNoByFileStored(String fileStored);
	
	/**
	 * 전달받은 거래 게시글 정보로 게시글 업데이트
	 * 
	 * @param trade - 변경될 게시글 정보
	 */
	public void updateTradeByTrade(Trade trade);
	
	/**
	 * 신고한 게시물인지 체크
	 * 
	 * @param tradeReport - 전달받은 신고정보
	 * @return 신고한 게시글 - 1, 안한 게시글 - 0 반환
	 */
	public int selectCntTradeReportCheck(TradeReport tradeReport);
	
	/**
	 * 전달받은 신고정보를 입력
	 * 
	 * @param tradeReport - 전달받은 신고정보
	 */
	public void insertTradeReport(TradeReport tradeReport);
	
	/**
	 * 거래 게시글 번호로 카운트 조회
	 * 
	 * @param tradeScrap - 전달받은 스크랩 정보
	 * @return 전달받은 스크랩 정보 존재 여부 1, 0
	 */
	public int selectCountScrap(TradeScrap tradeScrap);
	
	/**
	 * 전달받은 스크랩 정보로 삭제
	 * 
	 * @param tradeScrap - 전달받은 삭제할 스크랩 정보
	 */
	public void deleteTradeScrap(TradeScrap tradeScrap);
	
	/**
	 * 전달받은 스크랩 정보로 입력
	 * 
	 * @param tradeScrap - 전달받은 입력할 스크랩 정보
	 */
	public void insertTradeScrap(TradeScrap tradeScrap);
	
	/**
	 * 페이징을 적용하여 거래 게시글 조회순 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Trade> selectTradeHitList(Paging paging);
	
	/**
	 * userNo로 gradeUrl 조회
	 * 
	 * @param userNo - 댓글 입력한 userNo
	 * @return gradeUrl
	 */
	public String selectGradeUrlByUserNo(int userNo);



}

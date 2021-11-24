package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.File;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.dto.TradeReport;
import com.khbill.dto.TradeScrap;
import com.khbill.util.Paging;

public interface TradeService {
	
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
	public List<Trade> getTradeList(Paging paging);
	
	/**
	 * tradeNo에 해당하는 거래 게시글 상세조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 HashMap
	 */
	public HashMap<String, String> getTradeDetail(int tradeNo);
	
	/**
	 * tradeNo에 해당하는 거래 게시글 댓글 리스트 조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 댓글 리스트
	 */
	public List<HashMap<String, String>> getTradeCommentDetail(int tradeNo);
	
	/**
	 * 입력받은 데이터로 거래 게시글 작성
	 * 
	 * @param session - 유저 넘버가 저장되어 있는 세션
	 * @param file - 전송된 file
	 * @param trade - 전송받은 title, content
	 */
	public void setTradeWrite(HttpSession session, MultipartFile file, Trade trade);
	
	/**
	 * 입력받은 데이터로 거래 게시글 댓글 작성
	 * 
	 * @param tradeComment - 전송받은 댓글 정보
	 */
	public void setTradeCommentWrite(TradeComment tradeComment);
	
	/**
	 * 입력받은 거래 댓글 번호로 거래 게시글 댓글 삭제
	 * 
	 * @param tradeComNo - 전송받은 댓글 번호
	 * @return
	 */
	public boolean setTradeCommentDelete(int tradeComNo);
	
	/**
	 * 입력받은 거래 댓글 정보로 거래 게시글 댓글 수정
	 * 
	 * @param tradeComment - 전송받은 댓글 정보
	 * @return
	 */
	public TradeComment setTradeCommentUpdate(TradeComment tradeComment);
	
	/**
	 * 유저 번호에 해당하는 유저의 가장 최신 댓글 조회
	 * 
	 * @param userNo - 유저 번호
	 * @return 유저 번호에 해당하는 유저의 가장 최신 댓글
	 */
	public TradeComment getTradeCommentWriteByUserNo(int userNo);
	
	/**
	 * 유저 번호에 해당하는 유저 닉네임 조회
	 * 
	 * @param userNo - 유저 번호
	 * @return 유저 번호에 해댕하는 유저 닉네임
	 */
	public String getUserNickByUserNo(int userNo);
	
	/**
	 * 게시글 번호에 해당하는 게시글, 댓글, 신고, 스크랩, 파일 삭제
	 * 
	 * @param tradeNo - 삭제할 게시글 번호
	 */
	public void setTradeDelete(int tradeNo);
	
	/**
	 * 게시글 수정 중 기존에 있던 파일을 삭제하고 삭제여부를 true, false로 반환
	 * 
	 * @param fileStored - 삭제할 파일 이름
	 * @return 파일 삭제여부를 true, false로 반환
	 */
	public boolean setTradeUpdateDeleteFile(File file);
	
	/**
	 * 입력받은 데이터로 거래 게시글 수정
	 * 
	 * @param file - 전송받은 파일
	 * @param trade - 전송받은 게시글 정보
	 */
	public void setTradeUpdate(MultipartFile file, Trade trade);
	
	/**
	 * trade 게시글 번호와 로그인 userNo로 신고한 게시물인지 판단한다
	 * 
	 * @param tradeReport - 전송받은 신고정보
	 * @return 판단한 결과
	 */
	public boolean tradeReportByTradeNoLoginUserNo(TradeReport tradeReport);
	
	/**
	 * 신고 게시글 삽입하기
	 * 
	 * @param tradeReport - 전송받은 신고정보
	 */
	public void setTradeReport(TradeReport tradeReport);
	
	/**
	 * 게시글 번호로 게시글을 스크랩
	 * 
	 * @param tradeScrap - 스크랩할 게시글 정보
	 * @return 스크랩 확인 여부 true, false
	 */
	public boolean setScrap(TradeScrap tradeScrap);
	
	/**
	 * 사용자 스크랩 상태
	 * 
	 * @param tradeScrap - 스크랩 상태를 확인할 정보
	 * @return 스크랩 상태 true, false
	 */
	public boolean isScrap(TradeScrap tradeScrap);
	
	/**
	 * 페이징이 적용된 거래 게시글 조회순으로 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Trade> getTradeHitList(Paging paging);
	
	/**
	 * userNo으로 gradeUrl 조회
	 * 
	 * @param userNo - 댓글 입력한 userNo
	 * @return gradeUrl
	 */
	public String getGradeUrlByUserNo(int userNo);
	
}

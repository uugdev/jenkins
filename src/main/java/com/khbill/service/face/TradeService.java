package com.khbill.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
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
	 * @return tradeNo에 해당하는 거래 게시글 Object
	 */
	public Object getTradeDetail(int tradeNo);
	
	/**
	 * tradeNo에 해당하는 거래 게시글 댓글 리스트 조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 댓글 리스트
	 */
	public List<Object> getTradeCommentDetail(int tradeNo);
	
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

}

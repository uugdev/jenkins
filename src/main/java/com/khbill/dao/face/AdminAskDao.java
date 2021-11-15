package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.util.Paging;

public interface AdminAskDao {

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public int selectCntAll(Paging paramData);

	
	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public List<Ask> selectAskList(Paging paging);

	
	/**
	 * ask게시글번호로 삭제할 게시글 조회
	 * 
	 * @param askNo
	 */
	public void deleteAsk(int askNo);
	
	/**
	 * ask게시글번호로 삭제할 투표객체 조회
	 * 
	 * @param askNo
	 */
	public void deleteVote(int askNo);
	
	/**
	 * ask게시글번호로 삭제할 파일 조회
	 * 
	 * @param askNo
	 */
	public void deleteFile(int fileNo);
	
	
	/**
	 * ask게시글번호로 삭제할 아이템 조회
	 * 
	 * @param askNo
	 */
	public void deleteItem(int itemNo);
	
	/**
	 * askComNo로 댓글 삭제
	 * 
	 * @param askComNo
	 */
	public void deleteAskCom(int askComNo);


	/**
	 * askComNo로 일치하는 댓글 조회
	 * 
	 * @param askComNo
	 * @return
	 */
	public int selectCntCom(int askComNo);


	/**
	 * 게시글번호로 댓글 삭제
	 * 
	 * @param askNo
	 */
	public void deleteAskComByAskNo(int askNo);
	
	
	
	/**
	 * 질문글번호로 조회
	 * 
	 * @param askNo
	 */
	public Ask selectAskByAskNo(int askNo);
	
	
	
	/**
	 * askNo로 댓글 조회
	 * 
	 * @param askNo
	 * @return
	 */
	public List<AskComment> selectAskComByAskNo(int askNo);
	
	
	/**
	 * 
	 * 스크랩삭제
	 * 
	 * @param askNo
	 */
	public void deleteScrap(int askNo);


	/**
	 * 신고글삭제
	 * 
	 * @param askNo
	 */
	public void deleteReport(int askNo);
	
	
	
	
	
}

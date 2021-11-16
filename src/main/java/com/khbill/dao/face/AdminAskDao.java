package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
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

	/**
	 * 
	 * 유저 리스트 조회
	 * @return
	 */
	public List<User> selectUserList();

	/**
	 * 유저번호로 유저정보를 조회한다
	 * 
	 * @param userNo
	 * @return 조회된 유저객체
	 */
	public User selectUserInfo(int userNo);

	/**
	 * 질문글번호로 조회
	 * 
	 * @param askNo
	 */
	public Ask selectAskByAskNo(int askNo);

	/**
	 * 파일번호로 파일조회
	 * 
	 * @param fileNo
	 * @return
	 */
	public File selectFileByFileNo(int fileNo);

	/**
	 * 상품번호로 상품조회
	 * 
	 * @param productNo
	 * @return
	 */
	public Item selectItemByProductNo(int productNo);

	/**
	 * 게시글번호,유저번호가담긴 보트객체로 투표객체조회
	 * 
	 * @param Vote
	 * @return
	 */
	public Vote selectVoteByAskNoUserNo(Vote voteSet);

	/**
	 * y,n에 투표한 사람의 수 조회
	 * 
	 * @param vote
	 * @return
	 */
	public int selectVoteByAskNoVoteState(Vote vote);
	
	
	
}

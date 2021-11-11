package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.util.Paging;

public interface AskDao {

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Ask> selectAskList(Paging paging);


	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);


	/**
	 * 유저번호로 유저정보를 조회한다
	 * 
	 * @param userNo
	 * @return 조회된 유저객체
	 */
	public User selectUserInfo(int userNo);


	/**
	 * 
	 * 유저 리스트 조회
	 * @return
	 */
	public List<User> selectUserList();

	/**
	 * 다음 파일번호 조회
	 * 
	 * @return
	 */
	public int getNextFileNo();


	/**
	 * 다음 상품번호 조회
	 * 
	 * @return
	 */
	public int getNextItemNo();


	/**
	 * 다음 질문글번호 조회
	 * 
	 * @return
	 */
	public int getNextAskNo();


	/**
	 * 첨부파일 삽입
	 * 
	 * @param askFile
	 */
	public void insertFile(File askFile);


	/**
	 * 상품 삽입
	 * 
	 * @param item
	 */
	public void insertItem(Item item);


	/**
	 * 질문글 삽입
	 * 
	 * @param ask
	 */
	public void insertAsk(Ask ask);


	/**
	 * 투표 삽입
	 * 
	 * @param vote
	 * @param voteEnd
	 */
	public void insertVote1(Vote vote);
	public void insertVote2(Vote vote);
	public void insertVote3(Vote vote);
	

	
	
	
	
	
	
}

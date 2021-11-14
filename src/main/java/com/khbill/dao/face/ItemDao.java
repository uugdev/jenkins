package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Item;

public interface ItemDao {

	/**
	 * item번호로 ask번호를 가져온다
	 * 
	 * @param - itemNo를 담고 있는 item 객체
	 * @return askNo
	 */
	public int selectAskNoByItemNo(Item item);
	
	/**
	 * 지금 투표가 진행중인지 판단
	 * 
	 * @param askNo - 질문 번호
	 * @return 진행중이면 1, 이미 끝난상태면 0 반환
	 */
	public int selectCntVoteInProgress(int askNo);

	public void updateVoteEndToSysdate(int askNo);

	public void updateItemStatusToY(int askNo);

	public int selectItemNoByAskNo(int itemNo);

	
	
	public List<HashMap<String, Object>> selectItemListByUserNo(HashMap<String, Object> map);
	
	/**
	 * 유저 번호로 질문글 갯수 가져오기
	 * 
	 * @param userNo - 조회할 유저 번호
	 * @return 총 게시글 수
	 */
	public int selectItemCntAll(int userNo);

	
}

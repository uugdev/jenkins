package com.khbill.dao.face;

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

	
}

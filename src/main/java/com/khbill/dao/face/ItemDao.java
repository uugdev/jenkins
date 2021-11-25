package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;

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
	
	/**
	 * 진행중인 투표의 종료날짜를 현재 날짜로 만든다(투표 종료)
	 * 
	 * @param askNo
	 */
	public void updateVoteEndToSysdate(int askNo);

	/**
	 * 아이템의 결제 상태를 y로 바꾼다 -> 결제 체크
	 * 
	 * @param askNo
	 */
	public void updateItemStatus(Item item);

	/**
	 * 질문글 번호로 아이템 번호를 받아온다
	 * 
	 * @param itemNo
	 * @return 아이템 번호
	 */
	public int selectItemNoByAskNo(int askNo);
	
	/**
	 * 유저번호로 조회한 아이템 리스트를 가져온다
	 * 
	 * @param map
	 * @return 아이템 리스트
	 */
	public List<HashMap<String, Object>> selectItemListByUserNo(HashMap<String, Object> map);
	
	/**
	 * 유저 번호로 질문글 갯수 가져오기
	 * 
	 * @param userNo - 조회할 유저 번호
	 * @return 총 게시글 수
	 */
	public int selectItemCntAll(int userNo);

	/**
	 * 정답을 맞춘 사람의 번호를 가져온다
	 * 
	 * @param vote
	 * @return
	 */
	public List<User> selectCorrectUser(Vote vote);

	/**
	 * 정답을 맞춘 회원들에게 점수를 부여
	 * 
	 * @param u
	 */
	public void updateUserPoint(User u);

	/**
	 * 아이템의 상태를 n으로 만든다.
	 * 
	 * @param askNo
	 */
	public void updateItemStatusToN(int askNo);
	
	/**
	 * 점수를 받았던 user들 list받아오기
	 * 
	 * @param askNo
	 * @return list
	 */
	public List<User> selectUserList(int askNo);

	/**
	 * 정답 맞춘 회원들에게 줬던 점수를 다시 차감
	 * 
	 * @param u
	 */
	public void updateUserPointToBefore(User u);

	/**
	 * 아이템의 상태를 y로 바꾼다
	 * 
	 * @param itemNo
	 */
	public void updateItemStatusToY(int itemNo);

	/**
	 * 아이템의 상태를 다시 n으로 만들고 아이템 date도 null로 변경한다
	 * 
	 * @param askNo
	 */
	public void updateItemStatusCancel(int askNo);
	
	

	
}

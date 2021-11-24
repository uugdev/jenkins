package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Message;

public interface MessageDao {

	/**
	 * DB에 쪽지를 저장한다
	 *  
	 * @param msg 쪽지 객체
	 */
	public void insertMessage(Message msg);

	/**
	 * 받은 쪽지 리스트를 반환한다
	 * 
	 * @param map - 수신자 회원 번호
	 * @return 받은 쪽지의 list
	 */
	public List<HashMap<String, Object>> selectRcvdMsgList(HashMap<String, Object> map);	
	
	/**
	 * 보낸 쪽지 리스트를 반환한다
	 * 
	 * @param map - 발신자 회원 번호
	 * @return 보낸 쪽지의 list
	 */
	public List<HashMap<String, Object>> selectSendMsgList(HashMap<String, Object> map);	

	/**
	 * 쪽지의 상태를 y로 변경한다
	 * 
	 * @param msg - 쪽지 객체
	 */
	public void updateMsgCheckToY(Message msg);

	/**
	 * 쪽지 번호를 이용하여 쪽지를 조회한다
	 * 
	 * @param msg - 조회하려는 쪽지 객체
	 * @return 조회된 쪽지 정보
	 */
	public Message selectMsgByMsgNo(int msgNo);

	/**
	 * 세션에서 받아온 userNo와 receiverNo가 일치하면, 받은 쪽지함에서 안보이게 한다
	 * 
	 * @param msg - 상태를 변경하려는 쪽지 객체
	 */
	public void updateReceiverShowToN(Message msg);
	
	/**
	 * 세션에서 받아온 userNo와 senderNo가 일치하면, 보낸 쪽지함에서 안보이게 한다
	 * 
	 * @param msg - 상태를 변경하려는 쪽지 객체
	 */
	public void updateSenderShowToN(Message msg);

	/**
	 * 회원번호로 검색한 수신한 전체 쪽지 수 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return totalCount
	 */
	public int selectRcvdCntAll(int userNo);

	/**
	 * 회원번호로 검색한 발송한 전체 쪽지 수 조회
	 * 
	 * @param userNo - 회원 번호
	 * @return totalCount
	 */
	public int selectSendCntAll(int userNo);

	/**
	 * msg로 세부 쪽지내용 조회하기
	 * 
	 * @param msg
	 * @return msg객체
	 */
	public Message selectMsgByMsgNo(Message msg);

	/**
	 * 수신한 쪽지 중에 아직 읽지 않은 쪽지만 리스트로 조회한다
	 * 
	 * @param map
	 * @return mgs_check 가 'n'인 쪽지만 조회한다
	 */
	public List<HashMap<String, Object>> selectRcvdMsgByState(HashMap<String, Object> map);

	/**
	 * 수신한 쪽지 중에 아직 읽지 않은 쪽지의 개수를 조회한다
	 * 
	 * @param userNo - 세션에 저장된 유저 번호
	 * @return 유저번호로 조회한 쪽지 개수
	 */
	public int selectUnreadMsgCntAll(int userNo);

	
	


}

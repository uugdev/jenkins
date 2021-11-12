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
	 * @param userNo - 수신자 회원 번호
	 * @return 받은 쪽지의 list
	 */
	public List<HashMap<String, Object>> selectRcvdMsgList(int userNo);
	
	/**
	 * 보낸 쪽지 리스트를 반환한다
	 * 
	 * @param userNo - 발신자 회원 번호
	 * @return 보낸 쪽지의 list
	 */
	public List<HashMap<String, Object>> selectSendMsgList(int userNo);

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
	public Message selectMsgByMsgNo(Message msg);

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


}

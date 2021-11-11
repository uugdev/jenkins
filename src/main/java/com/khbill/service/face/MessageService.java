package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Message;

public interface MessageService {

	/**
	 * 쪽지를 보낸다
	 * 
	 * @param msg
	 */
	public void setMessageWrite(Message msg);

	/**
	 * 받은 쪽지 리스트를 가져온다
	 * 
	 * @param userNo - 세션에 저장된 유저번호
	 * @return 받은 쪽지 리스트
	 */
	public List<HashMap<String, Object>> getRcvdMsgList(int userNo);
	
	/**
	 * 보낸 쪽지 리스트를 가져온다
	 * 
	 * @param userNo - 세션에 저장된 유저번호
	 * @return 보낸 쪽지 리스트
	 */
	public List<HashMap<String, Object>> getSendMsgList(int userNo);

	/**
	 * 쪽지를 받은 사람 정보를 받아온다
	 * 
	 * @param msg - 회원 번호를 담고 있는 쪽지 객체
	 * @return 쪽지 받은 사람의 회원 번호
	 */
	public int getReceiverNo(Message msg);

	/**
	 * 쪽지를 보낸 사람 정보를 받아온다
	 * 
	 * @param msg - 회원 번호를 담고 있는 쪽지 객체
	 * @return 쪽지 보낸 사람의 회원 번호
	 */
	public int getSenderNo(Message msg);

	/**
	 * 메시지 상세보기 페이지
	 * 
	 * @param msg - 메세지 번호를 담고 있는 메세지 객체
	 * @return 메세지 객체
	 */
	public Message getMsgDetail(Message msg, int userNo, int receiverNo);

	/**
	 * 메세지 삭제
	 * 
	 * @param msg - 삭제하려는 메세지 객체
	 * @param senderNo - 수신자 번호
	 * @param receiverNo - 송신자 번호
	 * @param userNo - 세션에 있는 유저 번호
	 */
	public void setMsgDelete(Message msg, int userNo, int receiverNo, int senderNo);


}

package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Message;
import com.khbill.util.Paging;

public interface MessageService {

	/**
	 * 쪽지를 보낸다
	 * 
	 * @param msg
	 */
	public void setMessageWrite(Message msg);
	
	/**
	 * 쪽지 목록을 위한 페이징 객체를 생성한다
	 * 
	 * @param paramData - curPage를 저장하고 있는 객체
	 * @param userNo - 세션에 저장된 유저 번호
	 * @return 페이징 객체
	 */
	public Paging getPaging(Paging paramData, int userNo, String where);

	/**
	 * 받은 쪽지 리스트를 가져온다
	 * 
	 * @param map - 세션에 저장된 유저번호
	 * @return 받은 쪽지 리스트
	 */
	public List<HashMap<String, Object>> getRcvdMsgList(HashMap<String, Object> map);
	
	/**
	 * 보낸 쪽지 리스트를 가져온다
	 * 
	 * @param map - 세션에 저장된 유저번호
	 * @return 보낸 쪽지 리스트
	 */
	public List<HashMap<String, Object>> getSendMsgList(HashMap<String, Object> map);

	/**
	 * 메시지 상세보기 페이지
	 * 
	 * @param msg - 메세지 번호를 담고 있는 메세지 객체
	 * @return 메세지 객체
	 */
	public Message getMsgDetail(Message msg, int userNo);

	/**
	 * 메세지 삭제
	 * 
	 * @param msg - 삭제하려는 메세지 객체
	 * @param userNo - 세션에 있는 유저 번호
	 */
	public void setMsgDelete(Message msg, int userNo);

	/**
	 * 파라미터로 전달받은 msgNo로 msg객체를 찾아온다
	 * 
	 * @param msg - 파라미터로 전달받은 msgNo를 가진 msg객체
	 * @return db에서 조회한 메세지 객체
	 */
	public Message getMsgByMsgNo(Message msg);




}

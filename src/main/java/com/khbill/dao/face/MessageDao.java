package com.khbill.dao.face;

import com.khbill.dto.Message;

public interface MessageDao {

	/**
	 * DB에 쪽지를 저장한다
	 *  
	 * @param msg 쪽지 객체
	 */
	public void insertMessage(Message msg);

}

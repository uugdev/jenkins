package com.khbill.service.face;

import com.khbill.dto.Message;

public interface MessageService {

	/**
	 * 쪽지를 보낸다
	 * 
	 * @param msg
	 * @return
	 */
	public void setMessageWrite(Message msg);

}

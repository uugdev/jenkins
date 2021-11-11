package com.khbill.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.MessageDao;
import com.khbill.dto.Message;
import com.khbill.service.face.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired MessageDao messageDao;

	@Override
	public void setMessageWrite(Message msg) {
		
		if("".equals(msg.getMsgTitle())) {
			msg.setMsgTitle("제목 없음");
		}
		
		messageDao.insertMessage(msg);
		
	}
}

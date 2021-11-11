package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

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
	
	@Override
	public List<HashMap<String, Object>> getRcvdMsgList(int userNo) {
		return messageDao.selectRcvdMsgList(userNo);
	}
	
	@Override
	public List<HashMap<String, Object>> getSendMsgList(int userNo) {
		return messageDao.selectSendMsgList(userNo);
	}
	
	@Override
	public int getReceiverNo(Message msg) {
		return messageDao.selectReceiverNoByMsgNo(msg);
	}
	
	@Override
	public int getSenderNo(Message msg) {
		return messageDao.selectSenderNoByMsgNo(msg);
	}
	
	@Override
	public Message getMsgDetail(Message msg, int userNo, int receiverNo) {

		if(userNo == receiverNo) { //세션에 저장된 유저번호와 메시지의 receiver_no가 일치할 때 msg_check 를 y로 변경한다
			messageDao.updateMsgCheckToY(msg);
			return messageDao.selectMsgByMsgNo(msg);
		}
		
		return messageDao.selectMsgByMsgNo(msg);
	}
}

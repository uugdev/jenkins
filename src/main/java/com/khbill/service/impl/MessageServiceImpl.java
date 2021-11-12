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
	public Message getMsgDetail(Message msg, int userNo) {

		if(userNo == msg.getReceiverNo()) { //세션에 저장된 유저번호와 메시지의 receiver_no가 일치할 때 msg_check 를 y로 변경한다
			messageDao.updateMsgCheckToY(msg);
			return messageDao.selectMsgByMsgNo(msg);
		}
		
		return messageDao.selectMsgByMsgNo(msg);
	}

	@Override
	public void setMsgDelete(Message msg, int userNo) {
		
		if(userNo == msg.getReceiverNo()) { 
			//세션에 저장된 유저 번호가 쪽지의 receiver_no와 같을 때 => 받은 쪽지함에서 삭제
			//받은 쪽지함에서 안보이도록 상태 변경
			messageDao.updateReceiverShowToN(msg);
		} 
		
		//세션에 저장된 유저 번호가 쪽지의 sender_no와 같을 때 => 받은 쪽지함에서 삭제
		//보낸 쪽지함에서 안보이도록 상태 변경
		messageDao.updateSenderShowToN(msg);
	}
	
	@Override
	public Message getMsgByMsgNo(Message msg) {
		return messageDao.selectMsgByMsgNo(msg);
	}
}

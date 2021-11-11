package com.khbill.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.Message;
import com.khbill.service.face.MessageService;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	
	@RequestMapping(value="/message/write", method=RequestMethod.GET)
	public void writeMessage() {
		logger.info("/message/write [GET]");
		
	}
	
	@RequestMapping(value="/message/write", method=RequestMethod.POST)
	public String writeMessageProc(Message msg, HttpSession session) {
		logger.info("/message/write [POST]");
		
		logger.info("쪽지 정보 : {}", msg);

		msg.setSenderNo((int)session.getAttribute("userNo"));
		msg.setReceiverNo(6); //Detail페이지에서 userNo받아와서 수정할것
		logger.info("발신자, 수신자 정보 저장한 쪽지 정보 : {}", msg);
	
//		messageService.setMessageWrite(msg);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/message/receive")
	public void msgReceiveList(HttpSession session, Model model) {
		logger.info("/message/receive [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		
		List<HashMap<String, Object>> resultMapList = messageService.getRcvdMsgList(userNo);
	
		logger.info("resultMapList 정보 : {}", resultMapList);
		
		model.addAttribute("resultMapList", resultMapList);
		
	}
	
	@RequestMapping(value="/message/send")
	public void msgSendList(HttpSession session, Model model) {
		logger.info("/message/send [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		
		List<HashMap<String, Object>> resultMapList = messageService.getSendMsgList(userNo);
	
//		logger.info("resultMapList 정보 : {}", resultMapList);
		
		model.addAttribute("resultMapList", resultMapList);
		
	}
	
	@RequestMapping(value="/message/detail")
	public String msgDetail(Message msg, Model model, HttpSession session) {
		logger.info("/message/detail [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		int receiverNo = messageService.getReceiverNo(msg);
		int senderNo = messageService.getSenderNo(msg);
		
		logger.info("쪽지 receiver 정보 : {}", receiverNo);
		logger.info("쪽지 sender 정보 : {}", senderNo);
		
		if(userNo != receiverNo && userNo != senderNo) {
			return "message/error";
		}
		
		msg = messageService.getMsgDetail(msg, userNo, receiverNo);
		
		model.addAttribute("msg", msg);
						
		return "message/detail";
		
		
		
		
	}
	
	

}

package com.khbill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String writeMessageProc(Message msg) {
		logger.info("/message/write [POST]");
		
		logger.info("{}", msg);
		
		msg.setSenderNo(1);
		msg.setReceiverNo(2);
		logger.info("{}", msg);
		
		messageService.setMessageWrite(msg);
		
		return null;
	}
	

}

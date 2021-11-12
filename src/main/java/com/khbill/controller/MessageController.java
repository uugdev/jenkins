package com.khbill.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbill.dto.Message;
import com.khbill.service.face.MemberService;
import com.khbill.service.face.MessageService;
import com.khbill.util.Paging;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/message/write", method=RequestMethod.GET)
	public void writeMessage() {
		logger.info("/message/write [GET]");
		
	}
	
	@RequestMapping(value="/message/write", method=RequestMethod.POST)
	public String writeMessageProc(Message msg, HttpSession session, @RequestParam("userNick") String userNick) {
		logger.info("/message/write [POST]");
		
		logger.info("쪽지 정보 : {}", msg);
		
		int ReceiverNo = memberService.getUserNo(userNick);

		msg.setSenderNo((int)session.getAttribute("userNo"));
		msg.setReceiverNo(ReceiverNo);
		logger.info("발신자, 수신자 정보 저장한 쪽지 정보 : {}", msg);
	
		messageService.setMessageWrite(msg);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/message/receive/list")
	public void msgReceiveList(Paging paramData, HttpSession session, Model model) {
		logger.info("/message/receive/list [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		String where = "receive";
		
		Paging paging = messageService.getPaging(paramData, userNo, where);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<HashMap<String, Object>> resultMapList = messageService.getRcvdMsgList(map);
	
//		logger.info("resultMapList 정보 : {}", resultMapList);
		
		model.addAttribute("resultMapList", resultMapList);
		model.addAttribute("paging", paging);		
	}
	
	@RequestMapping(value="/message/send/list")
	public void msgSendList(Paging paramData, HttpSession session, Model model) {
		logger.info("/message/send/list [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		String where = "send";
		
		Paging paging = messageService.getPaging(paramData, userNo, where);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<HashMap<String, Object>> resultMapList = messageService.getSendMsgList(map);
	
//		logger.info("resultMapList 정보 : {}", resultMapList);
		
		model.addAttribute("resultMapList", resultMapList);
		model.addAttribute("paging", paging);		
	}
	
	@RequestMapping(value="/message/detail")
	public String msgDetail(Message msg, Model model, HttpSession session) {
		logger.info("/message/detail [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		
		Message viewMsg = messageService.getMsgByMsgNo(msg);
		
		logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
		logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());
		
		if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
			return "message/error";
		}

		viewMsg = messageService.getMsgDetail(viewMsg, userNo);
		
		model.addAttribute("msg", viewMsg);
						
		return "message/detail";

	}
	
	@RequestMapping(value="/message/delete")
	public String msgDelete(Message msg, HttpSession session) {
		logger.info("/message/delete [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		
		Message viewMsg = messageService.getMsgByMsgNo(msg);
		
		logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
		logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());

		if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
			return "message/error";
		}
		
		messageService.setMsgDelete(viewMsg, userNo);
		
		return "redirect: send/list"; //referer 값 받아서 수정해야함
	}
	
	

}

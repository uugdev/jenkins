package com.khbill.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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

	@RequestMapping(value="/message/mem/write", method=RequestMethod.GET)
	public void writeMessageByOwn() {
		logger.info("/message/mem/write [GET]");

	}

	@RequestMapping(value="/message/mem/write", method=RequestMethod.POST)
	public String writeMessageByOwnProc(Message msg, HttpSession session, @RequestParam(value="userNick") String userNick, HttpServletResponse resp) {
		logger.info("/message/mem/write [POST]");

		logger.info("쪽지 정보 : {}", msg);
		
		int exist = memberService.checkUserExists(userNick);
		logger.info("닉네임 존재여부 : {}", exist);
		
		if(exist == 0) { //닉네임이 존재하지 않으면
			
			return "redirect:/message/send/error";

		}
		int receiverNo = memberService.getUserNo(userNick);

		msg.setSenderNo((int)session.getAttribute("userNo"));
		msg.setReceiverNo(receiverNo);
		logger.info("발신자, 수신자 정보 저장한 쪽지 정보 : {}", msg);

		messageService.setMessageWrite(msg);

		return "redirect:/message/close";
	}
	
	@RequestMapping(value="/message/send/error")
	public void messageError() {
		logger.info("/message/send/error [GET]");
	}

	@RequestMapping(value="/message/write", method=RequestMethod.GET)
	public void writeMessage(@RequestParam("userNick") String userNick, Model model) {
		logger.info("/message/write [GET]");

		model.addAttribute("userNick", userNick);

	}

	@RequestMapping(value="/message/write", method=RequestMethod.POST)
	public String writeMessageProc(Message msg, HttpSession session, @RequestParam(value="userNick") String userNick) {
		logger.info("/message/write [POST]");

		logger.info("쪽지 정보 : {}", msg);

		int ReceiverNo = memberService.getUserNo(userNick);

		msg.setSenderNo((int)session.getAttribute("userNo"));
		msg.setReceiverNo(ReceiverNo);
		logger.info("발신자, 수신자 정보 저장한 쪽지 정보 : {}", msg);

		messageService.setMessageWrite(msg);

		return "redirect:/message/close";
	}
	
	@RequestMapping(value="/message/close")
	public void closeMessage() {
		logger.info("/message/close [GET]");
		
	}

	@RequestMapping(value="/message/reply", method=RequestMethod.GET)
	public void replyMessage(@RequestParam(value="userNo") int userNo, Model model) {
		logger.info("/message/reply [GET]");

		String userNick = memberService.getUserNickByUserNo(userNo);

		model.addAttribute("userNick", userNick);

	}

	@RequestMapping(value="/message/reply", method=RequestMethod.POST)
	public String replyMessageProc(Message msg, HttpSession session, @RequestParam(value="userNick") String userNick) {
		logger.info("/message/write [POST]");

		logger.info("쪽지 정보 : {}", msg);

		int ReceiverNo = memberService.getUserNo(userNick);

		msg.setSenderNo((int)session.getAttribute("userNo"));
		msg.setReceiverNo(ReceiverNo);
		logger.info("발신자, 수신자 정보 저장한 쪽지 정보 : {}", msg);

		messageService.setMessageWrite(msg);

		return "redirect:/message/close";

	}

	
	@RequestMapping(value="/message/receive/list")
	public void msgList(Paging paramData, Model model) {
	
	}
	
	
	@RequestMapping(value="/message/receive/list/ajax")
	public String msgReceiveList(Paging paramData, HttpSession session, Model model) {
		logger.info("/message/receive/list/ajax [GET]");
		logger.info("paramData : {}", paramData);
		
		String where = null;
		if(paramData.getTarget() != null) {
			
			if (paramData.getTarget().equals("1")) {
				where = "unread";
			} else {
				where ="receive";
			}
		} else {
			
			where = "receive";
		}
		
		int userNo = (int)session.getAttribute("userNo");
		Paging paging = messageService.getPaging(paramData, userNo, where);
		
		logger.info("페이징 : {}", paging);

		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);

		List<HashMap<String, Object>> resultMapList = messageService.getRcvdMsgList(map);

		//		logger.info("resultMapList 정보 : {}", resultMapList);

		model.addAttribute("resultMapList", resultMapList);
		model.addAttribute("paging", paging);	
		
		return "message/receive/ajaxlist";
	}
	
	//전체 메시지(날짜순)
//	@RequestMapping(value="/message/receive/entire/list")
//	public String msgReceiveEntireList(Paging paramData, HttpSession session, Model model) {
//		logger.info("/meesage/receive/entire/list [GET]");
//		
//		int userNo = (int)session.getAttribute("userNo");
//		String where = "receive";
//		
//		Paging paging = messageService.getPaging(paramData, userNo, where);
//		
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("userNo", userNo);
//		map.put("paging", paging);
//		
//		List<HashMap<String, Object>> resultMapList = messageService.getRcvdMsgList(map);
//		
//		model.addAttribute("resultMapList", resultMapList);
//		model.addAttribute("paging", paging);		
//		model.addAttribute("res",true);
//		
//		return "message/receive/ajaxlist";
//	}
	
	//안읽은 메시지 날짜순
//	@RequestMapping(value="/message/receive/unread/list")
//	public String msgReceiveUnreadList(Paging paramData, HttpSession session, Model model) {
//		logger.info("/meesage/receive/unread/list [GET]");
//		
//		int userNo = (int)session.getAttribute("userNo");
//		String where = "unread";
//
//		Paging paging = messageService.getPaging(paramData, userNo, where);
//
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("userNo", userNo);
//		map.put("paging", paging);
//
//		List<HashMap<String, Object>> resultMapList = messageService.getRcvdUnreadMsgList(map);
//
//		model.addAttribute("resultMapList", resultMapList);
//		model.addAttribute("paging", paging);
//		model.addAttribute("res",true);
//		
//		return "message/receive/ajaxlist";
//	}

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

	@RequestMapping(value="/message/receive/detail")
	public String rcvdMsgDetail(int msgNo, Model model, HttpSession session) {
		logger.info("/message/receive/detail [GET]");

		int userNo = (int)session.getAttribute("userNo");

		Message viewMsg = messageService.getMsgByMsgNo(msgNo);

		int msgUserNo = viewMsg.getSenderNo();
		String senderNick = memberService.getUserNickByUserNo(msgUserNo);

		logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
		logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());

		if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
			return "message/error";
		}

		viewMsg = messageService.getMsgDetail(viewMsg, userNo);

		model.addAttribute("msg", viewMsg);
		model.addAttribute("userNick", senderNick);
		model.addAttribute("senderNo", viewMsg.getSenderNo());
		
		return "message/receive/detail";

	}

	@RequestMapping(value="/message/send/detail")
	public String sendMsgDetail(int msgNo, Model model, HttpSession session) {
		logger.info("/message/send/detail [GET]");

		int userNo = (int)session.getAttribute("userNo");

		Message viewMsg = messageService.getMsgByMsgNo(msgNo);

		int msgUserNo = viewMsg.getReceiverNo();
		String receiverNick = memberService.getUserNickByUserNo(msgUserNo);

		logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
		logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());
		logger.info("쪽지 receiverNick : {}", receiverNick);

		if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
			return "message/error";
		}

		viewMsg = messageService.getMsgDetail(viewMsg, userNo);

		model.addAttribute("msg", viewMsg);
		model.addAttribute("userNick", receiverNick);

		return "message/send/detail";

	}

	@RequestMapping(value="/message/receive/delete")
	public String rcvdMsgDelete(int[] msgNo, HttpSession session) {
		logger.info("/message/receive/delete [GET]");

		int userNo = (int)session.getAttribute("userNo");

		for(int i=0; i<msgNo.length; i++) {
			Message viewMsg = messageService.getMsgByMsgNo(msgNo[i]);

			logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
			logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());

			if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
				return "message/error";
			}

			messageService.setMsgDelete(viewMsg, userNo);

		}
		return "redirect:/message/receive/list";
	}

	@RequestMapping(value="/message/send/delete")
	public String sendMsgDelete(int[] msgNo, HttpSession session) {
		logger.info("/message/delete [GET]");

		int userNo = (int)session.getAttribute("userNo");

		for(int i=0; i<msgNo.length; i++) {
			Message viewMsg = messageService.getMsgByMsgNo(msgNo[i]);

			logger.info("쪽지 receiver 정보 : {}", viewMsg.getReceiverNo());
			logger.info("쪽지 sender 정보 : {}", viewMsg.getSenderNo());

			if(userNo != viewMsg.getReceiverNo() && userNo != viewMsg.getSenderNo()) {
				return "message/error";
			}

			messageService.setMsgDelete(viewMsg, userNo);

		}
		return "redirect:/message/send/list";
	}
}
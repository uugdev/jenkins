package com.khbill.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.khbill.dto.Ask;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.service.face.AskService;
import com.khbill.util.Paging;




@Controller
@RequestMapping(value="/ask")
public class AskController {
	
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@Autowired private AskService askService;

	@RequestMapping(value = "/list")
	public void getAskList(Paging paramData, Model model, HttpServletRequest req) {
		logger.info("/ask/list [GET]");

		Paging paging = askService.getPaging(paramData);
		List<Ask> list = askService.getAskList(paging);
		for(Ask a : list) {
			logger.info("{}", a);
		}
		
		List<User> user = askService.getUserList();
		
		model.addAttribute("user", user);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	
	
	}//list
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void setAskWrite(HttpServletRequest req, Model model) {
		logger.info("/ask/write [GET]");
		HttpSession session = req.getSession();

		String userNick = (String) session.getAttribute("userNick");
		
		model.addAttribute("userNick", userNick);
		
		
	}
	
	
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String setAskWriteProcess(Ask ask, Item item, MultipartFile file, String voteEnd, HttpServletRequest req) {
		logger.info("/ask/write [POST]");
		
		logger.info("ask : {}", ask);
		logger.info("item : {}", item);
		logger.info("file : {}", file);
		logger.info("vote : {}", voteEnd);
		
		HttpSession session = req.getSession();
		int userNo = (Integer) session.getAttribute("userNo");
		
		ask.setUserNo(userNo);
		
		askService.setAskWrite(ask,item,file,voteEnd);
		
		return "redirect:/ask/list";
		
	}
	
	
	
	
	
	
	
	
	
	

}

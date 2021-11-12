package com.khbill.controller;

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
import com.khbill.dto.File;
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
	
	
	
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detail(int askNo,Model model) {
		logger.info("/ask/detail [GET]");
		
		Ask ask = askService.getAskDetail(askNo);
		logger.info("ask : {}", ask);
		
		Vote vote = askService.getVote(askNo);
		logger.info("vote : {}", vote);
		Item item = askService.getItem(ask.getProductNo());
		logger.info("item : {}", item);
		File file = askService.getFile(item.getFileNo());
		logger.info("file : {}", file);
		
		User user = askService.getUserInfoByUserNo(ask.getUserNo());
		
		model.addAttribute("user",user);
		
		model.addAttribute("ask",ask);
		model.addAttribute("vote",vote);
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
		
	
	
	}
	
	
	

}

package com.khbill.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
import com.khbill.service.face.AdminAskService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/ask")
public class AdminAskController {

	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@Autowired
	AdminAskService adminAskService;
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void adminAskList(Paging paramData, Model model) {
		logger.info("/admin/ask/list [GET]");
		
		Paging paging = adminAskService.getPaging(paramData);
		List<Ask> list = adminAskService.getAskList(paging);
		List<User> user = adminAskService.getUserList();
		
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	
	}
	
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public void adminAskDetail(int askNo, Model model, HttpSession session) {
		logger.info("/admin/ask/detail [GET]");
		

		Ask ask = adminAskService.getAskDetail(askNo);
		boolean adminLogin = (boolean) session.getAttribute("adminLogin");
		
		Vote voteSet = new Vote();
		voteSet.setUserNo(ask.getUserNo());
		voteSet.setAskNo(askNo);
				
		Vote vote = adminAskService.getVote(voteSet);
		Item item = adminAskService.getItem(ask.getProductNo());
		File file = adminAskService.getFile(item.getFileNo());
		
		User user = adminAskService.getUserInfoByUserNo(ask.getUserNo());
		
		List<User> userList = adminAskService.getUserList();
		
		model.addAttribute("adminLogin",adminLogin);
		model.addAttribute("userList",userList);
		model.addAttribute("user",user);
		model.addAttribute("ask",ask);
		model.addAttribute("vote",vote);
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
		
		String voteStateY = "n"; //투표체크 Y
		int cntN = adminAskService.getVoteStatusTotalCnt(askNo,voteStateY);
		model.addAttribute("cntN",cntN);
		
		String voteStateN = "y"; //투표체크 N
		int cntY = adminAskService.getVoteStatusTotalCnt(askNo,voteStateN);
		model.addAttribute("cntY",cntY);

		
		List<AskComment> askComment = adminAskService.getAskComList(askNo);
		model.addAttribute("askComment",askComment);
		
		
	}
	
	@RequestMapping(value = "/delete")
	public String adminAskDelete(int[] askNo) {
		logger.info("/admin/ask/delete");
		
		int size = askNo.length;
		for(int i=0; i<size; i++) {
			
			adminAskService.setAskComDelete(askNo[i]);
			adminAskService.setAskDelete(askNo[i]);
			
		}
		
		
		return "redirect:/admin/ask/list";
		
	}
	
	
	@RequestMapping(value="/comment/delete")
	public void delete(int askComNo, Writer writer, Model model) {
		logger.info("/admin/ask/comment/delete");
		
		boolean success = adminAskService.deleteAskCom(askComNo);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
}//class

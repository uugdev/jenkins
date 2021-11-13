package com.khbill.controller;

import java.io.IOException;
import java.io.Writer;
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
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
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
		
		Vote vote = askService.getVote(askNo);
		Item item = askService.getItem(ask.getProductNo());
		File file = askService.getFile(item.getFileNo());
		
		User user = askService.getUserInfoByUserNo(ask.getUserNo());
		
		List<User> userList = askService.getUserList();
		
		model.addAttribute("userList",userList);
		model.addAttribute("user",user);
		
		model.addAttribute("ask",ask);
		model.addAttribute("vote",vote);
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
		String check = askService.voteCheck(vote);
		
		model.addAttribute("check",check);
		
		List<AskComment> askComment = askService.getAskComList(askNo);
		model.addAttribute("askComment",askComment);
		
		
	}
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void setAskUpdate(int askNo,Model model) {
		logger.info("/ask/update [GET]");
		
		Ask ask = askService.getAskDetail(askNo);
		Vote vote = askService.getVote(askNo);
		Item item = askService.getItem(ask.getProductNo());
		File file = askService.getFile(item.getFileNo());
		User user = askService.getUserInfoByUserNo(ask.getUserNo());
		
		model.addAttribute("user",user);
		model.addAttribute("ask",ask);
		model.addAttribute("vote",vote);
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String setAskUpdateProcess(Ask ask, HttpServletRequest req) {
		logger.info("/ask/update [POST]");
	
		HttpSession session = req.getSession();
		int userNo = (Integer) session.getAttribute("userNo");
		
		ask.setUserNo(userNo);
		
		askService.setAskUpdate(ask);
		
		return "redirect:/ask/detail?askNo="+ask.getAskNo();
		

	}

	@RequestMapping(value ="/delete")
	public String delete(int askNo) {
		logger.info("/ask/delete []");
		
		askService.setAskComDelete(askNo);
		askService.setAskDelete(askNo);
		
		return "redirect:/ask/list?askNo="+askNo;
	}
	
	
	
	@RequestMapping(value ="/comment/write",method = RequestMethod.POST)
	public String AskComWrite(int askNo, AskComment askComment, Model model, HttpSession session) {
		logger.info("/ask/comment/write [POST]");
		
		int userNo = (Integer) session.getAttribute("userNo");
		askComment.setUserNo(userNo);
		askComment.setAskNo(askNo);
		askService.setAskCommentWrite(askComment);
		
		return "redirect:/ask/detail?askNo="+askComment.getAskNo();
	}
	
	
	@RequestMapping(value="/comment/delete")
	public void delete(int askComNo, Writer writer, Model model) {
		
		boolean success = askService.deleteAskCom(askComNo);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping(value="/votelike")
	public ModelAndView voteLike( int askNo, ModelAndView mav,HttpSession session ) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		askService.getVoteStatus(askNo,userNo);
		
		
		
		mav.setViewName("jsonView");

		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class

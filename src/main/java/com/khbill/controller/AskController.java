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
import com.khbill.dto.AskReport;
import com.khbill.dto.AskScrap;
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
	
	@Autowired
	AskService askService;

	@RequestMapping(value = "/list")
	public void getAskList(Paging paramData, Model model, HttpServletRequest req) {
		logger.info("/ask/list [GET]");

		Paging paging = askService.getPaging(paramData);
		List<Ask> list = askService.getAskList(paging);
		List<User> user = askService.getUserList();
		
		System.out.println("ask" + user);
		System.out.println("user" + user);
		
		model.addAttribute("user", user);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	
	
	}//list
	
	
//	@RequestMapping(value = "/voteList")
//	public void getAskListVote(Paging paramData, Model model, HttpServletRequest req) {
//		logger.info("/ask/votenum/list [GET]");
//
//		Paging paging = askService.getPaging(paramData);
//		List<ha>
//		
//		List<User> user = askService.getUserList();
//		
//		model.addAttribute("user", user);
//		model.addAttribute("paging", paging);
//		model.addAttribute("list", list);
//	
//	
//	}//list

	@RequestMapping(value = "/hitlist")
	public void getAskHitList(Paging paramData, Model model, HttpServletRequest req) {
		logger.info("/ask/votenum/list [GET]");

		Paging paging = askService.getPaging(paramData);
		List<Ask> list = askService.getAskHitList(paging);
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
	public void detail(int askNo,Model model, HttpSession session) {
		logger.info("/ask/detail [GET]");
		
		Ask ask = askService.getAskDetail(askNo);
		int userNo = (Integer) session.getAttribute("userNo");
		
		Vote status = askService.getLoginUserVoteState(userNo,askNo);
		boolean result = askService.getVoteState(askNo,userNo);
		
		Vote voteSet = new Vote();
		voteSet.setUserNo(ask.getUserNo());
		voteSet.setAskNo(askNo);
				
		Vote vote = askService.getVote(voteSet);
		Item item = askService.getItem(ask.getProductNo());
		File file = askService.getFile(item.getFileNo());
		
		User user = askService.getUserInfoByUserNo(ask.getUserNo());
		
		List<User> userList = askService.getUserList();
		
		model.addAttribute("userList",userList);
		model.addAttribute("user",user);
		model.addAttribute("status",status);
		model.addAttribute("result",result);
		
		model.addAttribute("ask",ask);
		model.addAttribute("vote",vote);
		model.addAttribute("item",item);
		model.addAttribute("file",file);
		
		String check = askService.voteCheck(vote);
		
		model.addAttribute("check",check);
		
		String voteStateY = "n"; //투표체크 Y
		int cntN = askService.getVoteStatusTotalCnt(askNo,voteStateY);
		model.addAttribute("cntN",cntN);
		
		String voteStateN = "y"; //투표체크 N
		int cntY = askService.getVoteStatusTotalCnt(askNo,voteStateN);
		model.addAttribute("cntY",cntY);

		
		List<AskComment> askComment = askService.getAskComList(askNo);
		model.addAttribute("askComment",askComment);
		
		//스크랩 상태 조회
		AskScrap askScrap = new AskScrap(); 
		askScrap.setAskNo(askNo);
		askScrap.setUserNo(userNo);
		
		//스크랩 상태 전달
		boolean isScrap = askService.isScrap(askScrap);
		model.addAttribute("isScrap",isScrap);		
		
	}
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void setAskUpdate(int askNo,Model model) {
		logger.info("/ask/update [GET]");
		
		Ask ask = askService.getAskDetail(askNo);
		Vote voteSet = new Vote();
		voteSet.setUserNo(ask.getUserNo());
		voteSet.setAskNo(askNo);
				
		Vote vote = askService.getVote(voteSet);
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
		
		return "redirect:/ask/list";
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
		logger.info("/ask/comment/delete");
		
		boolean success = askService.deleteAskCom(askComNo);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
//	@RequestMapping(value="/comment/update", method=RequestMethod.GET)
//	public ModelAndView update(int askComNo, ModelAndView mav) {
//		logger.info("/ask/comment/update");
//		
//		
//		AskComment askComment = askService.getAskComDetail(askComNo);
//		String askComContent = askComment.getAskComContent();
//		boolean result = true;
//		
//		mav.addObject("result", result);
//		mav.addObject(askComContent);
//		mav.setViewName("jsonView");
//		System.out.println(mav);
//		
//		return mav;
//		
//	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/votelike")
	public ModelAndView voteLike( int askNo, ModelAndView mav,HttpSession session ) {
		logger.info("/ask/votelike");
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		Ask ask = askService.getAskDetail(askNo);
		
		Vote voteSet = new Vote();
		
		voteSet.setAskNo(askNo);
		voteSet.setUserNo(ask.getUserNo());
		
		Vote vote = askService.getVote(voteSet); //글쓴이 vote객체
		
		String voteState = "y"; //투표체크 Y

		askService.setVoteInsert(userNo, vote, voteState);
		int cntY = askService.getVoteStatusTotalCnt(askNo,voteState);
		
		Vote status = askService.getLoginUserVoteState(userNo,askNo);//로그인유저의 투표상태체크
		boolean result = askService.getVoteState(askNo,userNo);
		
		mav.addObject("result",result);
		mav.addObject("status", status);
		mav.addObject("cntY",cntY); //총투표수
		mav.setViewName("jsonView");
			
		
		return mav;
	}
	
	

	@RequestMapping(value="/votehate")
	public ModelAndView voteHate( int askNo, ModelAndView mav,HttpSession session ) {
		logger.info("/ask/votehate");
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		Ask ask = askService.getAskDetail(askNo);
		
		Vote voteSet = new Vote();
		
		voteSet.setAskNo(askNo);
		voteSet.setUserNo(ask.getUserNo());
		
		Vote vote = askService.getVote(voteSet); //글쓴이 vote객체
		
		String voteState = "n"; //투표체크 N

		askService.setVoteInsert(userNo, vote, voteState);
		int cntN = askService.getVoteStatusTotalCnt(askNo,voteState);
		
		Vote status = askService.getLoginUserVoteState(userNo,askNo);//로그인유저의 투표상태체크
		boolean result = askService.getVoteState(askNo,userNo);
		
		mav.addObject("result",result);
		mav.addObject("status", status);
		mav.addObject("cntN",cntN); //총투표수
		mav.setViewName("jsonView");
			
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/scrap", method = RequestMethod.GET)
	public ModelAndView scrap(int askNo, ModelAndView mav ,HttpSession session) {
		logger.info("/ask/scrap [GET]");
		
		//스크랩 정보 토글
		AskScrap askScrap = new AskScrap();
		askScrap.setAskNo(askNo);
		askScrap.setUserNo((Integer) session.getAttribute("userNo"));
		
		boolean resultScrap = askService.scrap(askScrap);
		
		mav.addObject("resultScrap",resultScrap);
		mav.setViewName("jsonView");
		
		
		return mav;
	}
	
	
	@RequestMapping(value ="/report",method = RequestMethod.POST)
	public String askReport(int askNo,AskReport askReport,HttpSession session) {
		logger.info("/ask/report [POST]");
		
		logger.info("askReport: {}",askReport);
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		askReport.setAskNo(askNo);
		askReport.setReporterNo(userNo);
		
		boolean reportCheck =  askService.askReportByAskNoLoginUserNo(askReport);
		
		if(reportCheck) {
			
			askService.setAskReport(askReport);
			
		}
			
		
		return "redirect:/ask/detail?askNo="+askNo;
	}
	
	
	
	
	
	
}//class

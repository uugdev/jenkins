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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Controller
public class TradeController {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	@Autowired private TradeService tradeService;
	
	//거래 게시판 목록
	@RequestMapping(value = "/trade/list")
	public void tradeList(
				Model model
				, Paging paramData
			) {
		
		logger.info("curPage {}", paramData);
		
		Paging paging = tradeService.getPaging(paramData);
		
		List<Trade> tradeList = tradeService.getTradeList(paging);
		
		model.addAttribute("tradeList", tradeList);
		model.addAttribute("paging", paging);
		
	}
	
	//거래 게시글 상세보기
	@RequestMapping(value = "/trade/detail")
	public void tradeDetail(
				Model model
				, int tradeNo
			) {
		
		Object tradeDetail = tradeService.getTradeDetail(tradeNo);
		List<Object> tradeComment = tradeService.getTradeCommentDetail(tradeNo);
		
		logger.info("tradeDetail - {}", tradeDetail);
		logger.info("tradeComment - {}", tradeComment);
		
		model.addAttribute("tradeDetail", tradeDetail);
		model.addAttribute("tradeComment", tradeComment);
		
	}
	
	//거래 게시글 작성
	@RequestMapping(value = "/trade/write", method = RequestMethod.GET)
	public void tradeGetWrite() {}

	//거래 게시글 작성
	@RequestMapping(value = "/trade/write", method = RequestMethod.POST)
	public String tradePostWrite(
				HttpSession session
				, MultipartFile file
				, Trade trade
			) {
		logger.info("session - {}", session);
		logger.info("file - {}", file);
		logger.info("trade - {}", trade);
		
		tradeService.setTradeWrite(session, file, trade);
		
		return "redirect:/trade/list";
	}
	
	//거래 게시글 댓글 작성
	@RequestMapping(value = "/trade/comment/write", method = RequestMethod.POST)
	public String tradeCommentWrite(
				HttpSession session
				, Model model
				, TradeComment tradeComment
			) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		tradeComment.setUserNo(userNo);
		tradeService.setTradeCommentWrite(tradeComment);
		
		logger.info("userNo {}", userNo);
		logger.info("tradeComment {}", tradeComment);
		
		return "redirect:/trade/detail?tradeNo=" + tradeComment.getTradeNo();
	}
	
	//거래 게시글 댓글 삭제
	@RequestMapping(value = "/trade/comment/delete")
	public void tradeCommentDelete(
				int tradeComNo
				, Writer writer
			) {
		
		logger.info("tradeComNo - {}", tradeComNo);
		
		boolean success = tradeService.setTradeCommentDelete(tradeComNo);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/trade/comment/update")
	public ModelAndView tradeCommentUpdate(
				ModelAndView mav
				, TradeComment tradeComment
				) {
		logger.info("AJAX COMMENT UPDATE");
		logger.info("tradeComment - {}", tradeComment);
		
		boolean success = false;
		
		TradeComment resultTradeComment = tradeService.setTradeCommentUpdate(tradeComment);
		
		if(tradeComment.getTradeComNo() == resultTradeComment.getTradeComNo()) {
			success = true;
		} else {
			success = false;
		}
		
		mav.addObject("success", success);
		mav.addObject("tradeComment", tradeComment);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	

}

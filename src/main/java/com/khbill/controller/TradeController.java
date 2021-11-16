package com.khbill.controller;

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

import com.khbill.dto.Trade;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Controller
public class TradeController {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	@Autowired private TradeService tradeService;
	
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
	
	@RequestMapping(value = "/trade/write", method = RequestMethod.GET)
	public void tradeGetWrite() {}

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
	
	

}

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

import com.khbill.dto.Trade;
import com.khbill.dto.TradeScrap;
import com.khbill.service.face.AdminTradeService;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Controller
public class AdminTradeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTradeController.class);
	
	@Autowired private AdminTradeService adminTradeService;
	@Autowired private TradeService tradeService;
	
	@RequestMapping(value = "/admin/trade/list")
	public void adminTradeList(
				Model model
				, Paging paramData
			) {
		
		Paging paging = tradeService.getPaging(paramData);
		
		List<Trade> tradeList = tradeService.getTradeList(paging);
		
		model.addAttribute("tradeList", tradeList);
		model.addAttribute("paging", paging);
		
	}
	
	//거래 게시글 상세보기
	@RequestMapping(value = "/admin/trade/detail")
	public void adminTradeDetail(
				Model model
				, int tradeNo
			) {
		
		HashMap<String, String> tradeDetail = adminTradeService.getTradeDetail(tradeNo);
		List<HashMap<String, String>> tradeComment = tradeService.getTradeCommentDetail(tradeNo);
		
		logger.info("tradeDetail - {}", tradeDetail);
		logger.info("tradeComment - {}", tradeComment);
		
		model.addAttribute("tradeDetail", tradeDetail);
		model.addAttribute("tradeComment", tradeComment);
		
	}
	
	

}

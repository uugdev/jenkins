package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}

package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Trade;
import com.khbill.service.face.AdminTradeService;
import com.khbill.util.Paging;

@Controller
public class AdminTradeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTradeController.class);
	
	@Autowired private AdminTradeService adminTradeService;
	
	@RequestMapping(value = "/admin/trade/list")
	public void adminTradeList(
				Model model
				, Paging paramData
			) {
		
		Paging paging = adminTradeService.getPaging(paramData);
		
		List<Trade> tradeList = adminTradeService.getTradeList(paging);
		
		model.addAttribute("tradeList", tradeList);
		model.addAttribute("paging", paging);
		
	}

}

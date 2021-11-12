package com.khbill.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Notice;
import com.khbill.dto.User;
import com.khbill.service.face.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MainService mainService;
	
	@RequestMapping(value="/main")
	public void main(
				Model model
				, HttpSession session
			) {
		
		List<User> userTen = mainService.getUserPointListTen();
		List<Notice> noticeSix = mainService.getNoticeListSix();
		Map<String, Integer> moneyAndPercent = null;
		
		//로그인을 하지 않았을 경우
		if( session.getAttribute("userNo") != null ) {
			moneyAndPercent = mainService.getAvailableAmountAndPercent(session);
		}
		
		logger.info("userTen {}", userTen);
		logger.info("noticeSix {}", userTen);
		logger.info("moenyAndPercent {}", moneyAndPercent);
		
		model.addAttribute("userTen", userTen);
		model.addAttribute("noticeSix", noticeSix);
		model.addAttribute("moneyAndPercent", moneyAndPercent);
	}
	
}

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

import com.khbill.dto.Ask;
import com.khbill.dto.Notice;
import com.khbill.dto.User;
import com.khbill.service.face.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MainService mainService;
	
	@RequestMapping(value = "/")
	public String defaultMain() {
		return "redirect:/main";
	}
	
	@RequestMapping(value="/main")
	public void main(
				Model model
				, HttpSession session
			) {
		
		List<User> userTen = mainService.getUserPointListTen(); //유저 랭킹
		List<Notice> noticeSix = mainService.getNoticeListSix(); //공지사항
		Map<String, Integer> moneyAndPercent = null; //아낀 돈, 퍼센트
		List<String> mainment = null; //메인 멘트
		List<Object> popularBoard = mainService.getPopularBoard(); //인기있는 질문 게시글
		List<Object> mainBill = null;
		//로그인을 했을 경우
		if( session.getAttribute("userNo") != null ) {
			moneyAndPercent = mainService.getAvailableAmountAndPercent(session);
			mainment = mainService.getMainment(moneyAndPercent.get("percent"));
			mainBill = mainService.getBuyItemList(session);
		}
		
		logger.info("userTen {}", userTen);
		logger.info("noticeSix {}", userTen);
		logger.info("moenyAndPercent {}", moneyAndPercent);
		logger.info("mainment {}", mainment);
		logger.info("popularBoard {}", popularBoard);
		logger.info("mainBill {}", mainBill);
		
		model.addAttribute("userTen", userTen);
		model.addAttribute("noticeSix", noticeSix);
		model.addAttribute("moneyAndPercent", moneyAndPercent);
		model.addAttribute("mainment", mainment);
		model.addAttribute("popularBoard", popularBoard);
		model.addAttribute("mainBill", mainBill);
	}
	
}

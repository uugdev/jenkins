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

import com.khbill.dto.Ask;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.Vote;
import com.khbill.service.face.AskService;
import com.khbill.util.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired AskService askService;

	@RequestMapping(value="/mypage/item/list")
	public void itemList(HttpSession session, Model model, Paging paramData) {
		logger.info("/mypage/item/list [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		logger.info("세션에 저장된 유저 번호 : {}", userNo);
		
		Paging paging = askService.getPaging(paramData, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<Ask> askList = askService.getAskItemList(map);
		List<Item> itemList = askService.getItemList(userNo);
		List<Vote> voteList = askService.getVoteList(userNo);
//		List<Review> reviewList = askService.getReviewList(userNo);
		
		model.addAttribute("ask", askList);
		model.addAttribute("item", itemList);
		model.addAttribute("vote", voteList);
//		model.addAttribute("review", reviewList);
		
		logger.info("askList 정보 : {}", askList);
		logger.info("itemList 정보 : {}", itemList);
		logger.info("voteList 정보 : {}", voteList);
//		logger.info("reviewList 정보 : {}", reviewList);

		
		
		
		
	}
	
	
}

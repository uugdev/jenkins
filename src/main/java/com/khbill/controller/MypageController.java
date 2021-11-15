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

import com.khbill.dto.Item;
import com.khbill.service.face.AskService;
import com.khbill.service.face.ItemService;
import com.khbill.util.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired AskService askService;
	@Autowired ItemService itemService;
	
	@RequestMapping(value="/mypage/item/list")
	public void itemList(HttpSession session, Model model, Paging paramData) {
		logger.info("/mypage/item/list [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		logger.info("세션에 저장된 유저 번호 : {}", userNo);
		
		Paging paging = itemService.getPaging(paramData, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<HashMap<String, Object>> resultMapList = itemService.getItemList(map);
		
		logger.info("resultMapList 정보 : {}", resultMapList);
		
		model.addAttribute("list", resultMapList);
		model.addAttribute("paging", paging);		

		
	}
	
	@RequestMapping(value="/mypage/item/status")
	public String itemStatus(Item item) {
		logger.info("/mypage/item/status [GET]");
		
		int askNo = itemService.getAskNoByItemNo(item);
		
		//아이템 결제 상태를 변경하기
		itemService.setItemStatus(askNo);
		
		return "redirect:/mypage/item/list";
	
		
	}
	
	
}

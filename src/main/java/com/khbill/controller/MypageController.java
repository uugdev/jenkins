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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.service.face.AskService;
import com.khbill.service.face.ItemService;
import com.khbill.service.face.MemberService;
import com.khbill.util.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired AskService askService;
	@Autowired ItemService itemService;
	@Autowired MemberService memberService;
	
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
	
	@RequestMapping(value="/mypage/info")
	public void userInfo(User user, HttpSession session, Model model) {
		logger.info("/mypage/info [GET]");
		
		int userNo = (int)session.getAttribute("userNo");
		
		user = memberService.getUserByUserNo(userNo);
		
		User userInfo = memberService.getUserInfo(user);
		
		session.setAttribute("userNick", userInfo.getUserNick());
		
		model.addAttribute("user", user);
		
	}
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.GET)
	public void userUpdate(User user, HttpSession session, Model model) {
		logger.info("/mypage/update [GET])");
		
		//세션에 있는 유저번호 가져오기
		int userNo = (int)session.getAttribute("userNo");
		
		//유저 번호로 유저 정보를 찾기
		user = memberService.getUserByUserNo(userNo);
		
		//조회한 유저 정보 전달
		
		if(session.getAttribute("login") != null) {
			model.addAttribute("user", user);			
		}
		
	}

	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	public String userUpdateProc(User user, HttpSession session) {
		logger.info("/mypage/update [GET])");

		memberService.setUserUpdate(user);
		
		User userInfo = memberService.getUserInfo(user);
		
		session.setAttribute("login", true);
		session.setAttribute("userNick", userInfo.getUserNick());
		session.setAttribute("userNo", userInfo.getUserNo());
		
		return "redirect:/mypage/info";
	}
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.POST)
	public String userDelete(User user, HttpSession session) {
		logger.info("/mypage/delete [POST])");
		
		int userNo = (int)session.getAttribute("userNo");
		logger.info("userNo 정보 : {}", userNo);
		
		memberService.setUserDelete(userNo);
		
		session.invalidate();
		
		return "redirect:/main";

		
	}
	
	
}

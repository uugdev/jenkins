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
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.service.face.AccountService;
import com.khbill.service.face.MainService;

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	AccountService accountService;

	@Autowired MainService mainService;
	
	
	@RequestMapping(value = "/account/main", method = RequestMethod.GET)
	public void accountMain(HttpSession session, Model model) {
		logger.info("/account/main [GET]");

		int userNo = (int) session.getAttribute("userNo");
		User user = accountService.getUserInfo(userNo);
		
		List<Item> itemList = accountService.getItemListByLoginUserNo(userNo);
		logger.info("itemList : {}", itemList);
		
		//유저의 이번달 지출 금액
		int monthPrice = accountService.getitemSumMon(userNo);
		
		int subMoney = user.getExtraMoney() - monthPrice;
		//이번달 지출 아이템 리스트
		List<Item> monthItemList = accountService.getItemListByMon(userNo);
		
		model.addAttribute("user", user);
		model.addAttribute("subMoney", subMoney);
		model.addAttribute("monthPrice", monthPrice);
		model.addAttribute("monthItemList", monthItemList);
		model.addAttribute("itemList", itemList);
		
		List <HashMap<String,Object>> itemSum = accountService.getUserItemSum(userNo);	
		
		model.addAttribute("itemSum",itemSum);
		
		
	}


	@RequestMapping(value = "/account/extramoney", method = RequestMethod.POST)
	public ModelAndView accountExtraMoney(int extraMoney, ModelAndView mav, HttpSession session) {
		logger.info("/account/extramoney [POST]");

		int userNo = (int) session.getAttribute("userNo");
//		int money = Integer.parseInt(extraMoney);

		accountService.setUpdateExtraMoney(userNo, extraMoney);

		User user = accountService.getUserInfo(userNo);
		int changeMoney = user.getExtraMoney();
//		List<Item> itemList = accountService.getItemListByLoginUserNo(userNo);
		logger.info("changeMoney : {}", changeMoney);
		
		//유저의 이번달 지출금액
		int month = accountService.getitemSumMon(userNo);
		
		//유저의 지출가능금액 - 이번달지출금액
		int sub = changeMoney - month;
		
//		mav.addObject("user", user);
		mav.addObject("changeMoney", changeMoney);
		mav.addObject("sub", sub);
//		mav.addObject("itemList", itemList);
		mav.setViewName("jsonView");

		return mav;

	}
	
	
	
	

}

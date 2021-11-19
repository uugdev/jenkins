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

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	AccountService accountService;

	@RequestMapping(value = "/account/main", method = RequestMethod.GET)
	public void accountMain(HttpSession session, Model model) {
		logger.info("/account/main [GET]");

		int userNo = (int) session.getAttribute("userNo");
		User user = accountService.getUserInfo(userNo);

		List<Item> itemList = accountService.getItemListByLoginUserNo(userNo);
		logger.info("itemList : {}", itemList);

		model.addAttribute("user", user);
		model.addAttribute("itemList", itemList);
		
		List <HashMap<String,Object>> itemSum = accountService.getUserItemSum(userNo);	
		
		model.addAttribute("itemSum",itemSum);
		
		
	}


	@RequestMapping(value = "/account/extramoney", method = RequestMethod.POST)
	public ModelAndView accountExtraMoney(String extraMoney, ModelAndView mav, HttpSession session) {
		logger.info("/account/extramoney [POST]");

		int userNo = (int) session.getAttribute("userNo");
		int money = Integer.parseInt(extraMoney);

		accountService.setUpdateExtraMoney(userNo, money);

		User user = accountService.getUserInfo(userNo);
		int changeMoney = user.getExtraMoney();
//		List<Item> itemList = accountService.getItemListByLoginUserNo(userNo);
		logger.info("changeMoney : {}", changeMoney);

		
//		mav.addObject("user", user);
		mav.addObject("changeMoney", changeMoney);
//		mav.addObject("itemList", itemList);
		mav.setViewName("jsonView");

		return mav;

	}

}

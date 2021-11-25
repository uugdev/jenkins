package com.khbill.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

		// 전체 아이템구매리스트
		List<Item> itemList = accountService.getItemListByLoginUserNo(userNo);
		logger.info("itemList : {}", itemList);

		// 유저의 이번달 지출 금액
		int monthPrice = accountService.getitemSumMon(userNo);

		// 남은지출금액
		int subMoney = user.getExtraMoney() - monthPrice;
		// 이번달 지출 아이템 리스트
		List<Item> monthItemList = accountService.getItemListByMon(userNo);

		model.addAttribute("user", user);
		model.addAttribute("subMoney", subMoney);
		model.addAttribute("monthPrice", monthPrice);
		model.addAttribute("monthItemList", monthItemList);
		model.addAttribute("itemList", itemList);

		// 지난달 지출액
		int last = accountService.getCompareItemSum(userNo);

		int compare = last - monthPrice;

		if (compare < 0) {

			compare = compare * -1;

		}

		model.addAttribute("compare", compare);
		model.addAttribute("last", last);

		// 올해 아이템체크리스트 총액 (월별)
		List<HashMap<String, Object>> itemSum = accountService.getUserItemSum(userNo);

		model.addAttribute("itemSum", itemSum);

		// 달력에 유저생일
		String birth = user.getUserBday();

		String bir[] = new String[90];
		bir[0] = user.getUserBday();

		for (int i = 1; i < bir.length; i++) {

			bir[i] = accountService.AddDate(birth, i);

		}

		List<Date> bDay = new ArrayList();

		Date date = new Date();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {

			for (int i = 0; i < bir.length; i++) {

				date = format.parse(bir[i]);
				bDay.add(date);

			}
		
			model.addAttribute("bDay", bDay);

		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/account/extramoney", method = RequestMethod.POST)
	public ModelAndView accountExtraMoney(int extraMoney, ModelAndView mav, HttpSession session) {
		logger.info("/account/extramoney [POST]");

		int userNo = (int) session.getAttribute("userNo");

		accountService.setUpdateExtraMoney(userNo, extraMoney);

		User user = accountService.getUserInfo(userNo);
		int changeMoney = user.getExtraMoney();
		logger.info("changeMoney : {}", changeMoney);

		// 유저의 이번달 지출금액
		int month = accountService.getitemSumMon(userNo);

		// 유저의 지출가능금액 - 이번달지출금액
		int sub = changeMoney - month;

		List<Item> monthItemList = accountService.getItemListByMon(userNo);
		int arr[] = new int[monthItemList.size() + 1];

		logger.info("monthItemList.size(): {}", monthItemList.size());

		for (int i = 0; i < monthItemList.size(); i++) {

			arr[i] = monthItemList.get(i).getItemPrice();

		}

		arr[monthItemList.size()] = sub;

		mav.addObject("changeMoney", changeMoney);
		mav.addObject("sub", sub);
		mav.addObject("arr", arr);
		mav.setViewName("jsonView");

		return mav;

	}

}

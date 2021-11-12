package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.MainDao;
import com.khbill.dto.Notice;
import com.khbill.dto.User;
import com.khbill.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired MainDao mainDao;

	@Override
	public List<User> getUserPointListTen() {
		return mainDao.selectUserInfoOrderByPoint();
	}

	@Override
	public List<Notice> getNoticeListSix() {
		return mainDao.selectNoticeListSix();
	}

	@Override
	public Map<String, Integer> getAvailableAmountAndPercent(HttpSession session) {
		
		//조회 결과
		Map<String, Integer> resultMap = new HashMap<>();
		
		//유저 번호
		int userNo = (int) session.getAttribute("userNo");
		
		//지출 가능 금액
		int extraMoney = mainDao.selectExtraMoneyByUserNo(userNo);
		
		//결제 여부가 y인 상품 가격의 총합
		int totalPrice = mainDao.selectItemListCheckStatusByUserNo(userNo);
		
		logger.info("extraMoney - {}", extraMoney);
		logger.info("totalPrice - {}", totalPrice);
		
		int saveMoney = extraMoney - totalPrice;
		int percent = (totalPrice / extraMoney) * 100;
		
		logger.info("percent - {}", percent);
		
		resultMap.put("extraMoney", extraMoney);
		resultMap.put("totalPrice", totalPrice);
		
		return resultMap;
	}

}

package com.khbill.service.impl;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminTradeDao;
import com.khbill.dao.face.TradeDao;
import com.khbill.service.face.AdminTradeService;

@Service
public class AdminTradeServiceImpl implements AdminTradeService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTradeServiceImpl.class);
	
	@Autowired private AdminTradeDao adminTradeDao;
	@Autowired private TradeDao tradeDao;

	@Override
	public HashMap<String, String> getTradeDetail(int tradeNo) {
		return tradeDao.selectTradeByTradeNo(tradeNo);
	}


}

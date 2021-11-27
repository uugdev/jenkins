package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminTradeDao;
import com.khbill.dao.face.TradeDao;
import com.khbill.dto.Trade;
import com.khbill.service.face.AdminTradeService;
import com.khbill.util.Paging;

@Service
public class AdminTradeServiceImpl implements AdminTradeService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTradeServiceImpl.class);
	
	@Autowired private AdminTradeDao adminTradeDao;
	@Autowired private TradeDao tradeDao;

	@Override
	public HashMap<String, String> getTradeDetail(int tradeNo) {
		return tradeDao.selectTradeByTradeNo(tradeNo);
	}

	@Override
	public List<Trade> getTradeList(Paging paging) {
		return adminTradeDao.selectTradeList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = adminTradeDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		paging.setTarget(paramData.getTarget());
		
		return paging;
	}


}

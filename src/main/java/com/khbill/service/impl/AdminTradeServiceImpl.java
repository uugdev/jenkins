package com.khbill.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminTradeDao;
import com.khbill.dto.Trade;
import com.khbill.service.face.AdminTradeService;
import com.khbill.util.Paging;

@Service
public class AdminTradeServiceImpl implements AdminTradeService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTradeServiceImpl.class);
	
	@Autowired private AdminTradeDao adminTradeDao;

	@Override
	public Paging getPaging(Paging paramData) {
		//trade 테이블의 총 게시글 수를 조회한다
		int totalCount = adminTradeDao.selectCntAll(paramData);
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Trade> getTradeList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

}

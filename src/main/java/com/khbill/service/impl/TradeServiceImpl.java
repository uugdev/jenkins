package com.khbill.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.TradeDao;
import com.khbill.dto.Trade;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Service
public class TradeServiceImpl implements TradeService {
	
	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	
	//서비스 객체
	@Autowired private TradeDao tradeDao;
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(Paging paramData) {
		
		//Board 테이블의 총 게시글 수를 조회한다
		int totalCount = tradeDao.selectCntAll(paramData);
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Trade> getTradeList(Paging paging) {
		return tradeDao.selectTradeList(paging);
	}

	@Override
	public Object getTradeDetail(int tradeNo) {
		return tradeDao.selectTradeByTradeNo(tradeNo);
	}

	@Override
	public List<Object> getTradeCommentDetail(int tradeNo) {
		return tradeDao.selectTradeCommentByTradeNo(tradeNo);
	}

}

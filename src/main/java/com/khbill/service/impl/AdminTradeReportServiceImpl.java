package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminTradeReportDao;
import com.khbill.dto.TradeReport;
import com.khbill.service.face.AdminTradeReportService;
import com.khbill.util.Paging;


@Service
public class AdminTradeReportServiceImpl implements AdminTradeReportService {
	
	@Autowired private AdminTradeReportDao adminTradeReportDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = adminTradeReportDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<TradeReport> getTradeReportList(Paging paging) {
		
		return adminTradeReportDao.selectTradeReportList(paging);
	}

	@Override
	public boolean TradeStatusToY(TradeReport tradeReport) {
		
		adminTradeReportDao.updateTradeReportByStatusY(tradeReport);
		
		if( adminTradeReportDao.selectCntTradeReportByStatusY(tradeReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean TradeStatusToN(TradeReport tradeReport) {
		
		adminTradeReportDao.updateTradeReportByStatusN(tradeReport);
		
		if( adminTradeReportDao.selectCntTradeReportByStatusN(tradeReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void setTradeReportDelete(int i) {
		TradeReport tradeReport = new TradeReport();
		
		tradeReport.setReportNo(i);
		adminTradeReportDao.deleteTradeReportByReportNo(tradeReport);
	}
	
	@Override
	public HashMap<String, Object> getTradeDetail(TradeReport tradeReport) {
		
		return adminTradeReportDao.selectTradeByTradeNo(tradeReport);
	}
	
	@Override
	public List<HashMap<String, Object>> getTradeCommentDetail(int tradeNo) {
		
		return adminTradeReportDao.selectTradeCommentByTradeNo(tradeNo);
	}
}

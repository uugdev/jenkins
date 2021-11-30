package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminAskReportDao;
import com.khbill.dao.face.AskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.AskComment;
import com.khbill.dto.AskReport;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.service.face.AdminAskReportService;
import com.khbill.util.Paging;

@Service
public class AdminAskReportServiceImpl implements AdminAskReportService {

	@Autowired AdminAskReportDao adminAskReportDao;
	@Autowired AskDao askDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = adminAskReportDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<AskReport> getAskReportList(Paging paging) {
		return adminAskReportDao.selectAskReportList(paging);
	}

	@Override
	public boolean AskStatusToY(AskReport askReport) {
		
		adminAskReportDao.updateAskReportByStatusY(askReport);
		
		if( adminAskReportDao.selectCntAskReportByStatusY(askReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean AskStatusToN(AskReport askReport) {
		
		adminAskReportDao.updateAskReportByStatusN(askReport);
		
		if( adminAskReportDao.selectCntAskReportByStatusN(askReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void setAskReportDelete(int i) {
		
		AskReport askReport = new AskReport();
		
		askReport.setReportNo(i);
		adminAskReportDao.deleteAskReportByReportNo(askReport);
		
	}

	@Override
	public HashMap<String, Object> getAskDetail(int askNo) {

		return adminAskReportDao.selectAskByAskNo(askNo);
	}


	@Override
	public List<HashMap<String, Object>> getAskComList(int askNo) {
		
		return askDao.selectAskComCntList();
	}
}

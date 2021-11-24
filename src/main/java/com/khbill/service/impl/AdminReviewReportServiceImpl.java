package com.khbill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.controller.AdminReviewReportService;
import com.khbill.dao.face.AdminReviewReportDao;
import com.khbill.dao.face.ReviewCommentDao;
import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

@Service
public class AdminReviewReportServiceImpl implements AdminReviewReportService {

	@Autowired AdminReviewReportDao adminReviewReportDao;
	@Autowired ReviewCommentDao reviewCommentDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = adminReviewReportDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
}

	@Override
	public List<ReviewReport> getReviewReportList(Paging paging) {
		return adminReviewReportDao.selectReviewReportList(paging);
	}

	@Override
	public boolean ReviewStatusToY(ReviewReport reviewReport) {
	
		adminReviewReportDao.updateReviewReportByStatusY(reviewReport);
		
		if( adminReviewReportDao.selectCntReviewReportByStatusY(reviewReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean ReviewStatusToN(ReviewReport reviewReport) {
		
		adminReviewReportDao.updateReviewReportByStatusN(reviewReport);
		
		if( adminReviewReportDao.selectCntReviewReportByStatusN(reviewReport) > 0 ) {
			return true;
		} else {
			return false;
		}
	}
}

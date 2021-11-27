package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminReviewReportDao;
import com.khbill.dao.face.ReviewCommentDao;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.service.face.AdminReviewReportService;
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

	@Override
	public HashMap<String, Object> getReviewDetail(Review review) {
		
		return adminReviewReportDao.selectReviewByReviewNo(review);
	}

	@Override
	public Item getReviewItem(int itemNo) {

		return adminReviewReportDao.selectItemByItemNo(itemNo);
	}

	@Override
	public File getReviewFile(int fileNo) {
		
		return adminReviewReportDao.selectFileByFile(fileNo);
	}

	@Override
	public List<HashMap<String, Object>> getReviewComList(ReviewComment reviewComment) {

		return reviewCommentDao.selectReviewCommentByReview(reviewComment);
	}

	@Override
	public void setReviewReportDelete(int i) {

		ReviewReport reviewReport = new ReviewReport();
		
		reviewReport.setReportNo(i);
		adminReviewReportDao.deleteReviewReportByReportNo(reviewReport);
	}
}

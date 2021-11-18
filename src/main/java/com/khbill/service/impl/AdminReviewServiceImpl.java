package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminReviewDao;
import com.khbill.dao.face.ReviewCommentDao;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.service.face.AdminReviewService;
import com.khbill.util.Paging;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {

private static final Logger logger = LoggerFactory.getLogger(AdminReviewServiceImpl.class);
	
	@Autowired AdminReviewDao adminReviewDao;
	@Autowired ReviewCommentDao reviewCommentDao;
	
	@Autowired private ServletContext context;
	
	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = adminReviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Review> getReviewList(Paging paging) {
		return adminReviewDao.selectReviewList(paging);
	}

	@Override
	public HashMap<String, Object> getReviewDetail(Review review) {
		
		adminReviewDao.updatehit(review); //조회수 증가
		
		return adminReviewDao.selectReviewByReviewNo(review);
	}

	@Override
	public Item getReviewItem(int itemNo) {
		
		return adminReviewDao.selectItemByItemNo(itemNo);
	}

	@Override
	public com.khbill.dto.File getReviewFile(int fileNo) {
		
		return adminReviewDao.selectFileByFile(fileNo);
	}

	@Override
	public List<HashMap<String, Object>> getReviewComList(ReviewComment reviewComment) {
		
		return reviewCommentDao.selectReviewCommentByReview(reviewComment);
	}

	@Override
	public void setReviewDelete(int i) {
		
		Review review = new Review();
		
		review.setReviewNo(i);
		adminReviewDao.selectReviewByReviewNo(review);
		
		Item item = new Item();
		com.khbill.dto.File file = new com.khbill.dto.File();

		item.setItemNo(review.getItemNo());
		file.setFileNo(item.getFileNo());

		int fileNo = file.getFileNo();

		adminReviewDao.deleteReport(i);
		adminReviewDao.deleteScrap(i);
		adminReviewDao.deleteReview(i);
		adminReviewDao.deleteFile(fileNo);
	}

	@Override
	public void setReviewCommentDelete(int i) {
		
		Review review = new Review();
		
		review.setReviewNo(i);
		adminReviewDao.deleteReviewCommentByReviewNo(review);
	}

	@Override
	public boolean deleteReviewComment(ReviewComment reviewComment) {
		adminReviewDao.deleteReviewComment(reviewComment);
		
		if( adminReviewDao.selectCountComment(reviewComment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	
}

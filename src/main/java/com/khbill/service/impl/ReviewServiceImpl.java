package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ReviewCommentDao;
import com.khbill.dao.face.ReviewDao;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired ReviewDao reviewDao;
	@Autowired ReviewCommentDao reviewCommentDao;
	
	@Autowired private ServletContext context;
	

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = reviewDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<Review> getReviewList(Paging paging) {		
		return reviewDao.selectReviewList(paging);
	}

	@Override
	public HashMap<String, Object> getReviewDetail(Review review) {
		
		reviewDao.updatehit(review); //조회수 증가
		
		return reviewDao.selectReviewByReviewNo(review);
	}

	@Override
	public Item getReviewItem(int itemNo) {
		
		return reviewDao.selectItemByItemNo(itemNo);
	}

	@Override
	public File getReviewFile(int fileNo) {
		
		return reviewDao.selectFileByFileNo(fileNo);
	}

	@Override
	public void setReviewCommentWrite(ReviewComment reviewComment) {	
		reviewCommentDao.insertReviewComment(reviewComment);
	}

	@Override
	public List<ReviewComment> getReviewComList(Review review) {

		return reviewCommentDao.selectReviewCommentByReview(review);
	}

	@Override
	public boolean deleteReviewComment(ReviewComment reviewComment) {
		
		reviewCommentDao.deleteReviewComment(reviewComment);
		
		if( reviewCommentDao.selectCountComment(reviewComment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	
}

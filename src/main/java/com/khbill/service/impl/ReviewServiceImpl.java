package com.khbill.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ReviewDao;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired ReviewDao reviewDao;
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
	public Review getReviewDetail(Review detailReview) {
		
		reviewDao.updatehit(detailReview); //조회수 증가
		
		return reviewDao.selectReviewByReviewNo(detailReview);
	}

	@Override
	public Item getReviewItem(int itemNo) {
		
		return reviewDao.selectItemByItemNo(itemNo);
	}

	@Override
	public File getReviewFile(int fileNo) {
		
		return reviewDao.selectFileByFileNo(fileNo);
	}

	
}

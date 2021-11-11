package com.khbill.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ReviewDao;
import com.khbill.dto.Review;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewDao reviewDao;
	@Autowired private ServletContext context;
	
	@Override
	public List<Review> getReviewList(Paging paging) {
		
		return reviewDao.selectReviewList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = reviewDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());

		return paging;
	}
	
}

package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.MypageDao;
import com.khbill.dto.Ask;
import com.khbill.dto.Review;
import com.khbill.dto.Trade;
import com.khbill.service.face.MypageService;
import com.khbill.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired MypageDao mypageDao;
	
	@Override
	public Paging getMyAskPaging(Paging paramData, int userNo) {
		
		int totalCount = mypageDao.selectCntMyAskAll(userNo);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Ask> getMyAskList(HashMap<String, Object> map) {
		return mypageDao.selectAskListByUserNo(map);
	}
	
	@Override
	public Paging getMyReviewPaging(Paging paramData, int userNo) {
		
		int totalCount = mypageDao.selectCntMyReviewAll(userNo);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Review> getMyReviewList(HashMap<String, Object> map) {
		return mypageDao.selectReviewListByUserNo(map);
	}
	
	@Override
	public Paging getMyTradePaging(Paging paramData, int userNo) {

		int totalCount = mypageDao.selectCntMyTradeAll(userNo);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
		
	}
	
	@Override
	public List<Trade> getMyTradeList(HashMap<String, Object> map) {
		return mypageDao.selectTradeListByUserNo(map);
	}

}

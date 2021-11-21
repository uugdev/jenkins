package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.Review;
import com.khbill.dto.Trade;
import com.khbill.util.Paging;

public interface MypageService {

	/**
	 * 작성한 질문글에 대한 페이징 객체
	 * 
	 * @param paramData - curPage를 저장하고 있는 객체
	 * @param userNo - 세션에 저장되어 있는 유저 번호
	 * @return 페이징 객체
	 */
	public Paging getMyAskPaging(Paging paramData, int userNo);

	/**
	 * 유저 번호로 작성한 질문글 리스트 가져온다
	 * 
	 * @param map
	 * @return 질문글 리스트
	 */
	public List<Ask> getMyAskList(HashMap<String, Object> map);
	
	/**
	 * 
	 * 
	 * @param paramData
	 * @param userNo
	 * @return
	 */
	public Paging getMyAskScrapPaging(Paging paramData, int userNo);
	
	/**
	 *
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> getMyAskScrapList(HashMap<String, Object> map);
	
	/**
	 * 작성한 후기글에 대한 페이징 객체
	 * 
	 * @param paramData - curPage를 저장하고 있는 객체
	 * @param userNo - 세션에 저장되어 있는 유저 번호
	 * @return 페이징 객체
	 */
	public Paging getMyReviewPaging(Paging paramData, int userNo);

	/**
	 * 유저 번호로 작성한 후기글 리스트 가져온다
	 * 
	 * @param map
	 * @return 후기글 리스트
	 */
	public List<Review> getMyReviewList(HashMap<String, Object> map);
	
	public Paging getMyReviewScrapPaging(Paging paramData, int userNo);
	
	public List<HashMap<String, Object>> getMyReviewScrapList(HashMap<String, Object> map);


	/**
	 * 작성한 거래글에 대한 페이징 객체
	 * 
	 * @param paramData - curPage를 저장하고 있는 객체
	 * @param userNo - 세션에 저장되어 있는 유저 번호
	 * @return 페이징 객체
	 */
	public Paging getMyTradePaging(Paging paramData, int userNo);

	/**
	 * 유저 번호로 작성한 거래글 리스트 가져온다
	 * 
	 * @param map
	 * @return 거래글 리스트
	 */
	public List<Trade> getMyTradeList(HashMap<String, Object> map);

	public Paging getMyTradeScrapPaging(Paging paramData, int userNo);

	public List<HashMap<String, Object>> getMyTradeScrapList(HashMap<String, Object> map);

	public Paging getMyAskCommentPaging(Paging paramData, int userNo);

	public List<HashMap<String, Object>> getMyAskCommentList(HashMap<String, Object> map);

	public Paging getMyReviewCommentPaging(Paging paramData, int userNo);

	public List<HashMap<String, Object>> getMyReviewCommentList(HashMap<String, Object> map);

	public Paging getMyTradeCommentPaging(Paging paramData, int userNo);

	public List<HashMap<String, Object>> getMyTradeCommentList(HashMap<String, Object> map);


	


	
}

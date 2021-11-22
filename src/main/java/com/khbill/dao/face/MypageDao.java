package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Ask;
import com.khbill.dto.Review;
import com.khbill.dto.Trade;

public interface MypageDao {
	
	/**
	 * 내가 작성한 질문글의 개수를 센다
	 * 
	 * @param userNo - 유저 번호
	 * @return 작성한 질문글 총 개수
	 */
	public int selectCntMyAskAll(int userNo);

	/**
	 * 유저번호로 작성한 질문글 리스트 받아오기
	 * 
	 * @param map - 유저번호, 페이징
	 * @return 질문글 리스트
	 */
	public List<Ask> selectAskListByUserNo(HashMap<String, Object> map);
	
	/**
	 * 
	 * 
	 * @param userNo
	 * @return
	 */
	public int selectCntMyAskScrapAll(int userNo);

	/**
	 * 
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectAskScrapListByUserNo(HashMap<String, Object> map);
	
	/**
	 * 내가 작성한 후기의 개수를 센다
	 * 
	 * @param userNo - 유저 번호
	 * @return 작성한 후기글 총 개수
	 */
	public int selectCntMyReviewAll(int userNo);
	
	/**
	 * 유저번호로 작성한 후기글 리스트 받아오기
	 * 
	 * @param map - 유저번호, 페이징
	 * @return 후기글 리스트
	 */
	public List<Review> selectReviewListByUserNo(HashMap<String, Object> map);
	
	public int selectCntMyReviewScrapAll(int userNo);
	
	public List<HashMap<String, Object>> selectReviewScrapListByUserNo(HashMap<String, Object> map);
	
	/**
	 * 내가 작성한 거래글의 개수를 센다
	 * 
	 * @param userNo - 유저 번호
	 * @return 작성한 거래글 총 개수
	 */
	public int selectCntMyTradeAll(int userNo);

	/**
	 * 유저번호로 작성한 거래글 리스트 받아오기
	 * 
	 * @param map - 유저번호, 페이징
	 * @return 거래글 리스트
	 */
	public List<Trade> selectTradeListByUserNo(HashMap<String, Object> map);

	public int selectCntMyTradeScrapAll(int userNo);

	public List<HashMap<String, Object>> selectTradeScrapListByUserNo(HashMap<String, Object> map);

	public int selectCntMyAskCommentAll(int userNo);

	public List<HashMap<String, Object>> selectAskCommentListByUserNo(HashMap<String, Object> map);

	public int selectCntMyReviewCommentAll(int userNo);

	public List<HashMap<String, Object>> selectReviewCommentListByUserNo(HashMap<String, Object> map);

	public int selectCntMyTradeCommentAll(int userNo);

	public List<HashMap<String, Object>> selectTradeCommentListByUserNo(HashMap<String, Object> map);

	public void deleteAskComByAskComNo(int askComNo);

	public void deleteReviewComByReviewComNo(int reviewComNo);

	public void deleteTradeComByTradeComNo(int tradeComNo);

	public void deleteAskScrapByScrapNo(int scrapNo);

	public void deleteReviewScrapByScrapNo(int scrapNo);

	public void deleteTradeScrapByScrapNo(int scrapNo);




	


}

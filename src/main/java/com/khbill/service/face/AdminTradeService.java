package com.khbill.service.face;

import java.util.HashMap;

public interface AdminTradeService {
	
	/**
	 * tradeNo에 해당하는 거래 게시글 상세조회
	 * 
	 * @param tradeNo - 조회한 게시글 번호
	 * @return tradeNo에 해당하는 거래 게시글 HashMap
	 */
	public HashMap<String, String> getTradeDetail(int tradeNo);
	

}

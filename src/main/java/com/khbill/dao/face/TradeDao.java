package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.File;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.util.Paging;

public interface TradeDao {
	
	public List<Trade> selectTradeList(Paging paging);

	public int selectCntAll(Paging paramData);

	public Object selectTradeByTradeNo(int tradeNo);

	public List<Object> selectTradeCommentByTradeNo(int tradeNo);

	public int insertFile(File tradeFile);

	public int selectFileNo();

	public void insertTrade(Trade trade);

	public void updateHit(int tradeNo);

	public void insertTradeComment(TradeComment tradeComment);

	public void deleteTradeComment(int tradeComNo);

	public int selectCountTradeComment(int tradeComNo);



}

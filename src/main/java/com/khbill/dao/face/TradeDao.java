package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Trade;
import com.khbill.util.Paging;

public interface TradeDao {
	
	public List<Trade> selectTradeList(Paging paging);

	public int selectCntAll();

}

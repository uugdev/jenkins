package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Trade;
import com.khbill.util.Paging;

public interface AdminTradeService {

	public Paging getPaging(Paging paramData);

	public List<Trade> getTradeList(Paging paging);

}

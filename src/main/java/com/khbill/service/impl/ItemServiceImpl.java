package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ItemDao;
import com.khbill.dto.Item;
import com.khbill.service.face.ItemService;
import com.khbill.util.Paging;

@Service
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);

	@Autowired ItemDao itemDao;
	
	@Override
	public int getAskNoByItemNo(Item item) {
		return itemDao.selectAskNoByItemNo(item);
	}
	
	@Override
	public void setItemStatus(int askNo) {
		
		int votePeriod = itemDao.selectCntVoteInProgress(askNo);
		logger.info("votePeriod : {}", votePeriod);
		
		if(votePeriod >= 1) { //투표가 진행중
			
			itemDao.updateVoteEndToSysdate(askNo);
			
			int itemNo = itemDao.selectItemNoByAskNo(askNo);
			
			itemDao.updateItemStatusToY(itemNo);
			
		} else { //투표가 끝났음
			
			int itemNo = itemDao.selectItemNoByAskNo(askNo);
			
			itemDao.updateItemStatusToY(itemNo);
			
		}
		
	}
	

	
	@Override
	public List<HashMap<String, Object>> getItemList(HashMap<String, Object> map) {
		return itemDao.selectItemListByUserNo(map);
	}

	@Override
	public Paging getPaging(Paging paramData, int userNo) {
		//총 게시글 수 조회
		int totalCount = itemDao.selectItemCntAll(userNo);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

		
		
}
	



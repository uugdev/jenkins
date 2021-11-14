package com.khbill.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ItemDao;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.service.face.ItemService;

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
			
		} else {
			
			int itemNo = itemDao.selectItemNoByAskNo(askNo);
			
			itemDao.updateItemStatusToY(itemNo);
			
		}
		
		
		
	}
	
	@Override
	public List<String> getOkList(List<Item> itemList, List<Review> reviewList) {
		
		List<String> okList =  new ArrayList<String>();
		
		for(int i=0; i<itemList.size(); i++) {

			int count = 0;

			for(int j=0; j<reviewList.size(); j++) {

				if(itemList.get(i).getItemNo() == reviewList.get(j).getItemNo()) {
					okList.add("not empty");
					count = 1;
				}
			}

			if(count == 0) {
				okList.add("empty");
			}
		}
		return okList;
	}

		
		
}
	



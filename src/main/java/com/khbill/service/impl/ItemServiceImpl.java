package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ItemDao;
import com.khbill.dto.Item;
import com.khbill.dto.User;
import com.khbill.dto.Vote;
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
	public void setItemStatus(int askNo, String status) {
		
		int votePeriod = itemDao.selectCntVoteInProgress(askNo);
		logger.info("votePeriod : {}", votePeriod);
		
		if(votePeriod >= 1) { //투표가 진행중
			
			itemDao.updateVoteEndToSysdate(askNo);
			
			int itemNo = itemDao.selectItemNoByAskNo(askNo);
			
			Item item = new Item();
			item.setItemNo(itemNo);
			item.setItemStatus(status);
			
			itemDao.updateItemStatus(item);
			
		} else { //투표가 끝났음
			
			int itemNo = itemDao.selectItemNoByAskNo(askNo);
			
			Item item = new Item();
			item.setItemNo(itemNo);
			item.setItemStatus(status);
			
		}
		
		//투표한 회원들에게 점수 부여하기
		Vote vote = new Vote();
		vote.setAskNo(askNo);
		vote.setVoteState(status);
		
		List<User> list = itemDao.selectCorrectUser(vote);
		System.out.println(list);
		
		for(User u : list) {
			itemDao.updateUserPoint(u);
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
	



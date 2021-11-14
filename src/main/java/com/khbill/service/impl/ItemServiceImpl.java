package com.khbill.service.impl;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.ItemDao;
import com.khbill.dto.Item;
import com.khbill.service.face.ItemService;

@Service
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);

	@Autowired ItemDao itemDao;

	@Override
	public void setItemStatus(Item item) {
		
		//먼저 vote마감일과 sysdate을 비교함
		
		//투표기간 비교
		
		
	}
	

}

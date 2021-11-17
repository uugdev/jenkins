package com.khbill.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AccountDao;
import com.khbill.dto.Item;
import com.khbill.service.face.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	private static final Logger logger = LoggerFactory.getLogger(AccountService.class);
	
	@Autowired
	AccountDao accountDao;
	
	
	
	@Override
	public List<Item> getItemListByLoginUserNo(int userNo) {

		return accountDao.selectItemStatus(userNo);
	}
	
}

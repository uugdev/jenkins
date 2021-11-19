package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AccountDao;
import com.khbill.dto.Item;
import com.khbill.dto.User;
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
	
	
	
	@Override
	public User getUserInfo(int userNo) {
		return accountDao.selectUserByUserNo(userNo);
	}
	
	
	@Override
	public void setUpdateExtraMoney(int userNo, int money) {

		User user = new User();
		user.setUserNo(userNo);
		user.setExtraMoney(money);
		accountDao.updateExtraMoney(user);
		
	}
	
	
	@Override
	public List<HashMap<String,Object>> getUserItemSum(int userNo) {
		return accountDao.selectItemSum(userNo);
	}
	
	
	@Override
	public int getitemSumMon(int userNo) {
		return accountDao.selectItemListMonSumUserNo(userNo);
	}
	
	@Override
	public List<Item> getItemListByMon(int userNo) {
		
		return accountDao.selectUserMonItemList(userNo);
	}
	
	
	
	
	
}

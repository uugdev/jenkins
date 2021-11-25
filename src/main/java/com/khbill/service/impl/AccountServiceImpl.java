package com.khbill.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	public List<HashMap<String, Object>> getUserItemSum(int userNo) {
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

	@Override
	public int getCompareItemSum(int userNo) {
		return accountDao.selectLastMonItemSum(userNo);
	}

	@Override
	public String AddDate(String strDate, int year) {

		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date dt;
		try {
			dt = dtFormat.parse(strDate);
			cal.setTime(dt);
			cal.add(Calendar.YEAR, year);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		return dtFormat.format(cal.getTime());
	}

}

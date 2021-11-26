package com.khbill.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminUserDao;
import com.khbill.dto.User;
import com.khbill.service.face.AdminUserService;
import com.khbill.util.Paging;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	private static final Logger logger = LoggerFactory.getLogger(AdminUserServiceImpl.class);
	@Autowired AdminUserDao adminUserDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = adminUserDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public List<User> getUserlist(Paging paging) {
		return adminUserDao.selectUserList(paging);
	}

	@Override
	public void setUserDelete(int i) {
		adminUserDao.deleteUser(i);
	}

	@Override
	public Date setUnablePeriod(int userNo, int days) {
//		logger.info("parameters : userNo={}, days={}", userNo, days);
		int param1 = days;
		int param2 = userNo;
		adminUserDao.updateUnablePeriod(param1, param2);
		Date date = adminUserDao.selectUnablePeriod(userNo);
		logger.info("date: {}", date);
		return date;
	}

	@Override
	public String setUnablePeriodNull(int userNo) {
		adminUserDao.updateUnablePeriodNull(userNo);
		
		Date check = adminUserDao.selectUnablePeriod(userNo);
		if(check == null) {
//			logger.info("isNull");
			return "isNull";
		} else {
//			logger.info("isNotNull : {}", check);
			return "isNotNull";
		}
	}
	
}

package com.khbill.service.impl;

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

}

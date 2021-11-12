package com.khbill.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminLoginDao;
import com.khbill.dto.Admin;
import com.khbill.service.face.AdminLoginService;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired AdminLoginDao adminLoginDao;
	@Override
	public boolean isLogin(Admin admin) {
		
		int i = adminLoginDao.countLoginInfo(admin);
		
		if( i == 1 ) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public Admin getAdminInfo(Admin admin) {
		return adminLoginDao.selectAdminByAdminInfo(admin);
	}

	
}

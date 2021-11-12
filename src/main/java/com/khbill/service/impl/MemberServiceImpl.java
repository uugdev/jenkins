package com.khbill.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.MemberDao;
import com.khbill.dto.User;
import com.khbill.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired MemberDao memberDao;
	
	@Override
	public boolean isLogin(User user) {
		
		int i = memberDao.countLoginInfo(user);
		
		if( i == 1 ) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public User getUserInfo(User user) {
		return memberDao.selectUserByUserInfo(user);
	}

	@Override
	public void join(User user) {
		memberDao.insertMember(user);
	}
	
	@Override
	public int getUserNo(String userNick) {
		return memberDao.selectUserNoByUserNick(userNick);
		
	}

	@Override
	public boolean checkUserId(User user) {
		int check = memberDao.countUserIdDupl(user);
		
		if( check <= 0 ) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean checkUserNick(User user) {
		int check = memberDao.countUserNickDupl(user);
		
		if( check <= 0 ) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public String getUserNickByUserNo(int msgUserNo) {
		return memberDao.selectUserNickByUserNo(msgUserNo);
	}
}

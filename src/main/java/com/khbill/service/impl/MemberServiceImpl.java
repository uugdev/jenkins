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
	public int checkUserId(String userId) {
		int check = memberDao.countUserIdDupl(userId);
		return check;
	}

	@Override
	public int checkUserNick(String userNick) {
		int check = memberDao.countUserNickDupl(userNick);
		return check;
	}
	
	@Override
	public String getUserNickByUserNo(int msgUserNo) {
		return memberDao.selectUserNickByUserNo(msgUserNo);
	}
	
	
	@Override
	public User getUserByUserNo(int userNo) {
		return memberDao.selectUserByUserNo(userNo);
	}
	
	@Override
	public void setUserUpdate(User user) {
		memberDao.updateUserInfo(user);
	}
	
	@Override
	public void setUserDelete(int userNo) {
		memberDao.deleteUser(userNo);
	}
	
	@Override
	public int checkUserExists(String userNick) {
		return memberDao.selectUserCntByUserNick(userNick);
	}
	
}

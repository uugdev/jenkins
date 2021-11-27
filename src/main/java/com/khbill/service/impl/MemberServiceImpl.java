package com.khbill.service.impl;

import java.util.UUID;

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

	@Override
	public int checkUserMail(String userMail) {
		return memberDao.selectUserCntByUserMail(userMail);
	}

	@Override
	public User getUserByUserMail(String kakaoEmail) {
		return memberDao.selectUserByUserMail(kakaoEmail);
	}

	@Override
	public void joinKakao(User user) {
		String kakaoid = "kakao-"+UUID.randomUUID().toString().split("-")[3]+UUID.randomUUID().toString().split("-")[1].substring(0, 4);
		String kakaopw = UUID.randomUUID().toString().split("-")[2]+UUID.randomUUID().toString().split("-")[4];
		System.out.println("kakaoid = " + kakaoid);
		System.out.println("kakaopw = " + kakaopw);
		user.setUserId(kakaoid);
		user.setUserPw(kakaopw);
		
		memberDao.insertMember(user);
	}

	@Override
	public void setUserTempPwUpdate(User tempUser) {
		memberDao.updateUserTempPw(tempUser);
	}
	
	@Override
	public User getUserByUserNick(String userNick) {
		return memberDao.selectUserByUserNick(userNick);
	}

	
}

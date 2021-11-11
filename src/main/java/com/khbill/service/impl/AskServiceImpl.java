package com.khbill.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AskDao;
import com.khbill.dto.Ask;
import com.khbill.dto.User;
import com.khbill.service.face.AskService;
import com.khbill.util.Paging;

@Service
public class AskServiceImpl implements AskService {

	
	@Autowired AskDao askDao;
	@Autowired private ServletContext context;

	@Override
	public List<Ask> getAskList(Paging paging) {
		return askDao.selectAskList(paging);
	}
	
	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = askDao.selectCntAll(paramData);
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
				
		return paging;
		}	
	
	
	@Override
	public User getUserInfoByUserNo(int userNo) {
	
		User user = askDao.selectUserInfo(userNo);
		
		return user;
	}
	

	@Override
	public List<User> getUserList() {

		List<User> user = askDao.selectUserList();
		
		return user;
	}
	
	
	
	
	
}//class

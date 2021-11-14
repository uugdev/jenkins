package com.khbill.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminNoticeDao;
import com.khbill.dto.Notice;
import com.khbill.service.face.AdminNoticeService;
import com.khbill.util.Paging;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeServiceImpl.class);
	@Autowired AdminNoticeDao adminNoticeDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		int totalCount = adminNoticeDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public List<Notice> getNoticeList(Paging paging) {
		List<Notice> list = adminNoticeDao.selectNoticeList(paging);
		return list;
	}

}

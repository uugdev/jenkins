package com.khbill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.NoticeDao;
import com.khbill.dto.Notice;
import com.khbill.service.face.NoticeService;
import com.khbill.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired private NoticeDao noticeDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		int totalCount = noticeDao.selectCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
		
	}
	
	@Override
	public List<Notice> getNoticeList(Paging paging) {
		return noticeDao.selectNoticeList(paging);
	}
	
	@Override
	public Notice getNoticeDetail(Notice notice) {
		noticeDao.updateHit(notice);
		
		return noticeDao.selectNoticeByNoticeNo(notice);
	}
	

}

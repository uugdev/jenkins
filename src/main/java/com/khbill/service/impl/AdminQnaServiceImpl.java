package com.khbill.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.AdminQnaDao;
import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.service.face.AdminQnaService;
import com.khbill.util.Paging;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	private static final Logger logger = LoggerFactory.getLogger(AdminQnaServiceImpl.class);
	@Autowired AdminQnaDao adminQnaDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		int totalCount = adminQnaDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public List<Qna> getQnaList(Paging paging) {
		return adminQnaDao.selectQnaList(paging);
	}

	@Override
	public Qna getQnaDetail(int qnaNo) {
		return adminQnaDao.selectQnaDetail(qnaNo);
	}

	@Override
	public QnaComment getQnaComment(int qnaNo) {
		return adminQnaDao.selectQnaComment(qnaNo);
	}

	@Override
	public String getNickByUserNo(int userNo) {
		return adminQnaDao.selectNickByUserNo(userNo);
	}

	@Override
	public void setQnaDelete(int i) {
		adminQnaDao.deleteQna(i);
	}

	@Override
	public void setQnaCommentWrite(QnaComment qnaComment) {
		adminQnaDao.insertQnaComment(qnaComment);
		adminQnaDao.updateQnaStatusToY(qnaComment.getQnaNo());
	}

	@Override
	public void setQnaCommentUpdate(QnaComment qnaComment) {
		adminQnaDao.updateQnaComment(qnaComment);
	}

	@Override
	public void setQnaCommentDelete(int qnaNo) {
		adminQnaDao.deleteQnaComment(qnaNo);
		adminQnaDao.updateQnaStatusToN(qnaNo);
	}

	@Override
	public List<Qna> getQnaStatusList(Paging paging) {
		return adminQnaDao.selectQnaListStatus(paging);
	}


}
